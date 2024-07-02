from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from .forms import RegistroForm, EmpresaForm, ClienteForm, EnvioForm, VendedorForm
from .models import Factura, Empresa, Vendedor, Cliente, Envio, Producto
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.lib.units import inch


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

        print(subtotal, descuento, monto_descuento, iva, monto_iva, costo_envio, total)

        if empresaForm.is_valid() and vendedorForm.is_valid() and clienteForm.is_valid() and envioForm.is_valid():            # Crear instancias de los modelos con los datos del formulario
            empresa = Empresa.objects.create(**empresaForm.cleaned_data)
            vendedor = Vendedor.objects.create(**vendedorForm.cleaned_data)
            cliente = Cliente.objects.create(**clienteForm.cleaned_data)
            envio = Envio.objects.create(**envioForm.cleaned_data)
            factura = Factura.objects.create(empresa=empresa,vendedor=vendedor,cliente=cliente,envio=envio,subtotal=subtotal, descuento=descuento, descuentoMonto=monto_descuento, iva=iva, ivaMonto=monto_iva, costoenvio=costo_envio, total=total)


            # Para los productos, necesitarás iterar sobre los campos de los productos en la solicitud POST
            num_productos = sum('codigo' in key for key in request.POST.keys())
            print("NUM PRODUCTOS")
            print(num_productos)

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
                    print("PRODUCTO DATA")
                    print(producto_data)
                    producto = Producto.objects.create(factura=factura, **producto_data)
                    print("PRODUCTO OBJECT")
                    print(producto)


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
        ("Cliente", {
            "Nombre": factura.cliente.nombreEmpresa,
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
    p.drawString(MARGIN_LEFT, y, "Gracias por su compra!")
    
    p.save()
    return response