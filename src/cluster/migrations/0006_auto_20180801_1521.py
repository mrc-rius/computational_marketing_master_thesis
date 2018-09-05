# Generated by Django 2.0.5 on 2018-08-01 13:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cluster', '0005_costs'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='vehicle',
            name='vehicle_power',
        ),
        migrations.RemoveField(
            model_name='vehicle',
            name='vehicle_price',
        ),
        migrations.AddField(
            model_name='vehicle',
            name='vehicle_max_power',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='vehicle',
            name='vehicle_max_price',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=10),
        ),
        migrations.AddField(
            model_name='vehicle',
            name='vehicle_min_power',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='vehicle',
            name='vehicle_min_price',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=10),
        ),
        migrations.AddField(
            model_name='vehicle',
            name='vehicle_power_unit',
            field=models.CharField(default='KW', max_length=5),
        ),
    ]
