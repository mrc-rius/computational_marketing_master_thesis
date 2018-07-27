from django.urls import path
from . import views

app_name = 'cluster'
urlpatterns = [
    path('', views.ClusterIndex, name='clusterIndex'),
]