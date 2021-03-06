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
import itertools
import collections

# Global variables
kproto = 0 # variable with the cluster object if it has been computed

#Get cluster data for specific customer
def get_cluster_data():
    with connection.cursor() as cursor:
        cursor.execute("select cp.form_id,cc.consumption,cc.power from cluster_prediction cp inner join cluster_centroids cc on cp.cluster_label=cc.cluster_label where cc.cluster_date::date=(select max(cluster_date::date) from cluster_centroids)")
        row = cursor.fetchall()
    return row

#Get real data with a flag of training_data as TRUE: This data is useful to set the clusters
def get_training_data():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM crosstab ($$ select form_token,question_id,answer_text from surveys_answer where question_id in (1,2,3,5,6) and training_set=1 order by 1,2$$) AS final_result(submit_id varchar(200),question1 varchar(200),question2 varchar(200),question3 varchar(200),question5 varchar(200),question6 varchar(200))")
        row = cursor.fetchall()
    return row


#Get real data with a flag of training_data as FALSE: This data should be predicted
#This is expected to run as a batch procedure every X minutes
def get_data_to_predict():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM crosstab ($$ select form_token,question_id,answer_text from surveys_answer where question_id in (1,2,3,5,6) and training_set=0 order by 1,2$$) AS final_result(submit_id varchar(200),question1 varchar(200),question2 varchar(200),question3 varchar(200),question5 varchar(200),question6 varchar(200))")
        row = cursor.fetchall()
    return row

#Get real data with a flag of training_data as FALSE: This data should be predicted
#This is expected to run as a batch procedure every X minutes
def get_data_to_optimize():
    with connection.cursor() as cursor:
        cursor.execute("SELECT  submit_id,  consumption,  power,  customer_type,  tariff,  substr(insurance,1,1) as insurance,  substr(maintenance,1,1) maintenance,  substr(battery,1,1) battery,  substr(smarthome,1,1) smarthome,  substr(vehicle,1,1) vehicle,  substr(green_energy,1,1) green_energy,  substr(business_manager,1,1) business_manager,  funding FROM crosstab($$ select form_token,question_id,answer_text from surveys_answer where question_id in (1,2,5,6,7,8,9,10,11,12,16,17) and training_set=0 order by 1,2$$) AS final_result(submit_id VARCHAR(200), consumption VARCHAR(200), power VARCHAR(200), customer_type VARCHAR(200), tariff VARCHAR(200), insurance VARCHAR(200), maintenance VARCHAR(200), battery VARCHAR(200), smarthome VARCHAR(200), vehicle VARCHAR(200), green_energy VARCHAR(200), business_manager VARCHAR(200), funding VARCHAR(200))")
        row = cursor.fetchall()
    return row

#Inser the cluster label for each point predicted
def insert_cluster(cluster_label,tariff,customer_type,power,consumption,product_type):
    with connection.cursor() as cursor:
        cursor.execute("INSERT INTO cluster_centroids(cluster_label,tariff,customer_type,power,consumption,product_type,cluster_date) VALUES(%s,%s,%s,%s,%s,%s,%s)",(cluster_label,tariff,customer_type,power,consumption,product_type,datetime.datetime.now()))
    return 1;

#Inser the cluster label for each point predicted
def insert_predicted_data(ids_array,data_array,fit_label):
    loop_counter=0
    for id in ids_array:
        with connection.cursor() as cursor:
            cursor.execute("INSERT INTO cluster_prediction(form_id,prediction_date,cluster_label) VALUES(%s,%s,%s)",(id,datetime.datetime.now(),int(fit_label[loop_counter])))
            loop_counter+=1
    return 1;

#Returns a random value in the range of hired power the customer has chosen.
#Params:
    # Power: String with the hired power range
def get_hired_power_translate(power):
    with connection.cursor() as cursor:
        cursor.execute("select random()*(max_hired_power-min_hired_power)+min_hired_power as random_hired_power from surveys_Translate_Hired_Power where hired_power_literal=%s", [power])
        row = cursor.fetchall()
    return row

#Returns a random value in the range of maximum and minimum interest that is evaluated the customer answer for any question related with
# HOW INTERESTED ARE YOU AT...
#Params:
    # interest: String with a number (first position of original string)
def get_interest_translate(interest):
    with connection.cursor() as cursor:
        cursor.execute("select random()*(max_interest-min_interest)+min_interest as rand_interest from surveys_Translate_Interest where interest_value=%s", [interest])
        row = cursor.fetchall()
    return row

def get_power_term_cost_data(tariff):
    with connection.cursor() as cursor:
        cursor.execute("select (cost_avg+(random()*cost_var-(-cost_var))+(-cost_var)) as cost from cluster_costs where cost_description='TP*potencia_contratada' and cost_tariff=%s", [tariff])
        row = cursor.fetchall()
    return row

#Returns the "power term" cost
#Params: Tariff: Electric tariff;Power: Hired power
def power_term_cost(tariff,power):
    cost=get_power_term_cost_data(tariff)
    ptc=float(cost[0][0])*float(power[0][0])
    return ptc

def get_energy_term_cost_data(tariff):
    with connection.cursor() as cursor:
        cursor.execute("select (cost_avg+(random()*cost_var-(-cost_var))+(-cost_var)) as cost from cluster_costs where cost_description='(TE+otros costes)*consumo' and cost_tariff=%s", [tariff])
        row = cursor.fetchall()
    return row

#Returns the "energy_term" cost
#Params: tariff:Customer tariff; Consumption: Energy consumption in KwH
def energy_term_cost(tariff,consumption):
    et_unit_cost=get_energy_term_cost_data(tariff)
    etc=float(et_unit_cost[0][0])*float(consumption)
    return etc

def get_green_energy_cost_data():
    with connection.cursor() as cursor:
        cursor.execute("select cost_avg from cluster_costs where cluster_costs.cost_name ='Coste energia verde'")
        row = cursor.fetchall()
    return row

#Returns the "green energy" cost
#Params: None
def green_energy_cost():
    gec=get_green_energy_cost_data()
    return gec


def get_funding_data(funding_duration):
    with connection.cursor() as cursor:
        cursor.execute("select financing_monthly_interest from cluster_financing where financing_month_duration=%s",[funding_duration])
        row = cursor.fetchall()
    return row

#Returns the monthly fee based on funding conditions
#Params: funding_duration: months of the funding, value to fund
def get_funding(funding_duration,funding_value):
    interest=get_funding_data(funding_duration)
    total_funding_payment=float(funding_value[0][0])*((float(interest[0][0])/float(100))+float(1))
    monthly_funding_fee=total_funding_payment/funding_duration
    return monthly_funding_fee

def get_battery_data(customer_type,tariff):
    with connection.cursor() as cursor:
        cursor.execute("select battery_price from cluster_battery where battery_customer_type=%s and battery_tariff=%s",(customer_type, tariff))
        row = cursor.fetchall()
    return row

#Returns the "batery_cost" splitted in X months using interest
#Params: tariff:Customer tariff ; customer_type: customer type :S; funding duration: motnhs that will pay for the service
def battery_cost(customer_type,tariff,funding_duration):
    battery_total_price=get_battery_data(customer_type,tariff)
    if not battery_total_price:
        battery_total_price=0
    batery_monthly_funding_fee=get_funding(funding_duration,battery_total_price)
    return batery_monthly_funding_fee

def get_smarthome_data(customer_type,tariff):
    with connection.cursor() as cursor:
        cursor.execute("select random()*(smarthome_max_price-smarthome_min_price) from cluster_smarthome where smarthome_customer_type=%s and smarthome_tariff=%s",(customer_type, tariff))
        row = cursor.fetchall()
    return row

#Returns the "smarthome_cost" splitted in X months using interest
#Params: tariff:Customer tariff ; customer_type: customer type :S; funding duration: motnhs that will pay for the service
def smarthome_cost(customer_type,tariff,funding_duration):
    smarthome_total_price=get_smarthome_data(customer_type,tariff)
    if not smarthome_total_price:
        smarthome_total_price=0.0
    smarthome_monthly_funding_fee=get_funding(funding_duration,smarthome_total_price)
    return smarthome_monthly_funding_fee


def get_vehicle_data(power,tariff):
    with connection.cursor() as cursor:
        cursor.execute("select case when %s::float < vehicle_min_power then 0 when %s::float BETWEEN  vehicle_min_power and vehicle_max_power then 1*random()*(vehicle_max_price-vehicle_min_price)+vehicle_min_price when %s::float > vehicle_max_power then round((%s::FLOAT/vehicle_max_power::FLOAT)::INTEGER,2)*random()*(vehicle_max_price-vehicle_min_price)+vehicle_min_price end from cluster_vehicle where vehicle_tariff=%s",(power,power,power,power,tariff))
        row = cursor.fetchall()
    return row

#Returns the "vehicle_cost" splitted in X months using interest
#Params: tariff:Customer tariff ; customer_type: customer type :S; funding duration: motnhs that will pay for the service
def vehicle_cost(power,tariff,funding_duration):

    vehicle_total_price=get_vehicle_data(power,tariff)
    vehicle_monthly_funding_fee=get_funding(funding_duration,vehicle_total_price)
    return vehicle_monthly_funding_fee

def get_manager_data(tariff,customer_type):
    with connection.cursor() as cursor:
        cursor.execute("select manager_price from cluster_manager WHERE manager_tariff=%s and manager_customer_type=%s",(tariff, customer_type))
        row = cursor.fetchall()
    return row

#Returns the "manager_cost" cost
#Params: tariff:Customer tariff ; customer_type: customer type :S
def manager_cost(tariff,customer_type):
    mc=get_manager_data(tariff,customer_type)
    return mc

def get_maintenance_data(tariff,customer_type):
    with connection.cursor() as cursor:
        cursor.execute("select maintenance_price from cluster_maintenance where maintenance_tariff=%s and maintenance_customer_type=%s",(tariff, customer_type))
        row = cursor.fetchall()
    return row

#Returns the "maintenance_cost" cost
#Params: tariff:Customer tariff ; customer_type: customer type :S
def maintenance_cost(tariff,customer_type):
    maintenance_c=get_maintenance_data(tariff,customer_type)
    return maintenance_c

def get_insurance_data(tariff,customer_type):
    with connection.cursor() as cursor:
        cursor.execute("select insurance_price from cluster_insurance where insurance_tariff=%s and insurance_customer_type=%s",(tariff, customer_type))
        row = cursor.fetchall()
    return row

#Returns the "insurance_cost" cost
#Params: tariff:Customer tariff ; customer_type: customer type :S
def insurance_cost(tariff,customer_type):
    ic=get_insurance_data(tariff,customer_type)
    return ic


##Returns a nested dict of feasible subservices combinations sorted by total combination price
#Params:
    # interest_X_cost: Parameters with the maximum value a customer is willing to pay. Is directly a relation of value(interest)*weight(real cost)
    # total_interest_cost: maximum price to pay for each customer (adapted to willingness). Is equivalent to knapsack capacity
def knapsack_algorithm(interest_green_energy_cost,interest_battery_cost,interest_smarthome_cost,interest_vehicle_cost,interest_bm_cost,interest_maintenance_cost,insurance_maintenance_cost,total_interest_cost):

    subservices_dict= {
        'interest_green_energy_cost':interest_green_energy_cost,
        'interest_battery_cost':interest_battery_cost,
        'interest_smarthome_cost':interest_smarthome_cost,
        'interest_vehicle_cost':interest_vehicle_cost,
        'interest_bm_cost':interest_bm_cost,
        'interest_maintenance_cost':interest_maintenance_cost,
        'insurance_maintenance_cost':insurance_maintenance_cost
    }
    all_services_combination = {}

    for item in itertools.permutations(subservices_dict.items()):
        maximum_cost=float(total_interest_cost)
        current_cost=float(0)
        current_services={}
        for subservice_name,subservice_value in collections.OrderedDict(item).items():
            if(float(subservice_value)!=float(0)):
                new_cost=current_cost + subservice_value
                if new_cost<maximum_cost:
                    current_cost = new_cost
                    current_services[subservice_name] = subservice_value
                else:
                    # No insert duplicated combinations created from different permutations
                    if current_services not in all_services_combination.values():
                        # Save services combination in results dict because with a new service added the maximum cost is exceeded
                        all_services_combination[current_cost] = current_services #nested dict, the key of the main dict is the total cost of the current services of the sub dict

    return all_services_combination

#Returns the "total real & interest cost" of a product including all the services
#Params:
    # tariff: customer tariff, power: hired power by the customer ,consumption: monthly expected consumption
    # customer_type: customer type :S, funding_duration: months that a fee will be charged, relates with contract term
def cost(customer_form_id,tariff, power,consumption,customer_type,funding_duration,green_energy_interest,battery_interest,
                        smarthome_interest,vehicle_interest,bm_interest,maintenance_interest,insurance_interest,customer_or_cluster):
    # Random interest values for each service
    gei = get_interest_translate(green_energy_interest)
    bi = get_interest_translate(battery_interest)
    si = get_interest_translate(smarthome_interest)
    vi = get_interest_translate(vehicle_interest)
    bmi = get_interest_translate(bm_interest)
    mi = get_interest_translate(maintenance_interest)
    ii = get_interest_translate(insurance_interest)
    #Translate literal power to value
    random_hired_power = get_hired_power_translate(power)
    random_hired_power=str(random_hired_power[0][0])

    #Electricity costs
    ptc=power_term_cost(tariff, random_hired_power)
    etc=energy_term_cost(tariff, consumption)
    # Real costs
    gec = green_energy_cost()
    bc = battery_cost(customer_type, tariff, funding_duration)
    sc = smarthome_cost(customer_type, tariff, funding_duration)
    vc = vehicle_cost(random_hired_power, tariff, funding_duration)
    bmc = manager_cost(tariff, customer_type)
    mc = maintenance_cost(tariff, customer_type)
    ic = insurance_cost(tariff, customer_type)

    #Parse lists to values
    gec = gec[0][0]
    gei = gei[0][0]
    bc = bc
    bi = bi[0][0]
    sc = sc
    si = si[0][0]
    vc = vc
    vi = vi[0][0]
    bmc = bmc[0][0]
    bmi = bmi[0][0]
    mc = mc[0][0]
    mi = mi[0][0]
    ic = ic[0][0]
    ii = ii[0][0]

    #Compute interest costs
    interest_green_energy_cost=(float(gec) * float(gei))
    interest_battery_cost=(float(bc) * float(bi))
    interest_smarthome_cost=(float(sc) * float(si))
    interest_vehicle_cost=(float(vc) * float(vi))
    interest_bm_cost=(float(bmc) * float(bmi))
    interest_maintenance_cost=(float(mc) * float(mi))
    insurance_maintenance_cost =(float(ic) * float(ii))

    #Summatory
    total_energy_cost = ptc + etc  # It's the same for real and interest cost
    total_real_cost=float(gec)+float(bc)+float(sc)+float(vc)+float(bmc)+float(mc)+float(ic)
    total_interest_cost = interest_green_energy_cost + interest_battery_cost + interest_smarthome_cost + interest_vehicle_cost + interest_bm_cost + interest_maintenance_cost + insurance_maintenance_cost

    #knapsack algorithm with customer data
    solution_customer=knapsack_algorithm(interest_green_energy_cost,interest_battery_cost,interest_smarthome_cost,interest_vehicle_cost,interest_bm_cost,interest_maintenance_cost,insurance_maintenance_cost,total_interest_cost)
    solutionToCSV(customer_form_id,total_real_cost,total_interest_cost,total_energy_cost,solution_customer, customer_or_cluster,
                  tariff, power, consumption, customer_type, funding_duration, green_energy_interest, battery_interest,
                  smarthome_interest, vehicle_interest, bm_interest, maintenance_interest, insurance_interest)

    # knapsack algorithm with customer data
    solution_customer = knapsack_algorithm(interest_green_energy_cost, interest_battery_cost, interest_smarthome_cost,interest_vehicle_cost, interest_bm_cost, interest_maintenance_cost,insurance_maintenance_cost, total_interest_cost)
    solutionToCSV(customer_form_id,total_real_cost,total_interest_cost,total_energy_cost,solution_customer, customer_or_cluster,
                  tariff, power, consumption, customer_type, funding_duration, green_energy_interest, battery_interest,
                  smarthome_interest, vehicle_interest, bm_interest, maintenance_interest, insurance_interest)

    return 1


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
    cluster_label = 1
    consumption = int(cluster_centroids[0][1][0])
    power = cluster_centroids[1][1][0],
    product_type = cluster_centroids[1][1][1]
    customer_type = cluster_centroids[1][1][2],
    tariff = cluster_centroids[1][1][3]
    insert_cluster(cluster_label, tariff, customer_type, power, consumption, product_type)
    # Save cluster 3, A.K.A product 3
    cluster_label = 2
    consumption = int(cluster_centroids[0][2][0])
    power = cluster_centroids[1][2][0],
    product_type = cluster_centroids[1][2][1]
    customer_type = cluster_centroids[1][2][2],
    tariff = cluster_centroids[1][2][3]
    insert_cluster(cluster_label, tariff, customer_type, power, consumption, product_type)
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

#Creates a csv as output of feasible solutions
#Params: Solution: Python nested dictionary with all feasible product combination sorted by total price of each combination
        #origin: Param that tell us how algorithm has been run-->origin=0 means algorithm with customer data; otherwise means algorithm with cluster data
def solutionToCSV(customer_form_id,total_real_cost,total_interest_cost,total_energy_cost,solution,origin,
                  tariff, power, consumption, customer_type, funding_duration, green_energy_interest, battery_interest,
                  smarthome_interest, vehicle_interest, bm_interest, maintenance_interest, insurance_interest):
    path = './tmp_files/knapsack_results/'
    expensive_solution=max(solution)
    cheapest_solution = min(solution)
    best_ratio_solution=None # solution cost/number of elements in feasibel solution (smaller value best ratio)
    best_ratio_key=None
    if origin==0:
        filename = datetime.datetime.now().strftime('%Y%m%d_%H%M%S') + '_knapsack_customer_data_results.csv'
    else:
        filename = datetime.datetime.now().strftime('%Y%m%d_%H%M%S') + '_knapsack_cluster_data_results.csv'
    with open(path + filename, 'w') as csvfile:
        filewriter = csv.writer(csvfile, delimiter=';', quotechar='"', quoting=csv.QUOTE_ALL)
        filewriter.writerow(['Solution cost', 'Subservices included','Description'])
        filewriter.writerow([str(customer_form_id), 'Cusomer form id', 'Product for customer with this id'])
        filewriter.writerow([str(tariff), 'Tariff', 'Tariff parameter'])
        filewriter.writerow([str(power), 'Power', 'Power parameter'])
        filewriter.writerow([str(consumption), 'Consumption', 'Consumption parameter'])
        filewriter.writerow([str(customer_type), 'Customer type', 'Customer type parameter'])
        filewriter.writerow([str(funding_duration), 'Funding duration', 'Funding duration parameter'])
        filewriter.writerow([str(green_energy_interest), 'Green energy interest', 'Green energy_interest parameter'])
        filewriter.writerow([str(battery_interest), 'Battery interest', 'battery interest parameter'])
        filewriter.writerow([str(smarthome_interest), 'Smarthome interest', 'Smarthome interest parameter'])
        filewriter.writerow([str(vehicle_interest), 'Vehicle interest', 'Vehicle interest parameter'])
        filewriter.writerow([str(bm_interest), 'Business manager interest', 'Business manager interest parameter'])
        filewriter.writerow([str(maintenance_interest), 'Maintenance interest', 'Maintenance interest parameter'])
        filewriter.writerow([str(insurance_interest), 'Insurance interest','Insurance interest parameter'])
        filewriter.writerow([str(round(total_real_cost, 3)).replace(".", ","), 'All subservices','Cost of the product with all the subservices included without considering interest (real value)'])
        filewriter.writerow([str(round(total_interest_cost, 3)).replace(".", ","), 'All subservices with interest normalization','Cost of the product with all the subservices included but normalizing price with interest (maximum value for the customer)'])
        filewriter.writerow([str(round(total_energy_cost, 3)).replace(".", ","), 'Energy supply','Main cost: energy supply (monthly)'])
        for key in sorted(solution):
            filewriter.writerow([str(round(key,3)).replace(".",","), str(solution[key]),'Subservice feasible combination (monthly)'])
            current_ratio_solution=float(round(key,3))/float(len(solution[key]))
            if (best_ratio_solution is None or best_ratio_solution>current_ratio_solution):
                best_ratio_solution=current_ratio_solution
                best_ratio_key=key

        filewriter.writerow([str(round(cheapest_solution, 3)).replace(".", ","), str(solution[cheapest_solution]),'Cheapest solution (supposed the best option for customer)'])
        filewriter.writerow([str(round(expensive_solution, 3)).replace(".", ","), str(solution[expensive_solution]),'Expensive solution (supposed the best option for enterprise)'])
        filewriter.writerow([str(round(best_ratio_key, 3)).replace(".", ","), str(solution[best_ratio_key]), 'Best solution considering ratio between price and number of services'])

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
    print('clustering array')
    fit_label = kproto.predict(data_array,categorical=[1, 2, 3, 4])  # categorical is the Index of columns that contain categorical data
    # Save prediction into table
    insert_predicted_data(ids_array,data_array,fit_label)

    return HttpResponse('Predicción de clientes pendientes realizada.')


def ProductGeneration(request):
    # Get data from database
    customer_rows = get_data_to_optimize()
    if not customer_rows:
        return HttpResponse('No hay clientes para optimizar.')

    # Cast as numpy Array
    rows_array = np.array(customer_rows)
    # Split data into variables and id's
    data_array = np.array(rows_array)[:, 1:]  # dejamos sólo las variables que pueden clusterizar el cliente
    ids_array = np.array(rows_array)[:, 0]  # guardamos las id's en otro array

    customer_form_id = str(ids_array[0])
    consumption=str(data_array[0][0])
    power = str(data_array[0][1])
    customer_type = str(data_array[0][2])
    tariff = str(data_array[0][3])
    insurance_interest = str(data_array[0][4])
    maintenance_interest = str(data_array[0][5])
    battery_interest = str(data_array[0][6])
    smarthome_interest = str(data_array[0][7])
    vehicle_interest = str(data_array[0][8])
    green_energy_interest = str(data_array[0][9])
    bm_interest = str(data_array[0][10])
    funding_duration = int(str(data_array[0][11]))
    # knapsack algorithm with customer data
    customer_or_cluster = 0 #0 means customer data
    response_customer=cost(customer_form_id,tariff, power, consumption, customer_type, funding_duration, green_energy_interest,battery_interest,smarthome_interest, vehicle_interest, bm_interest, maintenance_interest, insurance_interest,customer_or_cluster)


    #get cluster data
    cluster_rows = get_cluster_data()
    # Cast as numpy Array
    cluster_rows_array = np.array(cluster_rows)
    # Split data into variables and id's
    cluster_data_array = np.array(cluster_rows_array)[:, 1:]  # dejamos sólo las variables que pueden clusterizar el cliente
    cluster_ids_array = np.array(cluster_rows_array)[:, 0]  # guardamos las id's en otro array
    customer_form_id=str(cluster_ids_array[0])
    cluster_consumption = str(cluster_data_array[0][0])
    cluster_power = str(cluster_data_array[0][1])
    # knapsack algorithm with cluster data
    customer_or_cluster = 1  # 1 means cluster data
    response_cluster = cost(customer_form_id,tariff, cluster_power, cluster_consumption, customer_type, funding_duration, green_energy_interest, battery_interest, smarthome_interest, vehicle_interest, bm_interest, maintenance_interest,insurance_interest,customer_or_cluster)

    #response
    if (response_cluster==1 and response_customer==1):
        return HttpResponse(str(1))
    else:
        return HttpResponse(str(0))

# Function with kmodes (non-categorical) to use in further developments and to understand better clustering properties
def clusterCreationKmode():
    # random categorical data
    data = np.random.choice(20, (100, 10))

    km = KModes(n_clusters=4, init='Huang', n_init=5, verbose=1)

    clusters = km.fit_predict(data)

    return HttpResponse(km.cluster_centroids_)
