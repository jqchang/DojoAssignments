from flask import Flask, render_template, session, request, redirect
import random
app=Flask(__name__)
app.secret_key="NumberGameKey"

@app.route('/')
def index():
    print "index", session
    gamestate = "idle"
    # print session['guess'], session['rand']

    # check uninitialized variables
    if 'rand' not in session:
        session['rand'] = random.randrange(0,101)
    if 'guess' not in session:
        session['guess'] = -1
    if 'win' not in session:
        session['win'] = False

    # set gamestate:
    if 'guess' in session and 'rand' in session:
        gamestate = "active"
        print session['guess'], session['rand']
        if int(session['guess']) == -1:
            gamestate = "idle"
        elif int(session['guess']) > int(session['rand']):
            gamestate = "high"
        elif int(session['guess']) < int(session['rand']):
            gamestate = "low"
        else:
            print session['guess'], session['rand']
            gamestate = "win"
        # guess = rand: win
        # guess < rand: low
        # guess > rand: high
    if 'win' == "True":
        gamestate = "win"
        session['rand'] = random.randrange(0,101)
        session['guess'] = -1
        session['win'] = False

    # gamestate="idle"
    print "gamestate",gamestate
    return render_template('index.html', gamestate=gamestate)

@app.route('/guess', methods=['POST'])
def guess():
    print "guess", session
    if request.form['number']:
        session['guess'] = request.form['number']
    return redirect('/')

@app.route('/reset', methods=['POST'])
def reset():
    session.pop('rand')
    session.pop('win')
    session.pop('guess')
    gamestate = "idle"
    print "Reset!"
    return redirect('/')

app.run(debug=True)
