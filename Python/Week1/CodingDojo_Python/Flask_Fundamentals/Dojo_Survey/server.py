from flask import Flask, render_template, request, redirect
app = Flask(__name__)

name, location, language, comment = "default","default","default","default"

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def read_form():
    name = request.form['name']
    location = request.form['location']
    language = request.form['language']
    comment = request.form['comment']
    # print name, location, language, comment
    # return redirect("/result")
    return render_template("result.html", name=name, location=location, language=language, comment=comment)

# @app.route('/result')
# def result():
#     print "vars:", name, location, language, comment
#     return render_template('result.html')

app.run(debug=True)
