# Generated by Django 3.1.2 on 2024-06-05 02:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='empresa',
            name='web',
            field=models.CharField(blank=True, max_length=30, null=True),
        ),
    ]