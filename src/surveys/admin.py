from django.contrib import admin
from django.contrib.admin import AdminSite
from django.utils.translation import ugettext_lazy
from .models import Question,Choice

class SurveysAdminSite(AdminSite):
    site_header = ugettext_lazy('Test administration')

class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 5

class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['question_text']}),
        ('Date information', {'fields': ['publication_date']}),
    ]
    inlines = [ChoiceInline]
    list_display = ('question_text', 'publication_date', 'was_published_recently')
    list_filter = ['publication_date']
    search_fields = ['question_text']

surveys_admin_site = SurveysAdminSite()

surveys_admin_site.register(Question, QuestionAdmin)


