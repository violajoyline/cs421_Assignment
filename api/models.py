from django.db import models

# Create your models here.
class Student(models.Model):
    name = models.CharField(max_length=255)
    program = models.CharField(max_length=255)

    def __str__(self):
        return self.name

class Subject(models.Model):
    name = models.CharField(max_length=255)
    year = models.IntegerField()  # Year 1 to Year 4

    def __str__(self):
        return self.name