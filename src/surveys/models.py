from django.db import models
import datetime
from django.db import models
from django.utils import timezone

# Create your models here.
class Question(models.Model):
    question_text = models.CharField(max_length=200)
    publication_date=models.DateTimeField()

    def __str__(self):
        return self.question_text
    def was_published_recently(self):
        now = timezone.now()
        return now - datetime.timedelta(days=1) <= self.publication_date <= now

    was_published_recently.admin_order_field = 'publication_date'
    was_published_recently.boolean = True
    was_published_recently.short_description = 'Published recently?'

class Choice(models.Model):
    question=models.ForeignKey(Question,on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
    def __str__(self):
        return self.choice_text

class Answer(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    answer_text=models.CharField(max_length=200)
    insert_timestamp=models.DateTimeField(auto_now_add=True, blank=True)
    form_token=models.CharField(max_length=200)
    training_set=models.IntegerField(default=0)
    def __str__(self):
        return self.answer_text

class Translate_Hired_Power(models.Model):
    hired_power_literal = models.CharField(max_length=200)
    min_hired_power = models.IntegerField(default=0)
    max_hired_power = models.IntegerField(default=800)
    deleted = models.IntegerField(default=0)

class Translate_Interest(models.Model):
    interest_value = models.CharField(max_length=2)
    min_interest = models.DecimalField(max_digits=2,decimal_places=2)
    max_interest = models.DecimalField(max_digits=2,decimal_places=2)
    deleted = models.IntegerField(default=0)