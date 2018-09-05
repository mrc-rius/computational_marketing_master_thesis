CREATE TABLE public.cluster_manager
(
    id integer DEFAULT nextval('cluster_manager_id_seq'::regclass) PRIMARY KEY NOT NULL,
    manager_name varchar(200) NOT NULL,
    manager_price numeric(10,2) NOT NULL,
    manager_tariff varchar(15) NOT NULL,
    manager_customer_type varchar(200) NOT NULL,
    deleted integer NOT NULL
);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (4, 'Manager level 1', 1.17, '2.0 A', 'Domestico', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (5, 'Manager level 1', 1.17, '2.1 A', 'Domestico', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (6, 'Manager level 1', 1.17, '2.0 DHA', 'Domestico', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (7, 'Manager level 1', 1.17, '2.1 DHA', 'Domestico', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (8, 'Manager level 1', 1.17, '2.0 DHS', 'Domestico', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (9, 'Manager level 1', 1.17, '2.1 DHS', 'Domestico', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (10, 'Manager level 2', 16.67, '3.0 A', 'Empresa', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (11, 'Manager level 2', 16.67, '3.1 A', 'Empresa', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (12, 'Manager level 2', 16.67, '3.0 A', 'Domestico', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (13, 'Manager level 2', 16.67, '3.1 A', 'Domestico', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (14, 'Manager level 3', 35.25, '6.1 A', 'Empresa', 0);
INSERT INTO public.cluster_manager (id, manager_name, manager_price, manager_tariff, manager_customer_type, deleted) VALUES (15, 'Manager level 3', 35.25, 'X', 'Empresa', 0);