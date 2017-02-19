from flask import Flask, render_template
app=Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html', title="Flask!")

@app.route('/ninjas')
def ninja():
    return render_template('ninja.html', title="Ninjas")

@app.route('/dojos/new')
def dojo():
    return render_template('dojos.html', title="Dojos")

app.run(debug=True)
