from django.shortcuts import render
from datetime import datetime

# Create your views here.
def index(request):
    return render(request, 'showtime/index.html', {"currenttime":datetime.now()})
