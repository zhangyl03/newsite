import datetime

from django.db import models
from django.utils import timezone

# Create your models here.


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

    def __str__(self):
        return self.question_text

    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)

    was_published_recently.admin_order_field = 'pub_date'
    was_published_recently.boolean = True
    was_published_recently.short_description = 'Published recently?'


class Choice(models.Model):
    question = models.ForeignKey(Question)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.choice_text


class User(models.Model):
    user_name = models.CharField(max_length=50)
    pass_word = models.CharField(max_length=50)
    e_mail = models.EmailField()
    cell_phone = models.IntegerField()
    work_place = models.CharField(max_length=50)
    prof = models.BooleanField(default=False)

    def __str__(self):
        return self.user_name


class Exam(models.Model):
    exam_text = models.CharField(max_length=200)
    grade = models.IntegerField(default=0)

    def __str__(self):
        return self.exam_text


class Grades(models.Model):  # the class is used to save different grades of each question by different people
    exam_item = models.CharField(max_length=68)
    author = models.ForeignKey(User)
    tech_name = models.CharField(max_length=50)
    tech_type = models.CharField(max_length=50)
    grade = models.IntegerField(default=0)
    tech_note = models.CharField(max_length=200, default='')


