# Generated by Django 3.1.2 on 2024-07-16 03:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0012_auto_20240704_0014'),
    ]

    operations = [
        migrations.AddField(
            model_name='factura',
            name='anulada',
            field=models.BooleanField(default=False),
        ),
    ]