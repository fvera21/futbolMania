# Generated by Django 3.1.2 on 2024-06-05 03:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_auto_20240604_2233'),
    ]

    operations = [
        migrations.AddField(
            model_name='cliente',
            name='factura',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='clientes', to='core.factura'),
        ),
        migrations.AddField(
            model_name='empresa',
            name='factura',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='empresas', to='core.factura'),
        ),
        migrations.AddField(
            model_name='envio',
            name='factura',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='envios', to='core.factura'),
        ),
        migrations.AddField(
            model_name='producto',
            name='factura',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='productos', to='core.factura'),
        ),
        migrations.CreateModel(
            name='Vendedor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombreEmpresa', models.CharField(max_length=100)),
                ('direccion', models.CharField(max_length=200)),
                ('telefono', models.CharField(max_length=15)),
                ('correo', models.EmailField(max_length=254)),
                ('web', models.CharField(blank=True, max_length=30, null=True)),
                ('factura', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='vendedores', to='core.factura')),
            ],
        ),
    ]
