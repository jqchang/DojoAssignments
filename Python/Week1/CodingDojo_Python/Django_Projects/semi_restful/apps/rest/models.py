from __future__ import unicode_literals

from django.db import models
import re

# Create your models here.
class ProductManager(models.Manager):
    def validate(self, postData, id=None):
        errors = []
        if len(postData["name"]) == 0:
            errors.append("Please enter a product name.")
        if len(postData["description"]) == 0:
            errors.append("Please enter a product description.")
        if not re.search(r"^\d*(\.\d{0,2})?$", postData["price"]):
            errors.append("Please enter a valid positive dollar amount.")

        if len(errors) > 0:
            return {"success":False, "errors":errors}
        else:
            if id:
                try:
                    target = Product.objects.get(id=id)
                except Product.DoesNotExist:
                    errors.append("Product not found!")
                    return {"success":False, "errors":errors}
                target.name=postData["name"]
                target.description=postData["description"]
                target.price=postData["price"]
                target.save()
                return {"success":True, "product_object":target}
            else:
                return {"success":True, "product_object":Product.objects.create(name=postData["name"],description=postData["description"],price=postData["price"])}


class Product(models.Model):
    name = models.CharField(max_length=45)
    description = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=13, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects = ProductManager()
