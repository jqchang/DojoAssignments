from django.shortcuts import render
from datetime import datetime

# Create your views here.
def index(request):
    return render(request, 'ViewsAssignemnt/index.html', {"testing":datetime.now()})

def show(request):
    return render(request, "ViewsAssignemnt/users.html")
