# Generated by Django 2.0.5 on 2018-08-04 15:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('surveys', '0006_translate_hired_power'),
    ]

    operations = [
        migrations.CreateModel(
            name='Translate_Interest',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('interest_value', models.CharField(max_length=2)),
                ('min_interest', models.DecimalField(decimal_places=2, max_digits=2)),
                ('max_interest', models.DecimalField(decimal_places=2, max_digits=2)),
                ('deleted', models.IntegerField(default=0)),
            ],
        ),
    ]