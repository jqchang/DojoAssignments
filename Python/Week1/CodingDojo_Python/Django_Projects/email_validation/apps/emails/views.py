from django.shortcuts import render, redirect, HttpResponse
from django.contrib import messages
from .models import Email

# Create your views here.
def index(request):
    return render(request,'emails/index.html')

def process(request):
    if request.method != 'POST':
        return redirect('/')
    else:
        email = Email.objects.validate(request.POST)
        if email[0] == True:
            messages.add_message(request, messages.INFO, "The email address you entered ({}) is a VALID email address! Thank you!".format(email[1].email))
            return redirect('/success')
        else:
            messages.add_message(request, messages.INFO, email[1])
            return redirect('/')
        return ('Work in progress')

def success(request):
    email_list = Email.objects.all()
    return render(request, 'emails/success.html', {"email_list":email_list})

def delete(request, id):
    if request.method == 'POST':
        Email.objects.remove(id)
        return redirect('/success')
        # print "Attempting to delete id={}".format(id)
    else:
        messages.add_message(request, messages.INFO, "Server encountered an error, please try again.")
    return redirect('/')
