from django.contrib import admin

# Register your models here.
from .models import *

admin.site.register(Empresa)
admin.site.register(Vendedor)
admin.site.register(Cliente)
admin.site.register(Envio)
admin.site.register(Producto)
admin.site.register(Factura)
admin.site.register(EstadoOrden)
admin.site.register(EstadoEnvio)
admin.site.register(EstadoModificacion)