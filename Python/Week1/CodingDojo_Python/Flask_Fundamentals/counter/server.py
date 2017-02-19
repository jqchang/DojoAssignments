from flask import Flask, render_template, redirect, request, session
app = Flask(__name__)
app.secret_key = "CounterSecretKey"

@app.route("/")
def index():
    if 'count' in session:
        session['count'] += 1
    else:
        session['count'] = 0
    return render_template("index.html", count=session['count'])
    # return render_template("index.html", count="default")

@app.route("/turbo", methods=["POST"])
def count():
    session['count'] += 1
    return redirect("/")

@app.route("/reset", methods=["POST"])
def reset():
    session['count'] = 0
    return redirect("/")

# @app.route("/show")
# def showcount():
#

app.run(debug=True)
