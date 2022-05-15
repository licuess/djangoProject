from django.urls import path

from apps.case import views

urlpatterns = [
    path('case/', views.TestCaseView.as_view()),
]