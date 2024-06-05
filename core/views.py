from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import Group
from django.core.paginator import Paginator
from .forms import *
from .models import *
from django.shortcuts import redirect
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required

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
        vendedorForm = EmpresaForm(request.POST, prefix='vendedorForm')
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
        vendedorForm = EmpresaForm(prefix='vendedorForm')
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
    factura = Factura.objects.get(id=id)
    productos = factura.productos.all()
    return render(request, 'core/factura.html', {'factura': factura, 'productos': productos})

def logout_view(request):
    logout(request)
    return redirect('login') 