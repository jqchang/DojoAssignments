from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return "No ninjas here."

@app.route('/ninja')
def ninja():
    return render_template('index.html',ninja="images/tmnt.png")

@app.route('/ninja/<color>')
def color(color):
    ninjas = {
        "blue":"images/leonardo.jpg",
        "orange":"images/michenangelo.jpg",
        "red":"images/raphael.jpg",
        "purple":"images/donatello.jpg"
    }
    if color not in ["blue", "orange", "red", "purple"]:
        return render_template('index.html',ninja="images/notapril.jpg")
    else:
        return render_template('index.html',ninja=ninjas[color])

app.run(debug=True)
