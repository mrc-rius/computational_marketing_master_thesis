CREATE TABLE public.cluster_prediction
(
    id integer DEFAULT nextval('cluster_prediction_id_seq'::regclass) PRIMARY KEY NOT NULL,
    form_id varchar(200) NOT NULL,
    prediction_date timestamp with time zone NOT NULL,
    cluster_label integer
);
INSERT INTO public.cluster_prediction (id, form_id, prediction_date, cluster_label) VALUES (14, '2018-08-06 16:24:57_491.5900884834002', '2018-08-08 18:30:55.426530', 0);