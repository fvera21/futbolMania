from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import Group
from django.core.paginator import Paginator
from .forms import *
from .models import *


def index(request):
    return render(request, 'core/index.html')

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

def ordenCompra(request):
    if request.method == 'POST':
        empresaForm = EmpresaForm(request.POST, prefix='empresaForm')
        vendedorForm = EmpresaForm(request.POST, prefix='vendedorForm')
        clienteForm = ClienteForm(request.POST, prefix='clienteForm')
        envioForm = EnvioForm(request.POST, prefix='envioForm')

        if empresaForm.is_valid() and vendedorForm.is_valid() and clienteForm.is_valid() and envioForm.is_valid():
            # Crear instancias de los modelos con los datos del formulario
            empresa = Empresa.objects.create(**empresaForm.cleaned_data)
            vendedor = Vendedor.objects.create(**vendedorForm.cleaned_data)
            cliente = Cliente.objects.create(**clienteForm.cleaned_data)
            envio = Envio.objects.create(**envioForm.cleaned_data)

            # Aquí puedes procesar los datos del formulario
            # ...

            # Para los productos, necesitarás iterar sobre los campos de los productos en la solicitud POST
            """
            productos = []
            for key in request.POST:
                if key.startswith('codigo'):
                    producto_data = {
                        'codigo': request.POST[key],
                        'descripcion': request.POST[key.replace('codigo', 'descripcion')],
                        'cantidad': request.POST[key.replace('codigo', 'cantidad')],
                        'precio': request.POST[key.replace('codigo', 'precio')],
                        'monto': request.POST[key.replace('codigo', 'monto')],
                    }
                    producto = Producto.objects.create(**producto_data)
                    productos.append(producto)
            """

            # Aquí puedes procesar los datos de los productos
            # ...

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