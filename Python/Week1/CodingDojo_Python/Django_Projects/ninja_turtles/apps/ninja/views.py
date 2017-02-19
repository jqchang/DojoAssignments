from django.shortcuts import render, HttpResponse

# Create your views here.
def index(request):
    return HttpResponse("No ninjas here.")

def ninjas(request):
    return render(request, 'ninja/image.html', {"image":"ninja/images/tmnt.png"})

def color(request, color):
    right_ninja = {
        "blue":"ninja/images/leonardo.jpg",
        "orange":"ninja/images/michelangelo.jpg",
        "red":"ninja/images/raphael.jpg",
        "purple":"ninja/images/donatello.jpg"
    }
    if color not in right_ninja:
        return render(request, 'ninja/image.html', {"image":"ninja/images/notapril.jpg"})
    else:
        return render(request, 'ninja/image.html', {"image":right_ninja[color]})
