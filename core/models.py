from django.db import models

class Factura(models.Model):
    subtotal = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    descuento = models.DecimalField(max_digits=10, decimal_places=2)
    descuentoMonto = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    iva = models.DecimalField(max_digits=10, decimal_places=2)
    ivaMonto = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    costoenvio = models.DecimalField(max_digits=10, decimal_places=2)
    total = models.DecimalField(max_digits=10, decimal_places=2, editable=False)

class Empresa(models.Model):
    nombreEmpresa = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    telefono = models.CharField(max_length=15)
    correo = models.EmailField()
    web = models.CharField(blank=True, null=True, max_length=30)
    factura = models.ForeignKey(Factura, related_name='empresas', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.nombreEmpresa

class Vendedor(models.Model):
    nombreEmpresa = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    telefono = models.CharField(max_length=15)
    correo = models.EmailField()
    web = models.CharField(blank=True, null=True, max_length=30)
    factura = models.ForeignKey(Factura, related_name='vendedores', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.nombreEmpresa

class Cliente(models.Model):
    nombrecliente = models.CharField(max_length=100)
    nombreEmpresa = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    telefono = models.CharField(max_length=15)
    correo = models.EmailField()
    factura = models.ForeignKey(Factura, related_name='clientes', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.nombrecliente

class Envio(models.Model):
    metodoenvio = models.CharField(max_length=100, blank=True, null=True)
    direccionenvio = models.CharField(max_length=200)
    condicionesenvio = models.CharField(max_length=500, blank=True, null=True)
    factura = models.ForeignKey(Factura, related_name='envios', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.direccionenvio

class Producto(models.Model):
    codigo = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=200)
    cantidad = models.IntegerField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    monto = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    factura = models.ForeignKey(Factura, related_name='productos', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.codigo