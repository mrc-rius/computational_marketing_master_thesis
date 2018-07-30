from django.views import generic
import numpy as np
import csv
import os
import datetime
from kmodes.kprototypes import KPrototypes
from kmodes.kmodes import KModes
from django.http import HttpResponse
from pathlib import Path
from django.db import connection


# Global variables
kproto = 0 # variable with the cluster object if it has been computed


#Get real data from database
def my_clustering_data():
    with connection.cursor() as cursor:
        #cursor.execute("SELECT foo FROM bar WHERE baz = %s", [self.baz])
        cursor.execute("SELECT * FROM crosstab ($$ select form_token,question_id,answer_text from surveys_answer order by 1,2$$) AS final_result(submit_id varchar(200),question1 varchar(200),question2 varchar(200),question3 varchar(200),question4 varchar(200),question5 varchar(200),question6 varchar(200),question7 varchar(200),question8 varchar(200),question9 varchar(200),question10 varchar(200),question11 varchar(200),question12 varchar(200),question13 varchar(200),question14 varchar(200),question15 varchar(200),question16 varchar(200),question17 varchar(200),question18 varchar(200),question19 varchar(200),question20 varchar(200),question21 varchar(200),question22 varchar(200),question23 varchar(200),question24 varchar(200),question25 varchar(200),question26 varchar(200),question27 varchar(200))")
        row = cursor.fetchall()
    return row

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
                                                cluster_centroids[1][0][4],
                                                cluster_centroids[1][0][5],
                                                cluster_centroids[1][0][6],
                                                cluster_centroids[1][0][7],
                                                cluster_centroids[1][0][8],
                                                cluster_centroids[1][0][9],
                                                cluster_centroids[1][0][10],
                                                cluster_centroids[1][0][11],
                                                cluster_centroids[1][0][12],
                                                cluster_centroids[1][0][13],
                                                cluster_centroids[1][0][14],
                                                cluster_centroids[1][0][15],
                                                cluster_centroids[1][0][16],
                                                cluster_centroids[1][0][17],
                                                cluster_centroids[1][0][18],
                                                cluster_centroids[1][0][19],
                                                cluster_centroids[1][0][20],
                                                cluster_centroids[1][0][21],
                                                cluster_centroids[1][0][22],
                                                cluster_centroids[1][0][23],
                                                cluster_centroids[1][0][24],
                                                cluster_centroids[1][0][25],
                                                ])
                                        ])
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
    rows=my_clustering_data()
    # Cast as numpy Array
    rows_array=np.array(rows)
    #Split data into variables and id's
    data_array = np.array(rows_array)[:,1:] #dejamos sólo las variables que pueden clusterizar el cliente
    ids_array = np.array(rows_array)[:, 0] #guardamos las id's en otro array

    #Clustering
    kproto = KPrototypes(n_clusters=2, init='Cao', verbose=2)
    clusters = kproto.fit(data_array, categorical=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26])
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

    # random point to fit
    data = np.array([[0, 'a', 3]])
    fit_label = kproto.predict(data, categorical=[1]) #categorical is the Index of columns that contain categorical data
    # Print the cluster centroids
    return HttpResponse('Usted pertenece al cluster '+str(fit_label))

# Function with kmodes (non-categorical) to use in further developments and to understand better clustering properties

def clusterCreationKmode():
    # random categorical data
    data = np.random.choice(20, (100, 10))

    km = KModes(n_clusters=4, init='Huang', n_init=5, verbose=1)

    clusters = km.fit_predict(data)

    return HttpResponse(km.cluster_centroids_)
