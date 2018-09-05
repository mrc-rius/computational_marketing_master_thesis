CREATE TABLE public.cluster_maintenance
(
    id integer DEFAULT nextval('cluster_maintenance_id_seq'::regclass) PRIMARY KEY NOT NULL,
    maintenance_name varchar(200) NOT NULL,
    maintenance_price numeric(10,2) NOT NULL,
    maintenance_level integer NOT NULL,
    deleted integer NOT NULL,
    maintenance_customer_type varchar(200) NOT NULL,
    maintenance_tariff varchar(15) NOT NULL
);
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (22, 'Factor Luz Gratuito', 0.00, 1, 0, 'Domestico', '2.0 A');
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (23, 'Factor Luz Gratuito', 0.00, 1, 0, 'Domestico', '2.0 DHA');
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (24, 'Factor Luz Gratuito', 0.00, 1, 0, 'Domestico', '2.0 DHS');
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (25, 'Factor Luz', 8.89, 2, 0, 'Domestico', '2.1 A');
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (26, 'Factor Luz', 8.89, 2, 0, 'Domestico', '2.1 DHA');
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (27, 'Factor Luz', 8.89, 2, 0, 'Domestico', '2.1 DHS');
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (28, 'Hogar Confort', 14.17, 4, 0, 'Domestico', '3.0 A');
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (29, 'Hogar Premium', 18.53, 4, 0, 'Domestico', '3.1 A');
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (30, 'Premium', 40.89, 5, 0, 'Domestico', '6.1 A');
INSERT INTO public.cluster_maintenance (id, maintenance_name, maintenance_price, maintenance_level, deleted, maintenance_customer_type, maintenance_tariff) VALUES (31, 'Premium', 50.24, 5, 0, 'Domestico', 'X');