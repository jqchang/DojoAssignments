from flask import Flask, render_template, request, redirect, session, flash
from mysqlconnection import MySQLConnector
import re
app = Flask(__name__)
app.secret_key = "wipethemwithacloth"
mysql = MySQLConnector(app, "emaillist")

@app.route('/')
def index():
    return render_template("index.html")
@app.route('/submit', methods=["POST"])
def add():
    user_email = request.form["email"]
    query = "SELECT * FROM users WHERE email LIKE :specific_email"
    data = {"specific_email": user_email}
    matches = mysql.query_db(query, data)
    # validate email

    # case 1: invalid email address
    if not re.search("^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$", request.form['email']):
        flash("Invalid email address.", "messages")
    # case 2: email already registered
    elif len(matches) > 0:
        flash("Email is already registered", "messages")
    else:
        query = "INSERT INTO users (email, created_at, update_at) VALUES (:specific_email, NOW(), NOW())"
        session["id"] = mysql.query_db(query, data)
        return redirect('/success')
    return redirect('/')
@app.route('/success')
def success():
    useremail = mysql.query_db("SELECT email FROM users WHERE id="+str(session["id"]))[0]["email"]
    allemails = mysql.query_db("SELECT * FROM users")
    # would it be better to only retrieve the specific pieces of information to pass into jinja?

    return render_template("success.html", allemails=allemails, useremail=useremail)

@app.route('/delete')
def delete():
    # currently set up using sessions to only allow user to delete their own email
    # if intent was for user to be able to delete any, then use jinja to insert links for all users
    # use of {{variable|safe}} would allow tags to be added
    data = {"specific_id": session["id"]}
    mysql.query_db("DELETE FROM users WHERE id=:specific_id", data)
    return redirect('/')
app.run(debug=True)
