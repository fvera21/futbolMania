from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import Group
from django.core.paginator import Paginator
from .forms import *

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
            # Haz algo con los datos de los formularios
            pass
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