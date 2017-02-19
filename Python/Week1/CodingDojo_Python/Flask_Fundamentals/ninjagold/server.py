from flask import Flask, render_template, request, redirect, session
import random, time
app = Flask(__name__)
app.secret_key = "NinjaGoldJustinChang"

def curtime():
    timestring = "{:04d}/{:02d}/{:02d} {:02d}:{:02d}:{:02d}".format(time.localtime().tm_year, time.localtime().tm_mon, time.localtime().tm_mday, time.localtime().tm_hour, time.localtime().tm_min, time.localtime().tm_sec)
    return timestring

@app.route('/')
def index():
    if 'gold' not in session:
        session['gold'] = 0
    if 'log' not in session:
        session['log'] = ""
    return render_template('index.html', time=curtime())

@app.route('/process_money', methods=['POST'])
def money():
    print request.form['building']
    if request.form['building'] == "farm":
        gain = random.randrange(10,21)
        session['log'] += "("+curtime()+") Went to the farm. Gained "+str(gain)+" gold.<br>"
    elif request.form['building'] == "cave":
        gain = random.randrange(5,10)
        session['log'] += "("+curtime()+") Went to the cave. Gained "+str(gain)+" gold.<br>"
    elif request.form['building'] == "house":
        gain = random.randrange(2,6)
        session['log'] += "("+curtime()+") Went to the house. Gained "+str(gain)+" gold.<br>"
    elif request.form['building'] == "casino":
        gain = random.randrange(-50,51)
        if gain >= 0:
            session['log'] += "("+curtime()+") Entered a casino and won "+str(gain)+" gold.<br>"
        else:
            session['log'] += "<span>("+curtime()+") Entered a casino and lost "+str(-gain)+" gold... Ouch...</span><br>"
    session['gold'] = int(session['gold'])+gain
    return redirect('/')

app.run(debug=True)
