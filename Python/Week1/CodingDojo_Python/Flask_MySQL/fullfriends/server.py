from flask import Flask, redirect, request, render_template, flash
from mysqlconnection import MySQLConnector
import re
app = Flask(__name__)
app.secret_key = "fullfriendssecretkey123"
mysql = MySQLConnector(app, "friendsdb")

def invalid(first_name, last_name, user_email):
    errors = False
    if len(first_name) < 1 or len(last_name) < 1:
        flash("Name is too short.")
        errors = True
    if len(user_email) < 1:
        flash("Email is too short.")
        errors = True
    #type validate
    if not re.search(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$", user_email):
        flash("Invalid email address.")
        errors = True
    if not (re.search(r"^[^0-9]*$", first_name) and re.search(r"^[^0-9]*$", last_name)):
        flash("Name cannot contain numbers.")
        errors = True
    return errors

@app.route('/')
def index():
    allfriends = mysql.query_db("SELECT first_name, last_name, email, created_at, id FROM friends")
    return render_template('index.html', allfriends=allfriends)

@app.route('/friends', methods=['POST'])
def create():
    print "CREATE"
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    user_email = request.form["email"]
    errors = False
    data = {
        "first_name":first_name,
        "last_name":last_name,
        "email":user_email
    }
    #validate input
    #length validation
    errors = invalid(first_name, last_name, user_email)
    # all valid add friend to db
    if not errors:
        mysql.query_db("INSERT INTO friends (first_name, last_name, email, created_at) VALUES (:first_name, :last_name, :email, NOW())", data)
    return redirect('/')

@app.route('/friends/<id>', methods=['POST'])
def update(id):
    #update
    #send sql query to update that friend
    print request.form
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    user_email = request.form["email"]
    data = {
        "first_name":first_name,
        "last_name":last_name,
        "email":user_email
    }
    if not invalid(first_name, last_name, user_email):
        mysql.query_db("UPDATE friends SET first_name=:first_name, last_name=:last_name, email=:email, updated_at=NOW() WHERE id="+id, data)
        flash("Changes saved successfully.")
        return redirect('/')
    else:
        redir = '/friends/'+id+'/edit'
        return redirect(redir)

@app.route('/friends/<id>/edit')
def edit(id):
    print "EDIT"
    target = mysql.query_db("SELECT id, first_name, last_name, email, created_at FROM friends WHERE id=:id", {"id":id})
    return render_template('edit.html', friend=target)


@app.route('/friends/<id>/delete', methods=['POST'])
def destroy(id):
    print "DESTROY"
    mysql.query_db("DELETE FROM friends WHERE id=:id", {"id":id})
    return redirect('/')

app.run(debug=True)
