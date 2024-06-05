from django.db import models

class Empresa(models.Model):
    nombreEmpresa = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    telefono = models.CharField(max_length=15)
    correo = models.EmailField()
    web = models.URLField(blank=True, null=True)

class Cliente(models.Model):
    nombrecliente = models.CharField(max_length=100)
    nombreEmpresa = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    telefono = models.CharField(max_length=15)
    correo = models.EmailField()

class Envio(models.Model):
    metodoenvio = models.CharField(max_length=100, blank=True, null=True)
    direccionenvio = models.CharField(max_length=200)
    condicionesenvio = models.CharField(max_length=500, blank=True, null=True)

class Producto(models.Model):
    codigo = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=200)
    cantidad = models.IntegerField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    monto = models.DecimalField(max_digits=10, decimal_places=2, editable=False)

class Factura(models.Model):
    subtotal = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    descuento = models.DecimalField(max_digits=10, decimal_places=2)
    descuentoMonto = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    iva = models.DecimalField(max_digits=10, decimal_places=2)
    ivaMonto = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    costoenvio = models.DecimalField(max_digits=10, decimal_places=2)
    total = models.DecimalField(max_digits=10, decimal_places=2, editable=False)