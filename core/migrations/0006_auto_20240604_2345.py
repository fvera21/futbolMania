# Generated by Django 3.1.2 on 2024-06-05 03:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_auto_20240604_2341'),
    ]

    operations = [
        migrations.AlterField(
            model_name='producto',
            name='monto',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='producto',
            name='precio',
            field=models.IntegerField(),
        ),
    ]
