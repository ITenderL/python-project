# Generated by Django 5.1.5 on 2025-01-22 06:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('helloWorld', '0002_studentinfo_age'),
    ]

    operations = [
        migrations.AlterField(
            model_name='studentinfo',
            name='age',
            field=models.IntegerField(),
        ),
    ]
