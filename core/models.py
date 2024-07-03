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
    
class EstadoOrden(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre
    
class EstadoEnvio(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre

class EstadoModificacion(models.Model):
    nombre = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre
    
class Entrega(models.Model):
    direccion = models.CharField(max_length=200,null=True)
    rut = models.CharField(max_length=15,null=True)
    imagen = models.ImageField(upload_to='media/', null=True, blank=True)

    def __str__(self):
        return self.direccion

class Rechazo(models.Model):
    factura = models.ForeignKey('Factura', on_delete=models.CASCADE,null=True)
    descripcion = models.TextField(null=True)

    def __str__(self):
        return self.descripcion

class Factura(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE,null=True)
    vendedor = models.ForeignKey(Vendedor, on_delete=models.CASCADE,null=True)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE,null=True)
    envio = models.ForeignKey(Envio, on_delete=models.CASCADE,null=True)
    subtotal = models.IntegerField(null=True)
    descuento = models.IntegerField(null=True)
    descuentoMonto = models.IntegerField(null=True)
    iva = models.IntegerField(null=True)
    ivaMonto = models.IntegerField(null=True)
    costoenvio = models.IntegerField(null=True)
    total = models.IntegerField(null=True)
    estadoEnvio = models.ForeignKey(EstadoEnvio, on_delete=models.CASCADE,null=True, default=1)
    estadoOrden = models.ForeignKey(EstadoOrden, on_delete=models.CASCADE,null=True, default=1)
    estadoModificacion = models.ForeignKey(EstadoModificacion, on_delete=models.CASCADE,null=True, default=1)
    entrega = models.ForeignKey(Entrega, on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.cliente.nombrecliente

class Producto(models.Model):
    codigo = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=200)
    cantidad = models.IntegerField()
    precio = models.IntegerField()
    monto = models.IntegerField()
    factura = models.ForeignKey(Factura, related_name='productos', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return self.codigo