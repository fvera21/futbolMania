from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class RegistroForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

class EmpresaForm(forms.Form):
    nombreEmpresa = forms.CharField(label='Nombre de la empresa', max_length=100)
    direccion = forms.CharField(label='Dirección', max_length=200)
    telefono = forms.CharField(label='Teléfono', max_length=15)
    correo = forms.EmailField(label='Correo')
    web = forms.URLField(label='Sitio Web', required=False)

class ClienteForm(forms.Form):
    nombrecliente = forms.CharField(label='Nombre del cliente', max_length=100)
    nombreEmpresa = forms.CharField(label='Nombre de la empresa', max_length=100)
    direccion = forms.CharField(label='Dirección', max_length=200)
    telefono = forms.CharField(label='Teléfono', max_length=15)
    correo = forms.EmailField(label='Correo')

class EnvioForm(forms.Form):
    metodoenvio = forms.CharField(label='Método de envío', max_length=100, required=False)
    direccionenvio = forms.CharField(label='Dirección', max_length=200)
    condicionesenvio = forms.CharField(label='Condiciones de envío', max_length=500, required=False)

