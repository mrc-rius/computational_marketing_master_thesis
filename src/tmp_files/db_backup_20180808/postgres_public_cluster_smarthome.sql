CREATE TABLE public.cluster_smarthome
(
    id integer DEFAULT nextval('cluster_smarthome_id_seq'::regclass) PRIMARY KEY NOT NULL,
    smarthome_name varchar(200) NOT NULL,
    smarthome_tariff varchar(15) NOT NULL,
    smarthome_customer_type varchar(200) NOT NULL,
    deleted integer NOT NULL,
    smarthome_max_price numeric(10,2) NOT NULL,
    smarthome_min_price numeric(10,2) NOT NULL
);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (4, 'Smarthome Domestico', '2.0 A', 'Domestico', 0, 10000.00, 1000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (5, 'Smarthome Domestico', '2.1 A', 'Domestico', 0, 10000.00, 1000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (6, 'Smarthome Domestico', '2.0 DHA', 'Domestico', 0, 10000.00, 1000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (7, 'Smarthome Domestico', '2.1 DHA', 'Domestico', 0, 10000.00, 1000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (8, 'Smarthome Domestico', '2.0 DHS', 'Domestico', 0, 10000.00, 1000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (9, 'Smarthome Domestico', '2.1 DHS', 'Domestico', 0, 10000.00, 1000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (10, 'Smarthome Domestico', '3.0 A', 'Empresa', 0, 30000.00, 10000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (11, 'Smarthome Domestico', '3.0 A', 'Domestico', 0, 30000.00, 10000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (12, 'Smarthome Domestico', '3.1 A', 'Domestico', 0, 30000.00, 10000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (13, 'Smarthome Domestico', '3.1 A', 'Empresa', 0, 30000.00, 10000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (14, 'Smarthome Gran empresa', '6.1 A', 'Empresa', 0, 50000.00, 20000.00);
INSERT INTO public.cluster_smarthome (id, smarthome_name, smarthome_tariff, smarthome_customer_type, deleted, smarthome_max_price, smarthome_min_price) VALUES (15, 'Smarthome Gran empresa', 'X', 'Empresa', 0, 50000.00, 20000.00);