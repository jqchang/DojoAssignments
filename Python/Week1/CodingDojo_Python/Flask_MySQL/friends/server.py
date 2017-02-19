from flask import Flask, request, redirect, render_template, session, flash
from mysqlconnection import MySQLConnector
app = Flask(__name__)
mysql = MySQLConnector(app,'friendsdb')
@app.route('/')
def index():
    friends = mysql.query_db("SELECT * FROM friends")
    print friends
    return render_template('index.html', all_friends = friends)
@app.route('/friends', methods=['POST'])
def create():
    # add a friend to the database!
    friend_id = mysql.query_db("INSERT INTO friends (first_name, last_name, occupation, created_at, updated_at) VALUES (\""+request.form["first_name"]+ "\", \""+ request.form["last_name"] + "\", \"" + request.form["occupation"] + "\", NOW(), NOW());")
    return redirect('/')
app.run(debug=True)
