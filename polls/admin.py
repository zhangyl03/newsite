from django.contrib import admin

# Register your models here.
from .models import Question, Choice, Exam

class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 3

class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields':['question_text']}),
        ('Date information', {'fields':['pub_date'],'classes':['collapse']}),
    ]
    inlines = [ChoiceInline]
    list_display = ('question_text', 'pub_date', 'was_published_recently')
    list_filter = ['pub_date']
    search_fields = ['question_text']

class ExamAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['exam_text']}),
    ]

admin.site.register(Question, QuestionAdmin)
admin.site.register(Exam, ExamAdmin)