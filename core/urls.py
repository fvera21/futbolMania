from django.urls import path
from .views import *
from . import views

urlpatterns = [
    path('', index, name="index"),
    path('registro/', registro, name="registro"),
    path('ordenCompra/', ordenCompra, name="ordenCompra"),
    path('factura/<int:id>/', factura, name="factura"),
    path('logout/', views.logout_view, name='logout'),
    path('orden_compra_pdf/<int:factura_id>/', orden_compra_pdf, name='orden_compra_pdf'),
    path('rectificar/<int:id>/', rectificar, name="rectificar"),
    path('entregar/<int:id>/', entregar, name="entregar"),
    path('rechazar/<int:id>/', rechazar, name="rechazar"),
]
