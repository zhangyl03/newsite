from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import loader
from django.core.urlresolvers import reverse
from django.views import generic

from .models import Question, Choice, Exam
# Create your views here.

class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'latest_question_list'

    def get_queryset(self):
        """return the last five published questions"""
        return Question.objects.order_by('-pub_date')[:5]

#def index(request):
#    latest_question_list = Question.objects.order_by('-pub_date')[:5]
#    context = {'latest_question_list':latest_question_list}
#    return render(request, 'polls/index.html', context)


def home(request):
    return render(request, 'polls/homepage.html')


def easy_assess(request):
    return render(request, 'polls/easy_assess.html')


def easy_index(request):
    latest_exam_list = Exam.objects.order_by('id')[:9]
    context = {'latest_exam_list': latest_exam_list}
    return render(request, 'polls/easy_index.html', context)


def easy_tables(request, exam_lv):
    if exam_lv == '1':
        serial_number = [1, 2, 3]
    elif exam_lv == '2':
        serial_number = list(range(4, 9))
    elif exam_lv == '3':
        serial_number = list(range(9, 20))
    elif exam_lv == '4':
        serial_number = list(range(20, 29))
    elif exam_lv == '5':
        serial_number = list(range(29, 40))
    elif exam_lv == '6':
        serial_number = list(range(40, 51))
    elif exam_lv == '7':
        serial_number = list(range(51, 61))
    elif exam_lv == '8':
        serial_number = list(range(61, 66))
    else:
        serial_number = [66, 67, 68]
    exam_list = []
    for number in serial_number:
        exam_list.append(get_object_or_404(Exam, pk=number))
    context = {'exam_list': exam_list}
    return render(request, 'polls/easy_tables.html', context)


def query(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    context = {'latest_question_list':latest_question_list}
    return render(request, 'polls/query.html', context)


def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/detail.html', {'question': question})


def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/results.html',{'question':question})


def vote(request, question_id):
    p = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = p.choice_set.get(pk=request.POST['choice'])
    except(KeyError, Choice.DoesNotExist):
        return render(request, 'polls/detail.html', {
            'question': p,
            'error_message':"You didn't select a choice.",
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        return HttpResponseRedirect(reverse('polls:results', args=(p.id,)))