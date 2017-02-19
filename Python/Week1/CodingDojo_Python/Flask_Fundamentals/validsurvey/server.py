from flask import Flask, render_template, request, redirect, flash
app = Flask(__name__)
app.secret_key="lol"
name, location, language, comment = "","","",""

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def read_form():
    name = request.form['name']
    location = request.form['location']
    language = request.form['language']
    comment = request.form['comment']
    if len(name) < 1:
        flash("Name too short!")
    if len(comment) < 1:
        flash("Please enter a comment!")
    if len(comment) > 120:
        flash("Comment must be shorter than 120 characters!")
    # print name, location, language, comment
    # return redirect("/result")
    return render_template("result.html", name=name, location=location, language=language, comment=comment)

# @app.route('/result')
# def result():
#     print "vars:", name, location, language, comment
#     return render_template('result.html')

app.run(debug=True)
