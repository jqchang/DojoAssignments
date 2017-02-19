from django.shortcuts import render
from .models import User

# Create your views here.
def index(request):
    User.objects.create(first_name="Justin",last_name="Chang")
    users = User.objects.all()
    for user in users:
        print user
    return render(request, "modeling/index.html")
