from django.urls import path
from .views import students_list, subjects_list, api_index

urlpatterns = [
    path('', api_index, name='api-index'),
    path('students/', students_list, name='students-list'),
    path('subjects/', subjects_list, name='subjects-list'),
]
