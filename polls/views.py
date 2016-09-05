from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import loader
from django.core.urlresolvers import reverse
from django.views import generic

from .models import Question, Choice, Exam, Grades, User
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


def about(request):
    return render(request, 'polls/about.html')


def contact_us(request):
    return render(request, 'polls/contact_us.html')


def easy_assess(request):
    return render(request, 'polls/easy_assess.html')


def easy_index(request):
    write_database_easy_assess(request)
    exam_list = Exam.objects.order_by('id')[:68]
    exam_list_1 = Exam.objects.order_by('id')[:3]
    exam_list_2 = Exam.objects.order_by('id')[3:8]
    exam_list_3 = Exam.objects.order_by('id')[8:19]
    exam_list_4 = Exam.objects.order_by('id')[19:28]
    exam_list_5 = Exam.objects.order_by('id')[28:39]
    exam_list_6 = Exam.objects.order_by('id')[39:50]
    exam_list_7 = Exam.objects.order_by('id')[50:60]
    exam_list_8 = Exam.objects.order_by('id')[60:65]
    exam_list_9 = Exam.objects.order_by('id')[65:68]
    context = {'exam_list': exam_list, 'exam_list_1': exam_list_1, 'exam_list_2':exam_list_2,
               'exam_list_3': exam_list_3, 'exam_list_4':exam_list_4, 'exam_list_5':exam_list_5,
               'exam_list_6': exam_list_6, 'exam_list_7':exam_list_7, 'exam_list_8':exam_list_8,
               'exam_list_9': exam_list_9}
    return render(request, 'polls/easy_index.html', context)


def write_database_easy_assess(request):
    if request.method == 'POST':
        for key in request.POST:
            print(key)
            valuelist = request.POST.getlist(key)
            print(valuelist)
    else:
        print("no post!")
    u_1 = User(user_name=request.POST.getlist('q1'), e_mail=request.POST.getlist('q2'),
               cell_phone=12345, pass_word='12345', work_place='workplace')
    u_1.save()
    p_1 = Grades(tech_name=request.POST.getlist('q4'), tech_type=request.POST.getlist('q3'),
                 tech_note=request.POST.getlist('q5'), author_id=u_1.id,
                 exam_item='')
    p_1.save()


def read_database():
    pass


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


def easy_submit(request):
    grade = 20
    if request.method == 'POST':
        for key in request.POST:
            value = request.POST.getlist(key)
            print(value)
            if value == ['Yes']:
                grade += 1
    else:
        print("no post!")
    risk = 100 - grade
    if grade < 40:
        discussion = '技术风险较大，建议谨慎投资。'
    elif grade < 75:
        discussion = '技术风险一般，建议进行产业开发。'
    elif grade < 90:
        discussion = '技术风险小。'
    else:
        discussion = '技术已成熟，技术风险几乎不存在。'
    context = {'grade':grade,'risk':risk, 'discussion':discussion}
    return render(request, 'polls/easy_submit.html', context)


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