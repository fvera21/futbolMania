from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import Group
from django.core.paginator import Paginator
from .forms import RegistroForm

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
