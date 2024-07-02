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
    web = forms.CharField(label='Sitio Web', max_length=30, required=False)

    def __init__(self, *args, **kwargs):
        super(EmpresaForm, self).__init__(*args, **kwargs)
        # Establecer valores predeterminados
        self.fields['nombreEmpresa'].initial = 'FutbolManía'
        self.fields['direccion'].initial = 'Av las nieves 02196'
        self.fields['telefono'].initial = '972834932'
        self.fields['correo'].initial = 'futbolmania@gmail.com'
        self.fields['web'].initial = 'www.futbolmania.com'
        
        # Hacer todos los campos de solo lectura
        for field in self.fields.values():
            field.disabled = True

class VendedorForm(forms.Form):
    nombreEmpresa = forms.CharField(label='Nombre de la empresa', max_length=100)
    direccion = forms.CharField(label='Dirección', max_length=200)
    telefono = forms.CharField(label='Teléfono', max_length=15)
    correo = forms.EmailField(label='Correo')
    web = forms.CharField(label='Sitio Web', max_length=30, required=False)

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

class VendedorForm(forms.Form):
    nombrevendedor = forms.CharField(label='Nombre del vendedor', max_length=100)
    direccion = forms.CharField(label='Dirección', max_length=200)
    telefono = forms.CharField(label='Teléfono', max_length=15)
    correo = forms.EmailField(label='Correo')
    sitioweb = forms.CharField(label='Sitio Web', max_length=200)
