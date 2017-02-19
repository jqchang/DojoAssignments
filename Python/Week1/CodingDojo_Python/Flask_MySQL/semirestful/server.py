from flask import Flask, request, redirect, render_template, flash
from mysqlconnection import MySQLConnector
from datetime import datetime
import re

app = Flask(__name__)
app.secret_key = "semirestfulusers"
mysql = MySQLConnector(app, "usersdb")


def is_valid(data):
    errors = False
    # First Name - letters only, at least 2 characters and that it was submitted
    if len(data["first_name"]) == 0:
        flash("Please enter a first name.", "messages")
        flash("*", "first_name")
    else:
        if not re.search(r"^[A-Za-z]+$", data["first_name"]):
            flash("Name must contain only letters.", "messages")
            flash("*", "fname")
            errors = True
            errors = True
        if len(data["first_name"]) < 2 or len(data["first_name"]) > 45:
            flash("First name must be between 2-45 characters.", "messages")
            flash("*", "fname")
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
    if not re.search(r"^[A-Za-z0-9]+@[A-Za-z0-9]+.[A-Za-z0-9]+$", data["email"]):
        flash("Invalid email address.", "messages")
        flash("*", "email")
        errors = True
    if "id" in data:
        if mysql.query_db("SELECT email FROM users WHERE email=\"{}\" AND NOT id=\"{}\"".format(data["email"], data["id"])):
            flash("Email address "+data["email"]+" is already registered.", "messages")
            flash("*", "email")
            errors = True
    else:
        if mysql.query_db("SELECT email FROM users WHERE email=\"{}\"".format(data["email"])):
            flash("Email address "+data["email"]+" is already registered.", "messages")
            flash("*", "email")
            errors = True
    return not errors

@app.route('/users', methods=['GET'])
def users():
    userlist = mysql.query_db("SELECT id, first_name, last_name, email, created_at FROM users")
    for user in userlist:
        user["created_at"] = datetime.strftime(user["created_at"], "%B %d, %Y")
    return render_template('index.html', userlist=userlist)

@app.route('/users/new', methods=['GET'])
def newuser():
    return render_template('create.html')

@app.route('/users/<id>/edit', methods=['GET'])
def edit(id):
    data = mysql.query_db("SELECT id, first_name, last_name, email, created_at FROM users WHERE id={} LIMIT 1".format(id))[0]
    return render_template('edit.html', user=data)

@app.route('/users/<id>', methods=['GET'])
def retrieve(id):
    data = mysql.query_db("SELECT id, first_name, last_name, email, created_at FROM users WHERE id={} LIMIT 1".format(id))[0]
    data["created_at"] = datetime.strftime(data["created_at"], "%B %d, %Y")
    return render_template('retrieve.html', user=data)

@app.route('/users/create', methods=['POST'])
def create():
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    email = request.form["email"]
    data = {
        "first_name":first_name,
        "last_name":last_name,
        "email":email,
        "new":True
    }
    if is_valid(data):
        mysql.query_db("INSERT INTO users (first_name, last_name, email, created_at, updated_at) VALUES (\"{}\", \"{}\", \"{}\", NOW(), NOW())".format(first_name, last_name, email))
        return redirect('/users')
    else:
        return redirect('/users/create')

@app.route('/users/<id>/destroy', methods=['GET'])
def destroy(id):
    mysql.query_db("DELETE FROM users WHERE id={}".format(id))
    return redirect('/users')

@app.route('/users/<id>', methods=['POST'])
def update(id):
    data = {
        "first_name": request.form["first_name"],
        "last_name": request.form["last_name"],
        "email": request.form["email"],
        "id": id
    }
    if is_valid(data):
        mysql.query_db("UPDATE users SET first_name=\"{}\", last_name=\"{}\", email=\"{}\", created_at=NOW(), updated_at=NOW() WHERE id={}".format(request.form["first_name"], request.form["last_name"], request.form["email"], id))
        return redirect('/users/'+str(id))
    else:
        return redirect('/users/{}/edit'.format(id))

app.run(debug=True)
