from flask import Flask, request, render_template, redirect, session, flash
from mysqlconnection import MySQLConnector
from flask.ext.bcrypt import Bcrypt
from datetime import datetime, timedelta;
#from datetime import datetime
import re
app = Flask(__name__)
app.secret_key = "BuildTheWall2016"
bcrypt = Bcrypt(app)
mysql = MySQLConnector(app, 'thewall')

#LOGOUT_TIMER = 0 --- not implemented yet

def is_valid(data):
    errors = False
    # First Name - letters only, at least 2 characters and that it was submitted
    if len(data["first_name"]) == 0:
        flash("Please enter a first name.", "messages")
        flash("*", "first_name")
        errors = True
    else:
        if not re.search(r"^[A-Za-z]+$", data["first_name"]):
            flash("Name must contain only letters.", "messages")
            flash("*", "fname")
            errors = True
        if len(data["first_name"]) < 2 or len(data["first_name"]) > 45:
            flash("First name must be between 2-45 characters.", "messages")
            flash("*", "fname")
            errors = True
    # Last Name - letters only, at least 2 characters and that it was submitted
    if len(data["last_name"]) == 0:
        flash("Please enter a last name.", "messages")
        flash("*", "last_name")
        errors = True
    else:
        if not re.search(r"^[A-Za-z]+$", data["last_name"]):
            flash("Name must contain only letters.", "messages")
            flash("*", "lname")
            errors = True
        if len(data["last_name"]) < 2 or len(data["last_name"]) > 45:
            flash("Last name must be between 2-45 characters.", "messages")
            flash("*", "lname")
            errors = True
    # Email - Valid Email format, and that it was submitted %also check if unique
    if len(data["email"]) == 0:
        flash("Please enter an email address.", "messages")
        flash("*", "email")
        errors = True
    if not re.search(r"^[A-Za-z]+@[A-Za-z]+.[A-Za-z]+$", data["email"]):
        flash("Invalid email address.", "messages")
        flash("*", "email")
        errors = True
    if mysql.query_db("SELECT email FROM users WHERE email=\"{}\"".format(data["email"])):
        flash("Email address "+data["email"]+" is already registered.", "messages")
        flash("*", "email")
        errors = True
    # Password - at least 8 characters, and that it was submitted
    if len(data["password"]) == 0:
        flash("Please enter a password.", "messages")
        flash("*", "password")
        errors = True
    elif len(data["password"]) < 8:
        flash("Password must be 8 or more characters.", "messages")
        flash("*", "password")
        errors = True
    # Password Confirmation - matches password
    match = bcrypt.check_password_hash(data["pw_hash"], data["confirm"])
    if not match:
        flash("Passwords do not match", "messages")
        flash("*","password")
        flash("*","confirmpw")
        errors = True
    return not errors

@app.route('/', methods=['GET'])
def index():
    if "id" in session:
        return redirect('/wall')
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def find_user():
    query = "SELECT id, pw_hash FROM users WHERE email=\"{}\" LIMIT 1".format(request.form["login_id"])
    match = mysql.query_db(query);
    if match:
        if bcrypt.check_password_hash(match[0]['pw_hash'],request.form["login_pw"]):
            session["id"] = match[0]['id']
            return redirect ('/wall')
        else:
            flash("Invalid email/password combination", "loginmsg")
            return redirect('/')
    else:
        flash("Invalid email/password combination", "loginmsg")
        return redirect('/')

@app.route('/register', methods=['POST'])
def register():
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    password = request.form["password"]
    pw_hash = bcrypt.generate_password_hash(password)
    confirm = request.form["confirmpw"]
    email = request.form["email"]
    data = {
        "first_name":first_name,
        "last_name":last_name,
        "email":email,
        "password":password,
        "pw_hash":pw_hash,
        "confirm":confirm
    }
    if is_valid(data):
        session["id"] = mysql.query_db("INSERT INTO users (first_name, last_name, email, pw_hash, created_at, updated_at) VALUES (:first_name, :last_name, :email, :pw_hash, NOW(), NOW())", data)
        return redirect('/wall')
    else:
        return redirect('/')


@app.route('/wall', methods=['GET'])
def wall():
    if "id" in session:
        user = mysql.query_db("SELECT * FROM users WHERE id={} LIMIT 1;".format(session["id"]))
        messages = mysql.query_db("SELECT messages.id, users.id AS user_id, users.first_name, users.last_name, messages.created_at, messages.content FROM messages JOIN users ON messages.user_id=users.id ORDER BY messages.created_at DESC;")
        for message in messages:
            message_created_time = message["created_at"]
            message["created_at"] = message_created_time.strftime("%B %d, %Y")
            message["enable_edit"] = datetime.now()-message_created_time<timedelta(minutes=30)
            message["comments"] = mysql.query_db("SELECT comments.id, users.id as user_id, users.first_name, users.last_name, comments.created_at, comments.content FROM comments JOIN messages ON comments.message_id=messages.id JOIN users ON comments.user_id=users.id WHERE messages.id={} ORDER BY comments.created_at ASC;".format(message["id"]))
            for comment in message["comments"]:
                comment_created_time = datetime.strptime(comment["created_at"], "%Y-%m-%d %H:%M:%S")
                comment["created_at"] = comment_created_time.strftime("%B %d, %Y")
                comment["enable_edit"] = datetime.now()-comment_created_time<timedelta(minutes=30)
        return render_template("wall.html", user=user[0], messages=messages)
    return redirect('/')

@app.route('/logout', methods=['GET'])
def logout():
    session.pop("id")
    return redirect('/')

@app.route('/message', methods=['POST'])
def message():
    if len(request.form["text"]) > 0:
        mysql.query_db("INSERT INTO messages (user_id, content, created_at, updated_at) VALUES ({}, \"{}\", NOW(), NOW());".format(session["id"],request.form["text"]))
    return redirect('/')

@app.route('/delete/message/<id>', methods=['POST'])
def deletemessage(id):
    mysql.query_db("DELETE FROM messages WHERE id={}".format(id))
    return redirect('/')

@app.route('/edit/message/<id>', methods=['POST'])
def editmessage(id):
    newmessage = request.form["edittext"]
    timediff = datetime.now()-mysql.query_db("SELECT created_at FROM messages WHERE id={}".format(id))[0]["created_at"]
    if len(newmessage) > 0 and timediff < timedelta(minutes=30):
        mysql.query_db("UPDATE messages SET content=\"{}\", updated_at=NOW() WHERE id={}".format(newmessage, id))
    return redirect('/')

@app.route('/delete/comment/<id>', methods=['POST'])
def deletecomment(id):
    mysql.query_db("DELETE FROM comments WHERE id={}".format(id))
    return redirect('/')

@app.route('/edit/comment/<id>', methods=['POST'])
def editcomment(id):
    newcomment = request.form["edittext"]
    timediff = datetime.now()-datetime.strptime(mysql.query_db("SELECT created_at FROM comments WHERE id={}".format(id))[0]["created_at"], "%Y-%m-%d %H:%M:%S")
    print timediff
    if len(newcomment) > 0 and timediff < timedelta(minutes=30):
        mysql.query_db("UPDATE comments SET content=\"{}\", updated_at=NOW() WHERE id={}".format(newcomment, id))
    return redirect('/')

@app.route('/comment/<id>', methods=['POST'])
def comment(id):
    if len(request.form["text"]) > 0:
        mysql.query_db("INSERT INTO comments (user_id, message_id, content, created_at, updated_at) VALUES ({}, {}, \"{}\", NOW(), NOW());".format(session["id"], id, request.form["text"]))
    return redirect('/')

app.run(debug=True)
