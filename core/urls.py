from django.urls import path
from .views import *

urlpatterns = [
    path('', index, name="index"),
    path('registro/', registro, name="registro"),
    path('ordenCompra/', ordenCompra, name="ordenCompra"),
    path('facturas/', facturas, name="facturas"),
]
