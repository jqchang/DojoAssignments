from django.shortcuts import render, redirect, HttpResponse

# Create your views here.
def index(request):
    return render(request, 'survey/index.html')

def process(request):
    if request.method == 'POST':
        if "times" not in request.session:
            print "Adding a zero!"
            request.session["times"] = 0
        request.session["name"] = request.POST['name']
        request.session["location"]=request.POST['location']
        request.session["language"]=request.POST['language']
        request.session["comment"]=request.POST['comment']
        request.session["times"]=int(request.session['times']) + 1
        print request.session.items()
        return redirect('/result')

def result(request):
    return render(request, 'survey/result.html')

def back(request):
    return redirect('/')
