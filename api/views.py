from django.shortcuts import render

# Create your views here.
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Student, Subject
from .serializers import StudentSerializer, SubjectSerializer

@api_view(['GET'])
def students_list(request):
    students = Student.objects.all()[:10]  # Get at least 10 students
    serializer = StudentSerializer(students, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def subjects_list(request):
    subjects = Subject.objects.all()
    subjects_by_year = {}

    for subject in subjects:
        year = f'Year {subject.year}'
        if year not in subjects_by_year:
            subjects_by_year[year] = []
        subjects_by_year[year].append(subject.name)

    return Response(subjects_by_year)
