# Generated by Django 2.0.5 on 2018-07-31 15:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cluster', '0003_battery_centroids_financing_insurance_maintenance_manager_smarthome_vehicle'),
    ]

    operations = [
        migrations.AlterField(
            model_name='centroids',
            name='consumption',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='centroids',
            name='power',
            field=models.CharField(max_length=200),
        ),
    ]
