from django.views import generic
import numpy as np
import csv
import os
import datetime
from kmodes.kprototypes import KPrototypes
from kmodes.kmodes import KModes
from django.http import HttpResponse
import datetime
from pathlib import Path
from django.db import connection


# Global variables
kproto = 0 # variable with the cluster object if it has been computed



#Get real data with a flag of training_data as TRUE: This data is useful to set the clusters
def get_training_data():
    with connection.cursor() as cursor:
        #cursor.execute("SELECT foo FROM bar WHERE baz = %s", [self.baz])
        #cursor.execute("SELECT * FROM crosstab ($$ select form_token,question_id,answer_text from surveys_answer where training_set=1 order by 1,2$$) AS final_result(submit_id varchar(200),question1 varchar(200),question2 varchar(200),question3 varchar(200),question4 varchar(200),question5 varchar(200),question6 varchar(200),question7 varchar(200),question8 varchar(200),question9 varchar(200),question10 varchar(200),question11 varchar(200),question12 varchar(200),question13 varchar(200),question14 varchar(200),question15 varchar(200),question16 varchar(200),question17 varchar(200),question18 varchar(200),question19 varchar(200),question20 varchar(200),question21 varchar(200),question22 varchar(200),question23 varchar(200),question24 varchar(200),question25 varchar(200),question26 varchar(200),question27 varchar(200))")
        cursor.execute("SELECT * FROM crosstab ($$ select form_token,question_id,answer_text from surveys_answer where question_id in (1,2,3,7,8) and training_set=1 order by 1,2$$) AS final_result(submit_id varchar(200),question1 varchar(200),question2 varchar(200),question3 varchar(200),question7 varchar(200),question8 varchar(200))")
        row = cursor.fetchall()
    return row


#Get real data with a flag of training_data as FALSE: This data should be predicted
#This is expected to run as a batch procedure every X minutes
def get_data_to_predict():
    with connection.cursor() as cursor:
        #cursor.execute("SELECT foo FROM bar WHERE baz = %s", [self.baz])
        #cursor.execute("SELECT * FROM crosstab ($$ select form_token,question_id,answer_text from surveys_answer where training_set=0 order by 1,2$$) AS final_result(submit_id varchar(200),question1 varchar(200),question2 varchar(200),question3 varchar(200),question4 varchar(200),question5 varchar(200),question6 varchar(200),question7 varchar(200),question8 varchar(200),question9 varchar(200),question10 varchar(200),question11 varchar(200),question12 varchar(200),question13 varchar(200),question14 varchar(200),question15 varchar(200),question16 varchar(200),question17 varchar(200),question18 varchar(200),question19 varchar(200),question20 varchar(200),question21 varchar(200),question22 varchar(200),question23 varchar(200),question24 varchar(200),question25 varchar(200),question26 varchar(200),question27 varchar(200))")
        cursor.execute("SELECT * FROM crosstab ($$ select form_token,question_id,answer_text from surveys_answer where question_id in (1,2,3,7,8) and training_set=0 order by 1,2$$) AS final_result(submit_id varchar(200),question1 varchar(200),question2 varchar(200),question3 varchar(200),question7 varchar(200),question8 varchar(200))")
        row = cursor.fetchall()
    return row

#Inser the cluster label for each point predicted
def insert_cluster(cluster_label,tariff,customer_type,power,consumption,product_type):
    with connection.cursor() as cursor:
        #cursor.execute("SELECT foo FROM bar WHERE baz = %s", [self.baz])
        cursor.execute("INSERT INTO cluster_centroids(cluster_label,tariff,customer_type,power,consumption,product_type,cluster_date) VALUES(%s,%s,%s,%s,%s,%s,%s)",(cluster_label,tariff,customer_type,power,consumption,product_type,datetime.datetime.now()))
    return 1;

#Inser the cluster label for each point predicted
def insert_predicted_data(ids_array,data_array,fit_label):
    loop_counter=0
    for id in ids_array:
        with connection.cursor() as cursor:
            #cursor.execute("SELECT foo FROM bar WHERE baz = %s", [self.baz])
            cursor.execute("INSERT INTO cluster_prediction(form_id,prediction_date,cluster_label) VALUES(%s,%s,%s)",(id,datetime.datetime.now(),int(fit_label[loop_counter])))
            loop_counter+=1
    return 1;

def get_power_term_cost_data(tariff):
    with connection.cursor() as cursor:
        cursor.execute("select (cost_avg+random()*(cost_var-(-cost_var))) tp_cost from cluster_costs where cost_description='TP*potencia_contratada' and cost_tariff=%s", [tariff])
        #(str(tariff))
        row = cursor.fetchall()
    return row

def get_hired_power_translate(power):
    with connection.cursor() as cursor:
        cursor.execute("select random()*(max_hired_power-min_hired_power)+min_hired_power as random_hired_power from surveys_Translate_Hired_Power where hired_power_literal=%s", [power])
        #(str(tariff))
        row = cursor.fetchall()
    return row

#Returns the "power term" cost
#Params: Tariff: Electric tariff;Power: Hired power
def power_term_cost(tariff,power):
    cost=get_power_term_cost_data(tariff)
    random_hired_power=get_hired_power_translate(power)
    ptc=cost*random_hired_power
    return ptc

def get_green_energy_cost_data():
    with connection.cursor() as cursor:
        cursor.execute("select cost_avg from cluster_costs where cluster_costs.cost_name ='Coste energia verde'", [power])
        #(str(tariff))
        row = cursor.fetchall()
    return row

#Returns the "green energy" cost
#Params: None
def green_energy_cost():
    gec=get_green_energy_cost_data()
    return gec


def get_funding_data(funding_duration):
    with connection.cursor() as cursor:
        cursor.execute("select financing_monthly_interest from cluster_financing where financing_month_duration=%d", [funding_duration])
        row = cursor.fetchall()
    return row

#Returns the monthly fee based on funding conditions
#Params: funding_duration: months of the funding, value to fund
def get_funding(funding_duration,funding_value):
    interest=get_funding_data(funding_duration)
    total_funding_payment=funding_value*((interest/100)+1)
    monthly_funding_fee=total_funding_payment/funding_duration
    return monthly_funding_fee

def get_battery_data(customer_type,tariff):
    with connection.cursor() as cursor:
        cursor.execute("select battery_price from cluster_battery where battery_customer_type=%s and battery_tariff=%s",([customer_type], [tariff]))
        row = cursor.fetchall()
    return row

def batery_cost(customer_type,tariff,funding_duration):
    battery_total_price=get_battery_data(customer_type,tariff)
    batery_monthly_funding_fee=get_funding(funding_duration,battery_total_price)
    return batery_monthly_funding_fee

def get_smarthome_data(customer_type,tariff):
    with connection.cursor() as cursor:
        cursor.execute("select random()*(smarthome_max_price-smarthome_min_price) from cluster_smarthome where smarthome_customer_type=%s and smarthome_tariff=%s",([customer_type], [tariff]))
        row = cursor.fetchall()
    return row

def smarthome_cost(customer_type,tariff,funding_duration):
    smarthome_total_price=get_smarthome_data(customer_type,tariff)
    smarthome_monthly_funding_fee=get_funding(funding_duration,smarthome_total_price)
    return smarthome_monthly_funding_fee


def get_vehicle_data(power,tariff):
    with connection.cursor() as cursor:
        cursor.execute("select case when %d < vehicle_min_power then 0 when %d BETWEEN  vehicle_min_power and vehicle_max_power then 1*random()*(vehicle_max_price-vehicle_min_price)+vehicle_min_price when %d > vehicle_max_power then round((%d::FLOAT/vehicle_max_power::FLOAT)::INTEGER,2)*random()*(vehicle_max_price-vehicle_min_price)+vehicle_min_price end from cluster_vehicle where vehicle_tariff=%s",([power], [tariff]))
        row = cursor.fetchall()
    return row

def vehicle_cost(power,tariff,funding_duration):
    vehicle_total_price=get_vehicle_data(power,tariff)
    vehicle_monthly_funding_fee=get_funding(funding_duration,vehicle_total_price)
    return vehicle_monthly_funding_fee

def get_manager_data(tariff,customer_type):
    with connection.cursor() as cursor:
        cursor.execute("select manager_price from cluster_manager WHERE manager_tariff=%s and manager_customer_type=%s",([tariff], [customer_type]))
        row = cursor.fetchall()
    return row

#Returns the "manager_cost" cost
#Params: None
def manager_cost(tariff,customer_type):
    mc=get_manager_data(tariff,customer_type)
    return mc

def get_maintenance_data(tariff,customer_type):
    with connection.cursor() as cursor:
        cursor.execute("select maintenance_price from cluster_maintenance where maintenance_tariff=%s and maintenance_customer_type=%s",([tariff], [customer_type]))
        row = cursor.fetchall()
    return row

#Returns the "maintenance_cost" cost
#Params: None
def maintenance_cost(tariff,customer_type):
    maintenance_c=get_maintenance_data(tariff,customer_type)
    return maintenance_c

def get_insurance_data(tariff,customer_type):
    with connection.cursor() as cursor:
        cursor.execute("select insurance_price from cluster_insurance where insurance_tariff=%s and insurance_customer_type=%s",([tariff], [customer_type]))
        row = cursor.fetchall()
    return row

#Returns the "insurance_cost" cost
#Params: None
def insurance_cost(tariff,customer_type):
    ic=get_insurance_data(tariff,customer_type)
    return ic

#Returns the "maintenance_cost" cost
#Params: None
def maintenance_cost(tariff,customer_type):
    maintenance_c=get_maintenance_data(tariff,customer_type)
    return maintenance_c

# Gets a cluster and extract all properties to create a CSV report.
def clusterStatisticsCSV(kproto):

    cluster_centroids=kproto.cluster_centroids_
    cluster_centroids_beauty=np.array([
                                        np.array([
                                                cluster_centroids[0][0][0],
                                                cluster_centroids[1][0][0],
                                                cluster_centroids[1][0][1],
                                                cluster_centroids[1][0][2],
                                                cluster_centroids[1][0][3],
                                                ]),
                                        np.array([
                                                cluster_centroids[0][1][0],
                                                cluster_centroids[1][1][0],
                                                cluster_centroids[1][1][1],
                                                cluster_centroids[1][1][2],
                                                cluster_centroids[1][1][3],
                                            ]),
                                        np.array([
                                                cluster_centroids[0][2][0],
                                                cluster_centroids[1][2][0],
                                                cluster_centroids[1][2][1],
                                                cluster_centroids[1][2][2],
                                                cluster_centroids[1][2][3],
                                        ]),
                                        ])
    #Save cluster 1, A.K.A product 1
    cluster_label=0
    consumption = int(cluster_centroids[0][0][0])
    power=cluster_centroids[1][0][0],
    product_type = cluster_centroids[1][0][1]
    customer_type = cluster_centroids[1][0][2],
    tariff = cluster_centroids[1][0][3]
    insert_cluster(cluster_label, tariff, customer_type, power, consumption, product_type)
    # Save cluster 2, A.K.A product 2
    cluster_label = 0
    consumption = int(cluster_centroids[0][1][0])
    power = cluster_centroids[1][1][0],
    product_type = cluster_centroids[1][1][1]
    customer_type = cluster_centroids[1][1][2],
    tariff = cluster_centroids[1][1][3]
    insert_cluster(cluster_label, tariff, customer_type, power, consumption, product_type)
    # Save cluster 3, A.K.A product 3
    cluster_label = 0
    consumption = int(cluster_centroids[0][2][0])
    power = cluster_centroids[1][2][0],
    product_type = cluster_centroids[1][2][1]
    customer_type = cluster_centroids[1][2][2],
    tariff = cluster_centroids[1][2][3]
    insert_cluster(cluster_label, tariff, customer_type, power, consumption, product_type)

        #np.array([
                #  np.array([
    #                       cluster_centroids[0][0][0],
    #                       cluster_centroids[1][0][0],
    #                       cluster_centroids[0][0][1]
    #             ])
    #               ,np.array([
    #                       cluster_centroids[0][1][0],
    #                       cluster_centroids[1][1][0],
    #                        cluster_centroids[0][1][1]
    #                       ])
    #            ])
    path = './tmp_files/cluster_results/'
    filename=datetime.datetime.now().strftime('%Y%m%d_%H%M%S')+'_kprototype_cluster_results.csv'
    with open(path+filename, 'w') as csvfile:
        filewriter = csv.writer(csvfile, delimiter=';',quotechar='"', quoting=csv.QUOTE_ALL)
        filewriter.writerow(['Concept', 'Value','Concept description'])
        filewriter.writerow(['Cluster centroids', cluster_centroids_beauty,'Categories of cluster centroids'])
        filewriter.writerow(['Cluster computing cost', kproto.cost_,'Clustering cost, defined as the sum distance of all points to their respective cluster centroids.'])
        filewriter.writerow(['Cluster iterations', kproto.n_iter_,'The number of iterations the algorithm ran for'])
        filewriter.writerow(['Points labels', kproto.labels_, 'Labels of each point'])
        filewriter.writerow(['Gamma', kproto.gamma, 'The (potentially calculated) weightting factor. Gamma relates the categorical cost to the numerical cost'])

# This function creates kprototype clusters using the current data at database
def ClusterCreation(request,*args):
    global kproto

    #Example of clustering with random data
    '''
    # random categorical data
    data = np.array([
            [0,'a',4],
            [1,'e',3],
            [6,'ffed',15],
            [5,'fdfd',16]
            ])

    kproto = KPrototypes(n_clusters=2, init='Cao', verbose=2)
    clusters = kproto.fit(data, categorical=[1])
    # Create CSV with cluster statistics
    clusterStatisticsCSV(kproto)
    for argument in args:
        if argument is not None:
            return
    '''
    # Get data from database
    rows=get_training_data()
    # Cast as numpy Array
    rows_array=np.array(rows)
    #Split data into variables and id's
    data_array = np.array(rows_array)[:,1:] #dejamos sólo las variables que pueden clusterizar el cliente
    ids_array = np.array(rows_array)[:, 0] #guardamos las id's en otro array

    #Clustering
    kproto = KPrototypes(n_clusters=3, init='Cao', verbose=2)
    #clusters = kproto.fit(data_array, categorical=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26])
    clusters = kproto.fit(data_array,categorical=[1, 2, 3, 4])
    # Create CSV with cluster statistics
    clusterStatisticsCSV(kproto)
    for argument in args:
        if argument is not None:
            return

    return HttpResponse('Clustering realizado y CSV report generado')

def ClusterPrediction(request):

    global kproto

    if (kproto==0):
        ClusterCreation(None,1)

    # Get data from database
    rows = get_data_to_predict()

    if not rows:
        return HttpResponse('No hay clientes para predecir.')
    # Cast as numpy Array
    rows_array = np.array(rows)
    # Split data into variables and id's
    data_array = np.array(rows_array)[:, 1:]  # dejamos sólo las variables que pueden clusterizar el cliente
    ids_array = np.array(rows_array)[:, 0]  # guardamos las id's en otro array

    # Example of clustering fit prediction with random data
    '''
    # random point to fit
    data = np.array([[0, 'a', 3]])
    fit_label = kproto.predict(data, categorical=[1]) #categorical is the Index of columns that contain categorical data
    '''
    #Cluster prediction
    #fit_label = kproto.predict(data_array,categorical=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26])  # categorical is the Index of columns that contain categorical data
    fit_label = kproto.predict(data_array,categorical=[1, 2, 3, 4])  # categorical is the Index of columns that contain categorical data
    # Sava prediction into table
    insert_predicted_data(ids_array,data_array,fit_label)
    return HttpResponse('Predicción de clientes pendientes realizada.')

# Function with kmodes (non-categorical) to use in further developments and to understand better clustering properties

def clusterCreationKmode():
    # random categorical data
    data = np.random.choice(20, (100, 10))

    km = KModes(n_clusters=4, init='Huang', n_init=5, verbose=1)

    clusters = km.fit_predict(data)

    return HttpResponse(km.cluster_centroids_)
