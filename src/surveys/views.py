from django.http import HttpResponse,HttpResponseRedirect
from .models import Choice,Question,Answer
from django.shortcuts import get_object_or_404,render
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.template import loader
import time
import datetime
import random


class IndexView(generic.ListView):
    template_name = 'surveys/index.html'
    context_object_name = 'questions'

    def get_queryset(self):
        questions = Question.objects.prefetch_related('choice_set').all()
        return questions

class DetailView(generic.DetailView):
    model = Question
    template_name = 'surveys/detail.html'
    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Question.objects.filter(publication_date__lte=timezone.now())

class ResultsView(generic.DetailView):
    model = Question
    template_name = 'surveys/results.html'

def success_vote(request):
    template = loader.get_template('surveys/succes_vote.html')
    context = {}
    return HttpResponse(template.render(context,request))

def vote (request):
    #Get the POST request
    form_values = request.POST.items()
    form_token=(datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S'))+"_"+str(random.random()*1000)
    for key,value in form_values:
        if  key!='csrfmiddlewaretoken':
            try:
                Answer.objects.create(question_id=key, answer_text=value, form_token=form_token)
            except:
                return render(request, 'surveys/detail.html', {
                    'error_message': "We have detected some error related with saving your answers.",
                })
    return HttpResponseRedirect(reverse('surveys:successVote'))

    '''
    question = get_object_or_404(Question)
    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'surveys/detail.html', {
            'question': question,
            'error_message': "You didn't select a choice.",
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse('surveys:results', args=(question.id,)))
    '''