from __future__ import unicode_literals
from django.db import models
import re

validemail = r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+.[a-zA-Z]+$'
# Create your models here.
class EmailManager(models.Manager):
    def validate(self, postData):
        if "email" not in postData:
            return (False, "No email address provided")
        elif not re.search(validemail, postData["email"]):
            return (False, "Invalid email address provided")
        elif len(Email.objects.filter(email=postData["email"])) > 0:
            return (False, "Email is already registered")
        else:
            return (True, Email.objects.create(email=postData["email"]))
    def remove(self, id):
        Email.objects.get(id=id).delete()

class Email(models.Model):
    email = models.CharField(max_length=45)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects = EmailManager()
