from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Product

# Create your views here.
def index(request):
    products = Product.objects.all()
    return render(request, 'rest/index.html', {"products":products})

def new(request):
    return render(request, 'rest/new.html')

def create(request):
    if request.method == 'POST':
        product_valid = Product.objects.validate(request.POST)
        if product_valid["success"] == True:
            messages.info(request, "Successfully added product '{}'".format(product_valid["product_object"].name))
        else:
            for msg in product_valid["errors"]:
                messages.info(request, msg)
        return redirect('/products/new')
    else:
        messages.info(request, "An error has occurred. Please try again.")
        return redirect('/')

def edit(request, product_id):
    try:
        target = Product.objects.get(id=product_id)
    except Product.DoesNotExist:
        messages.info(request, "Product not found.")
        return redirect('/')
    return render(request, 'rest/update.html', {"product":target})

def read(request, product_id):
    try:
        target = Product.objects.get(id=product_id)
    except Product.DoesNotExist:
        messages.info(request, "Product not found.")
        return redirect('/')
    return render(request, 'rest/read.html', {"product":target})

def update(request, product_id):
    if request.method == 'POST':
        try:
            target = Product.objects.get(id=product_id)
        except Product.DoesNotExist:
            messages.info(request, "Product not found.")
            return redirect('/')
    valid_edit = Product.objects.validate(request.POST, product_id)
    if valid_edit["success"] == True:
        messages.info(request, "Successfully modified product '{}'".format(valid_edit["product_object"].name))
    else:
        for msg in valid_edit["errors"]:
            messages.info(request, msg)
    return redirect('/')

def destroy(request, product_id):
    if request.method == 'POST':
        try:
            target = Product.objects.get(id=product_id)
        except Product.DoesNotExist:
            messages.info(request, "Product not found.")
            return redirect('/')
        messages.info(request, "Product '{}' has been deleted.".format(target.name))
        target.delete()
        return redirect('/')
    else:
        messages.info(request, "An error has occurred. Please try again.")
        return redirect('/')
