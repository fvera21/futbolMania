# Generated by Django 3.1.2 on 2024-06-05 03:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_auto_20240604_2304'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cliente',
            name='factura',
        ),
        migrations.RemoveField(
            model_name='empresa',
            name='factura',
        ),
        migrations.RemoveField(
            model_name='envio',
            name='factura',
        ),
        migrations.RemoveField(
            model_name='vendedor',
            name='factura',
        ),
        migrations.AddField(
            model_name='factura',
            name='cliente',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='core.cliente'),
        ),
        migrations.AddField(
            model_name='factura',
            name='empresa',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='core.empresa'),
        ),
        migrations.AddField(
            model_name='factura',
            name='envio',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='core.envio'),
        ),
        migrations.AddField(
            model_name='factura',
            name='vendedor',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='core.vendedor'),
        ),
    ]
