from django.views import generic
import numpy as np
from kmodes.kmodes import KModes

# Create your views here.
from django.http import HttpResponse


def ClusterIndex(request):
    # random categorical data
    data = [[0, 3, 4],
            [2, 6, 8],
            [3, 5, 7],
            [5, 12, 16]]

    km = KModes(n_clusters=3, init='Huang', n_init=5, verbose=1)

    clusters = km.fit_predict(data)

    # Print the cluster centroids
    return HttpResponse(km.cluster_centroids_)
