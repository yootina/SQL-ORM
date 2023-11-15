from django.db import models

# Create your models here.

    

class Actor(models.Model):
    name = models.CharField(max_length=10)
    age = models.IntegerField()
    # movies =

class Movie(models.Model):
    title = models.CharField(max_length=20)
    year = models.IntegerField()
    actors = models.ManyToManyField(Actor, related_name='movies')
    # categories =

class Category(models.Model):
    name = models.CharField(max_length=10)
    movies = models.ManyToManyField(Movie, related_name='categories')


class User(models.Model):
    name = models.CharField(max_length=10)
    country = models.CharField(max_length=20)
    email = models.CharField(max_length=50)
    age = models.IntegerField()
    # score_set =

class Score(models.Model):
    content = models.CharField(max_length=140)
    value = models.IntegerField()
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
