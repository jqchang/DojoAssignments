from django.shortcuts import render, redirect
import random, string

# Create your views here.
def index(request):
    if "tries" not in request.session:
        request.session["tries"] = 1
    # Random string taken from http://stackoverflow.com/questions/2511222/efficiently-generate-a-16-character-alphanumeric-string
    # slightly modified
    x = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(14))
    context = {
        "randomword":x
    }
    return render(request, 'rwg/index.html', context)

def submit(request):
    if request.method == "POST":
        if "tries" in request.session:
            request.session["tries"] = int(request.session["tries"])+1
        else:
            request.session["tries"] = 1
        return redirect('/')
    else:
        pass
        # Should be returning an error page instead of a regular redirect
        # For now, just letting it fall through to ValueError
        # return redirect('/')
