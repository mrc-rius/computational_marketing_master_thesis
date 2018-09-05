# Generated by Django 2.0.5 on 2018-08-01 10:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cluster', '0004_auto_20180731_1747'),
    ]

    operations = [
        migrations.CreateModel(
            name='Costs',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cost_name', models.CharField(max_length=200)),
                ('cost_description', models.CharField(max_length=200)),
                ('cost_unit', models.CharField(max_length=200)),
                ('cost_avg', models.DecimalField(decimal_places=2, max_digits=10)),
                ('cost_dsv', models.DecimalField(decimal_places=2, max_digits=10)),
                ('cost_var', models.DecimalField(decimal_places=2, max_digits=10)),
                ('deleted', models.IntegerField(default=0)),
            ],
        ),
    ]
