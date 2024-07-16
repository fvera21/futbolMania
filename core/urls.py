from django.urls import path
from .views import *
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', index, name="index"),
    path('registro/', registro, name="registro"),
    path('ordenCompra/', ordenCompra, name="ordenCompra"),
    path('factura/<int:id>/', factura, name="factura"),
    path('logout/', views.logout_view, name='logout'),
    path('orden_compra_pdf/<int:factura_id>/', orden_compra_pdf, name='orden_compra_pdf'),
    path('rectificar/<int:id>/', rectificar, name="rectificar"),
    path('factura/agregar_producto/<int:id>/', agregar_producto, name='agregar_producto'),
    path('anular/<int:id>/', views.anular_factura, name="anular"), 
    path('entregar/<int:id>/', entregar, name="entregar"),
    path('rechazar/<int:id>/', rechazar, name="rechazar"),
    path('historial/<int:id>/', historial, name="historial"),
    path('entrega/<int:id>/', entrega, name="entrega"),
    path('ordenCompraEstado/<int:id>/', ordenCompraEstado, name="ordenCompraEstado"),
    path('facturadaEstado/<int:id>/', facturadaEstado, name="facturadaEstado"),
    path('historialEstados/<int:id>/', historialEstados, name='historialEstados'),
    path('estado_facturas/', estado_facturas, name='estado_facturas'),
    path('eliminar_producto/<int:id>/', eliminar_producto, name='eliminar_producto'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
