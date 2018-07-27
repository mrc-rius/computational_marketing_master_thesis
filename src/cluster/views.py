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

'''
CREATE extension tablefunc;

SELECT *
FROM crosstab (
         $$ select form_token,question_id,answer_text
         from surveys_answer
         order by 1,2$$
     )
     AS
     final_result(
      submit_id  varchar(200),
      "question1" varchar(200),
       "question2" varchar(200),
       "question3" varchar(200),
       "question4" varchar(200),
       "question5" varchar(200),
       "question6" varchar(200),
       "question7" varchar(200),
       "question8" varchar(200),
       "question9" varchar(200),
       "question10" varchar(200),
       "question11" varchar(200),
       "question12" varchar(200),
       "question13" varchar(200),
       "question14" varchar(200),
       "question15" varchar(200),
       "question16" varchar(200),
       "question17" varchar(200),
       "question18" varchar(200),
       "question19" varchar(200),
       "question20" varchar(200),
       "question21" varchar(200),
      "question22" varchar(200),
      "question23" varchar(200),
      "question24" varchar(200),
      "question25" varchar(200),
      "question26" varchar(200),
      "question27" varchar(200)
     );
'''