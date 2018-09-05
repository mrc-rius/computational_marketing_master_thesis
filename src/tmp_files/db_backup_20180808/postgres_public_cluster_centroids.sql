CREATE TABLE public.cluster_centroids
(
    id integer DEFAULT nextval('cluster_centroids_id_seq'::regclass) PRIMARY KEY NOT NULL,
    cluster_label integer NOT NULL,
    tariff varchar(15) NOT NULL,
    customer_type varchar(200) NOT NULL,
    power varchar(200) NOT NULL,
    consumption integer NOT NULL,
    product_type varchar(200) NOT NULL,
    cluster_date timestamp with time zone NOT NULL
);
INSERT INTO public.cluster_centroids (id, cluster_label, tariff, customer_type, power, consumption, product_type, cluster_date) VALUES (32, 0, '2.0 A', 'Domestico', 'Menor de 10 kW', 653, 'Precio fijo anual', '2018-08-08 18:30:55.406796');
INSERT INTO public.cluster_centroids (id, cluster_label, tariff, customer_type, power, consumption, product_type, cluster_date) VALUES (33, 1, '6.1 A', 'Empresa', 'Mayor de 450 kW', 950000, 'Precio fijo anual', '2018-08-08 18:30:55.412393');
INSERT INTO public.cluster_centroids (id, cluster_label, tariff, customer_type, power, consumption, product_type, cluster_date) VALUES (34, 2, '6.1 A', 'Empresa', 'Mayor de 450 kW', 8220000, 'Precio fijo anual', '2018-08-08 18:30:55.414948');