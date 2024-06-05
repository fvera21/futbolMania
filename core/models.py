from django.db import models

class Empresa(models.Model):
    nombreEmpresa = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    telefono = models.CharField(max_length=15)
    correo = models.EmailField()
    web = models.CharField(blank=True, null=True, max_length=30)

    def __str__(self):
        return self.nombreEmpresa

class Vendedor(models.Model):
    nombreEmpresa = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    telefono = models.CharField(max_length=15)
    correo = models.EmailField()
    web = models.CharField(blank=True, null=True, max_length=30)

    def __str__(self):
        return self.nombreEmpresa

class Cliente(models.Model):
    nombrecliente = models.CharField(max_length=100)
    nombreEmpresa = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    telefono = models.CharField(max_length=15)
    correo = models.EmailField()

    def __str__(self):
        return self.nombrecliente

class Envio(models.Model):
    metodoenvio = models.CharField(max_length=100, blank=True, null=True)
    direccionenvio = models.CharField(max_length=200)
    condicionesenvio = models.CharField(max_length=500, blank=True, null=True)

    def __str__(self):
        return self.direccionenvio

class Factura(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE,null=True)
    vendedor = models.ForeignKey(Vendedor, on_delete=models.CASCADE,null=True)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE,null=True)
    envio = models.ForeignKey(Envio, on_delete=models.CASCADE,null=True)
    subtotal = models.IntegerField()
    descuento = models.IntegerField()
    descuentoMonto = models.IntegerField()
    iva = models.IntegerField()
    ivaMonto = models.IntegerField()
    costoenvio = models.IntegerField()
    total = models.IntegerField()

class Producto(models.Model):
    codigo = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=200)
    cantidad = models.IntegerField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    monto = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    factura = models.ForeignKey(Factura, related_name='productos', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.codigo