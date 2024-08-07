from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from .forms import *
from .models import *
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.lib.units import inch
from django.forms import modelformset_factory
from django.db.models import ObjectDoesNotExist
from reportlab.lib import colors


def index(request):
    if request.user.is_authenticated:
        facturas = Factura.objects.all()
        return render(request, 'core/index.html', {'facturas': facturas})
    else:
        return redirect('login')

def registro(request):
    data = {'form': RegistroForm()}

    if request.method == 'POST':
        formulario = RegistroForm(request.POST)
        if formulario.is_valid():
            usuario = formulario.save()
            user = authenticate(username=usuario.username, password=formulario.cleaned_data["password1"])
            login(request, user)
            return redirect("index")
        else:
            data["form"] = formulario
    return render(request, 'core/registro.html', data)

@login_required
def ordenCompra(request):
    if request.method == 'POST':
        empresaForm = EmpresaForm(request.POST, prefix='empresaForm')
        vendedorForm = VendedorForm(request.POST, prefix='vendedorForm')
        clienteForm = ClienteForm(request.POST, prefix='clienteForm')
        envioForm = EnvioForm(request.POST, prefix='envioForm')

        subtotal = request.POST.get('subtotal')
        if subtotal == '': subtotal = 0
        descuento = request.POST.get('descuento')
        if descuento == '': descuento = 0
        monto_descuento = request.POST.get('descuentoMonto')
        if monto_descuento == '': monto_descuento = 0
        iva = request.POST.get('iva')
        if iva == '': iva = 0
        monto_iva = request.POST.get('ivaMonto')
        if monto_iva == '': monto_iva = 0
        costo_envio = request.POST.get('costoenvio')
        if costo_envio == '': costo_envio = 0
        total = request.POST.get('total')
        if total == '': total = 0

        if empresaForm.is_valid() and vendedorForm.is_valid() and clienteForm.is_valid() and envioForm.is_valid():            # Crear instancias de los modelos con los datos del formulario
            empresa = Empresa.objects.create(**empresaForm.cleaned_data)
            vendedor = Vendedor.objects.create(**vendedorForm.cleaned_data)
            cliente = Cliente.objects.create(**clienteForm.cleaned_data)
            envio = Envio.objects.create(**envioForm.cleaned_data)
            factura = Factura.objects.create(empresa=empresa,vendedor=vendedor,cliente=cliente,envio=envio,subtotal=subtotal, descuento=descuento, descuentoMonto=monto_descuento, iva=iva, ivaMonto=monto_iva, costoenvio=costo_envio, total=total)


            # Para los productos, necesitarás iterar sobre los campos de los productos en la solicitud POST
            num_productos = sum('codigo' in key for key in request.POST.keys())

            for i in range(1, num_productos + 2):
                codigo_key = 'codigo' + str(i)
                if codigo_key in request.POST:
                    producto_data = {
                        'codigo': request.POST[codigo_key],
                        'descripcion': request.POST[codigo_key.replace('codigo', 'descripcion')],
                        'cantidad': request.POST[codigo_key.replace('codigo', 'cantidad')],
                        'precio': request.POST[codigo_key.replace('codigo', 'precio')],
                        'monto': request.POST[codigo_key.replace('codigo', 'monto')],
                    }

                    producto = Producto.objects.create(factura=factura, **producto_data)



    else:
        empresaForm = EmpresaForm(prefix='empresaForm')
        vendedorForm = VendedorForm(prefix='vendedorForm')
        clienteForm = ClienteForm(prefix='clienteForm')
        envioForm = EnvioForm(prefix='envioForm')

    return render(request, 'core/ordenCompra.html', {
        'empresaForm': empresaForm,
        'vendedorForm': vendedorForm,
        'clienteForm': clienteForm,
        'envioForm': envioForm
    })

@login_required
def factura(request, id):
    factura = get_object_or_404(Factura, id=id)
    productos = factura.productos.all()
    return render(request, 'core/factura.html', {'factura': factura, 'productos': productos})

def logout_view(request):
    logout(request)
    return redirect('login')

def imprimir_seccion(canvas, y, titulo, datos, titulo_font_size=12, datos_font_size=10, espacio_entre_lineas=14, margen_izquierdo=72, ancho_columna=200):
    if titulo:
        canvas.setFont("Helvetica-Bold", titulo_font_size)
        canvas.drawString(margen_izquierdo, y, titulo)
        y -= espacio_entre_lineas

    canvas.setFont("Helvetica", datos_font_size)
    for clave, valor in datos.items():
        canvas.drawString(margen_izquierdo, y, clave)
        canvas.drawString(margen_izquierdo + ancho_columna, y, str(valor))
        y -= espacio_entre_lineas

    return y

@login_required
def orden_compra_pdf(request, factura_id):
    factura = get_object_or_404(Factura, pk=factura_id)
    Y_START = 750
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'attachment; filename="factura_{factura_id}.pdf"'
    p = canvas.Canvas(response, pagesize=letter)
    y = Y_START

    # Insertar encabezado de la factura
    p.setFont("Helvetica-Bold", 16)
    titulo = "Factura"
    titulo_ancho = p.stringWidth(titulo, "Helvetica-Bold", 16)
    p.drawString((letter[0] - titulo_ancho) / 2.0, y, titulo)
    y -= 30
    p.line(50, y, 550, y)  # Línea divisoria
    y -= 20

    # Configuraciones
    MARGIN_LEFT = 50
    Y_SECTION_GAP = 20
    LINE_GAP = 12
    TITLE_FONT_SIZE = 12
    BODY_FONT_SIZE = 10

    secciones = [
        ("Detalles de la Factura", {
            "Número de Factura": factura.id,
        }),
        ("Empresa", {
            "Empresa": factura.empresa.nombreEmpresa,
            "Dirección": factura.empresa.direccion,
            "Teléfono": factura.empresa.telefono,
            "Correo": factura.empresa.correo,
            "Sitio Web": factura.empresa.web
        }),
        ("Vendedor", {
            "Empresa": factura.vendedor.nombreEmpresa,
            "Dirección": factura.vendedor.direccion,
            "Teléfono": factura.vendedor.telefono,
            "Correo": factura.vendedor.correo,
            "Sitio Web": factura.vendedor.web
        }),
        ("Cliente", {
            "Empresa": factura.cliente.nombreEmpresa,
            "Nombre": factura.cliente.nombrecliente,
            "Dirección": factura.cliente.direccion,
            "Teléfono": factura.cliente.telefono,
            "Correo": factura.cliente.correo
        }),
        ("Envío", {
            "Método de Envío": factura.envio.metodoenvio,
            "Dirección de Envío": factura.envio.direccionenvio,
            "Condiciones de Envío": factura.envio.condicionesenvio
        })
    ]

    for titulo, datos in secciones:
        y = imprimir_seccion(p, y, titulo, datos, TITLE_FONT_SIZE, BODY_FONT_SIZE, LINE_GAP, MARGIN_LEFT)
        y -= Y_SECTION_GAP
        p.line(50, y + 10, 550, y + 10)  # Línea divisoria
        y -= 10

    p.setFont("Helvetica-Bold", TITLE_FONT_SIZE)
    p.drawString(MARGIN_LEFT, y, "Productos")
    y -= Y_SECTION_GAP

    # Encabezados de columna para productos
    encabezados_productos = ["Código", "Descripción", "Cantidad", "Precio", "Monto"]
    espacio_entre_columnas = 72  # Ajustar según sea necesario

    # Dibujar encabezados de columna
    p.setFont("Helvetica-Bold", BODY_FONT_SIZE)
    y -= LINE_GAP
    for i, encabezado in enumerate(encabezados_productos):
        p.drawString(MARGIN_LEFT + i * espacio_entre_columnas, y, encabezado)

    # Restablecer fuente para contenido
    p.setFont("Helvetica", BODY_FONT_SIZE)
    y -= LINE_GAP

    # Listar productos
    for producto in factura.productos.all():
        p.drawString(MARGIN_LEFT, y, producto.codigo)
        p.drawString(MARGIN_LEFT + espacio_entre_columnas, y, producto.descripcion)
        p.drawString(MARGIN_LEFT + 2 * espacio_entre_columnas, y, str(producto.cantidad))
        p.drawString(MARGIN_LEFT + 3 * espacio_entre_columnas, y, f"${producto.precio}")
        p.drawString(MARGIN_LEFT + 4 * espacio_entre_columnas, y, f"${producto.monto}")
        y -= LINE_GAP

    # Asegurarse de que hay espacio suficiente para el resumen final
    if y < 100:  # Ajustar según sea necesario
        p.showPage()
        y = Y_START  # Restablecer Y para la nueva página

    # Línea divisoria antes de los totales
    p.line(50, y, 550, y)
    y -= 20

    # Resumen final
    y = imprimir_seccion(p, y, "Totales", {
        "Subtotal": factura.subtotal,
        "Descuento": f"{factura.descuento}%",
        "Descuento Monto": factura.descuentoMonto,
        "IVA": f"{factura.iva}%",
        "IVA Monto": factura.ivaMonto,
        "Costo Envío": factura.costoenvio,
        "Total": factura.total
    }, TITLE_FONT_SIZE, BODY_FONT_SIZE, LINE_GAP, MARGIN_LEFT)

    p.line(50, y, 550, y)  # Línea divisoria final
    y -= 30

    p.setFont("Helvetica-Bold", 10)
    if factura.estadoModificacion.nombre == "Anulada":  # Reemplazar 'status' por el campo correcto
        p.setFont("Helvetica-Bold", 80)
        p.setFillColor(colors.red)
        p.saveState()  # Guarda el estado actual del canvas para poder restaurarlo después
        p.translate(letter[0] / 2, letter[1] / 2)  # Centra el texto en la página
        p.rotate(45)  # Rota el texto 45 grados para que cruce la página
        p.drawCentredString(0, 0, "ANULADA")  # Dibuja el texto "ANULADA" en el centro de la rotación
        p.restoreState()  # Restaura el estado del canvas para continuar con el contenido normal
    p.save()
    return response


def rectificar(request, id):
    factura = get_object_or_404(Factura, id=id)
    empresa = factura.empresa
    vendedor = factura.vendedor
    cliente = factura.cliente
    envio = factura.envio
    productos = factura.productos.all()

    ProductoFormSet = modelformset_factory(Producto, form=ProductoRectificarForm, extra=0)

    if request.method == 'POST':
        empresaForm = EmpresaRectificarForm(request.POST, instance=empresa, prefix='empresaForm')
        vendedorForm = VendedorRectificarForm(request.POST, instance=vendedor, prefix='vendedorForm')
        clienteForm = ClienteRectificarForm(request.POST, instance=cliente, prefix='clienteForm')
        envioForm = EnvioRectificarForm(request.POST, instance=envio, prefix='envioForm')
        facturaForm = FacturaRectificarForm(request.POST, instance=factura, prefix='facturaForm')
        productoFormSet = ProductoFormSet(request.POST, queryset=productos, prefix='productos')

        if empresaForm.is_valid() and vendedorForm.is_valid() and clienteForm.is_valid() and envioForm.is_valid() and facturaForm.is_valid() and productoFormSet.is_valid():
            empresaForm.save()
            vendedorForm.save()
            clienteForm.save()
            envioForm.save()
            productoFormSet.save()

            # Datos factura form
            descuento = facturaForm.cleaned_data.get('descuento')
            iva = facturaForm.cleaned_data.get('iva')
            costoenvio = facturaForm.cleaned_data.get('costoenvio')

            subtotal = sum(form.cleaned_data.get('precio') * form.cleaned_data.get('cantidad') for form in productoFormSet)

            # Calculos
            descuentoMonto = subtotal * (descuento / 100)
            ivaMonto = (subtotal - descuentoMonto) * (iva / 100)
            total = subtotal - descuentoMonto + ivaMonto + costoenvio

            # Actualizar factura
            factura.subtotal = subtotal
            factura.descuento = descuento
            factura.descuentoMonto = descuentoMonto
            factura.iva = iva
            factura.ivaMonto = ivaMonto
            factura.costoenvio = costoenvio
            factura.total = total
            factura.estadoModificacion = EstadoModificacion.objects.get(pk=2)

            # Guardar factura
            factura.save()

            return redirect('factura', id=factura.id)
    else:
        empresaForm = EmpresaRectificarForm(instance=empresa, prefix='empresaForm')
        vendedorForm = VendedorRectificarForm(instance=vendedor, prefix='vendedorForm')
        clienteForm = ClienteRectificarForm(instance=cliente, prefix='clienteForm')
        envioForm = EnvioRectificarForm(instance=envio, prefix='envioForm')
        facturaForm = FacturaRectificarForm(instance=factura, prefix='facturaForm')
        productoFormSet = ProductoFormSet(queryset=productos, prefix='productos')

    return render(request, 'core/rectificar.html', {
        'empresaForm': empresaForm,
        'vendedorForm': vendedorForm,
        'clienteForm': clienteForm,
        'envioForm': envioForm,
        'facturaForm': facturaForm,
        'productoFormSet': productoFormSet,
        'factura': factura
    })


def agregar_producto(request, id):
    factura = get_object_or_404(Factura, id=id)

    if request.method == 'POST':
        form = ProductoRectificarForm(request.POST)
        if form.is_valid():
            producto = form.save(commit=False)
            producto.monto = producto.cantidad * producto.precio
            producto.factura = factura
            producto.save()

            # Datos factura form
            descuento = factura.descuento
            iva = factura.iva
            costoenvio = factura.costoenvio

            subtotal = factura.subtotal + producto.monto

            # Calculos
            descuentoMonto = subtotal * (descuento / 100)
            ivaMonto = (subtotal - descuentoMonto) * (iva / 100)
            total = subtotal - descuentoMonto + ivaMonto + costoenvio

            # Actualizar factura
            factura.subtotal = subtotal
            factura.descuentoMonto = descuentoMonto
            factura.ivaMonto = ivaMonto
            factura.total = total

            factura.estadoModificacion = EstadoModificacion.objects.get(pk=2)
            factura.save()

            return redirect('rectificar', id=id)
    else:
        form = ProductoRectificarForm()
    return render(request, 'core/agregar_producto.html', {'form': form, 'factura': factura})

def eliminar_producto(request, id):
    producto = get_object_or_404(Producto, id=id)
    id_factura = producto.factura.id
    factura = get_object_or_404(Factura, id=id_factura)

    # Datos factura form
    descuento = factura.descuento
    iva = factura.iva
    costoenvio = factura.costoenvio

    subtotal = factura.subtotal - producto.monto

    # Calculos
    descuentoMonto = subtotal * (descuento / 100)
    ivaMonto = (subtotal - descuentoMonto) * (iva / 100)
    total = subtotal - descuentoMonto + ivaMonto + costoenvio

    # Actualizar factura
    factura.subtotal = subtotal
    factura.descuentoMonto = descuentoMonto
    factura.ivaMonto = ivaMonto
    factura.total = total

    factura.estadoModificacion = EstadoModificacion.objects.get(pk=2)
    factura.save()

    producto.delete()
    return redirect('rectificar', id=id_factura)

def entregar(request, id):
    factura = get_object_or_404(Factura, id=id)
    if request.method == 'POST':
        # Instanciar el formulario con los datos de la solicitud y los archivos
        form = EntregaForm(request.POST, request.FILES)
        if form.is_valid():
            entrega = form.save(commit=False)
            entrega.save()

            factura.estadoEnvio = EstadoEnvio.objects.get(pk=2)
            factura.entrega = entrega
            factura.save()

            return redirect('factura', id=factura.id)
    else:
        form = EntregaForm()

    return render(request, 'core/entregar.html', {'form': form, 'factura': factura})

def rechazar(request, id):
    factura = get_object_or_404(Factura, id=id)
    if request.method == 'POST':
        # Instanciar el formulario con los datos de la solicitud y el valor inicial para 'factura'
        form = RechazoForm(request.POST, initial={'factura': factura.id})
        if form.is_valid():
            # Aquí, debes guardar el formulario. Si el campo 'factura' es un campo oculto,
            # el valor inicial no se pasará como parte de request.POST, por lo que debes asignarlo manualmente antes de guardar.
            rechazo = form.save(commit=False)
            rechazo.factura = factura  # Asignar la instancia de Factura directamente
            rechazo.save()

            factura.estadoEnvio = EstadoEnvio.objects.get(pk=3)
            factura.save()

            return redirect('factura', id=factura.id)
            # Redirigir o manejar la respuesta como desees después de guardar el objeto Rechazo
    else:
        # Instanciar el formulario con el valor inicial para 'factura' solo si es una solicitud GET
        form = RechazoForm(initial={'factura': factura.id})
    return render(request, 'core/rechazar.html', {'form': form, 'factura': factura})

def historial(request,id):
    factura = get_object_or_404(Factura, id=id)
    rechazos = Rechazo.objects.filter(factura=factura)
    return render(request, 'core/historial.html', {'factura': factura, 'rechazos': rechazos})

def entrega(request, id):
    factura = get_object_or_404(Factura, id=id)
    return render(request, 'core/entrega.html', {'factura': factura})

def ordenCompraEstado(request, id):
    factura = get_object_or_404(Factura, id=id)
    factura.estadoOrden = EstadoOrden.objects.get(pk=1)
    factura.save()
    return redirect('factura', id=factura.id)

def facturadaEstado(request, id):
    factura = get_object_or_404(Factura, id=id)
    factura.estadoOrden = EstadoOrden.objects.get(pk=2)
    factura.save()
    return redirect('factura', id=factura.id)

def anular_factura(request, id):
    factura = get_object_or_404(Factura, pk=id)
    try:
        estado_anulado = EstadoModificacion.objects.get(nombre='Anulada')
    except ObjectDoesNotExist:
        estado_anulado = EstadoModificacion.objects.create(nombre='Anulada')
    factura.estadoModificacion = estado_anulado
    factura.save()
    return redirect('factura', id=factura.id)


def historialEstados(request, id):
    factura = get_object_or_404(Factura, id=id)
    historial = HistorialEstado.objects.filter(factura=factura)

    return render(request, 'core/historialEstados.html', {'factura': factura, 'historial': historial})

def estado_facturas(request):
    estados_facturas = EstadoOrden.objects.all()
    estados_envio = EstadoEnvio.objects.all()

    conteos = {}
    
    for estado in estados_facturas:
        conteos[estado.nombre] = Factura.objects.filter(estadoOrden=estado).count()

    for estado in estados_envio:
        conteos[estado.nombre] = conteos.get(estado.nombre, 0) + Factura.objects.filter(estadoEnvio=estado).count()

    return render(request, 'core/estado_facturas.html', {'conteos': conteos})



