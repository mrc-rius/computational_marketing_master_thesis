from django.views import generic
import numpy as np
import csv
import os
import datetime
from kmodes.kprototypes import KPrototypes
from kmodes.kmodes import KModes
from django.http import HttpResponse
from pathlib import Path


# Global variables
kproto = 0 # variable with the cluster object if it has been computed

# Gets a cluster and extract all properties to create a CSV report.

def clusterStatisticsCSV(kproto):

    cluster_centroids=kproto.cluster_centroids_
    cluster_centroids_beauty=np.array([np.array([cluster_centroids[0][0][0], cluster_centroids[1][0][0], cluster_centroids[0][0][1]]),
              np.array([cluster_centroids[0][1][0], cluster_centroids[1][1][0], cluster_centroids[0][1][1]])])
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

    # Print the cluster centroids
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
