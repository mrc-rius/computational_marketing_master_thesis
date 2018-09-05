from django.urls import path
from . import views

app_name = 'cluster'
urlpatterns = [
    path('', views.ClusterCreation, name='clusterCreation'),
    path('clusterPrediction/', views.ClusterPrediction, name='clusterPrediction'),
    path('productGeneration/', views.ProductGeneration, name='productGeneration'),
]