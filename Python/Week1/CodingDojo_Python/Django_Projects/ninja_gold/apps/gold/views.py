from django.shortcuts import render, redirect
from datetime import datetime
import random

# Create your views here.
def index(request):
    if "money" not in request.session:
        request.session["money"] = 0
    if "log" not in request.session:
        request.session["log"] = ""
    return render(request, 'gold/index.html')

def process(request, location):
    if request.method == 'POST':
        if "money" not in request.session:
            request.session["money"] = 0
        if "log" not in request.session:
            request.session["log"] = ""
        money = 0
        act_string = ""
        if location == 'casino':
            money = random.randint(-50,50)
            if money < 0:
                gain_str = "lost {} golds... Ouch..".format(money)
                loss = True
            else:
                gain_str = "won {} golds!".format(money)
                loss = False
            act_string = "Entered a casino and {} ({})<br>".format(gain_str, datetime.now().strftime("%Y/%m/%d %I:%M %p"))
            if loss:
                act_string = "<span>{}</span>".format(act_string)
        elif location == 'farm':
            money = random.randint(10,20)
        elif location == 'cave':
            money = random.randint(5,10)
        elif location == 'house':
            money = random.randint(2,5)
        else:
            return redirect('/')
        if location != 'casino':
            act_string = "Earned {} golds from the {}! ({})<br>".format(money, location, datetime.now().strftime("%Y/%m/%d %I:%M %p"))
        request.session["money"] = int(request.session["money"]) + money
        request.session["log"] += act_string
        return redirect('/')
    else:
        return redirect('/')
