from django.db import models
import datetime
from django.db import models
from django.utils import timezone

class Centroids(models.Model):
    cluster_label = models.IntegerField()
    tariff = models.CharField(max_length=15)
    customer_type = models.CharField(max_length=200)
    power = models.CharField(max_length=200)
    consumption = models.IntegerField()
    product_type = models.CharField(max_length=200)
    cluster_date = models.DateTimeField(default=timezone.now, blank=True)
# Create your models here.
class Prediction(models.Model):
    form_id = models.CharField(max_length=200)
    cluster_label = models.IntegerField(blank=True, null=True)
    prediction_date=models.DateTimeField(default=timezone.now, blank=True)

class Maintenance(models.Model):
    maintenance_name=models.CharField(max_length=200)
    maintenance_price=models.DecimalField(decimal_places=2,max_digits=10)
    maintenance_level=models.IntegerField()
    deleted=models.IntegerField(default=0)

class Insurance(models.Model):
    insurance_name=models.CharField(max_length=200)
    insurance_price=models.DecimalField(decimal_places=2,max_digits=10)
    insurance_level=models.IntegerField()
    deleted=models.IntegerField(default=0)

class Battery(models.Model):
    battery_name=models.CharField(max_length=200)
    battery_price=models.DecimalField(decimal_places=2,max_digits=10)
    battery_tariff=models.CharField(max_length=15)
    battery_customer_type = models.CharField(max_length=200)
    deleted=models.IntegerField(default=0)

class Vehicle(models.Model):
    vehicle_name=models.CharField(max_length=200)
    vehicle_min_price=models.DecimalField(decimal_places=2,max_digits=10,default=0)
    vehicle_max_price = models.DecimalField(decimal_places=2, max_digits=10,default=0)
    vehicle_tariff=models.CharField(max_length=15)
    vehicle_min_power = models.IntegerField(default=0)
    vehicle_max_power = models.IntegerField(default=0)
    vehicle_power_unit = models.CharField(max_length=5,default='KW')
    deleted=models.IntegerField(default=0)

class Manager(models.Model):
    manager_name=models.CharField(max_length=200)
    manager_price=models.DecimalField(decimal_places=2,max_digits=10)
    manager_tariff=models.CharField(max_length=15)
    manager_customer_type = models.CharField(max_length=200)
    deleted=models.IntegerField(default=0)

class Smarthome(models.Model):
    smarthome_name=models.CharField(max_length=200)
    smarthome_min_price=models.DecimalField(decimal_places=2,max_digits=10,default=0)
    smarthome_max_price = models.DecimalField(decimal_places=2, max_digits=10,default=0)
    smarthome_tariff=models.CharField(max_length=15)
    smarthome_customer_type = models.CharField(max_length=200)
    deleted=models.IntegerField(default=0)

class Financing(models.Model):
    financing_name = models.CharField(max_length=200)
    financing_monthly_interest = models.DecimalField(decimal_places=2,max_digits=10)
    financing_month_duration = models.IntegerField()
    deleted = models.IntegerField(default=0)

class Costs(models.Model):
    cost_name=models.CharField(max_length=200)
    cost_description = models.CharField(max_length=200)
    cost_unit = models.CharField(max_length=200)
    cost_tariff = models.CharField(max_length=10,blank=True, null=True)
    cost_avg=models.DecimalField(decimal_places=2,max_digits=10)
    cost_dsv=models.DecimalField(decimal_places=2,max_digits=10)
    cost_var=models.DecimalField(decimal_places=2,max_digits=10)
    deleted=models.IntegerField(default=0)


