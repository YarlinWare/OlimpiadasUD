from typing import BinaryIO
from django.db import models

# Create your models here.
class User(models.Model):
    ''' User model'''
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)

    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    is_admin = models.BooleanField(default=False)

    created = models.DateField(auto_now_add=True)
    modified = models.DateField(auto_now=True)

    def __str__(self):
        """Return username."""
        return self.user.username