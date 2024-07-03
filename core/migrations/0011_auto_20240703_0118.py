# Generated by Django 3.1.2 on 2024-07-03 05:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0010_auto_20240703_0109'),
    ]

    operations = [
        migrations.AlterField(
            model_name='entrega',
            name='direccion',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='entrega',
            name='rut',
            field=models.CharField(max_length=15, null=True),
        ),
        migrations.AlterField(
            model_name='rechazo',
            name='descripcion',
            field=models.TextField(null=True),
        ),
        migrations.AlterField(
            model_name='rechazo',
            name='factura',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='core.factura'),
        ),
    ]
