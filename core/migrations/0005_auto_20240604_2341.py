# Generated by Django 3.1.2 on 2024-06-05 03:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_auto_20240604_2335'),
    ]

    operations = [
        migrations.AlterField(
            model_name='factura',
            name='costoenvio',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='factura',
            name='descuento',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='factura',
            name='descuentoMonto',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='factura',
            name='iva',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='factura',
            name='ivaMonto',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='factura',
            name='subtotal',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='factura',
            name='total',
            field=models.IntegerField(),
        ),
    ]
