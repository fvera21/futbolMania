from django.urls import path, include
from.views import *
from rest_framework import routers


## SE VAN A CREAR TODAS LAS URLS
urlpatterns = [
    #RUTAS
    path('', index, name="index"),
]
