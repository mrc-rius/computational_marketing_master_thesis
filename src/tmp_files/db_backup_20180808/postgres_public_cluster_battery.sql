CREATE TABLE public.cluster_battery
(
    id integer DEFAULT nextval('cluster_battery_id_seq'::regclass) PRIMARY KEY NOT NULL,
    battery_name varchar(200) NOT NULL,
    battery_price numeric(10,2) NOT NULL,
    battery_tariff varchar(15) NOT NULL,
    battery_customer_type varchar(200) NOT NULL,
    deleted integer NOT NULL
);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (1, 'Domestico - No aplica', 0.00, '2.0 A', 'Domestico', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (2, 'Domestico - No aplica', 0.00, '2.0 DHA', 'Domestico', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (3, 'Domestico - No aplica', 0.00, '2.0 DHS', 'Domestico', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (4, 'Domestico - No aplica', 0.00, '2.1 A', 'Domestico', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (5, 'Domestico - No aplica', 0.00, '2.1 DHA', 'Domestico', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (6, 'Domestico - No aplica', 0.00, '2.1 DHS', 'Domestico', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (7, 'PYME', 2000.00, '3.0 A', 'Empresa', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (8, 'PYME', 3000.00, '3.1 A', 'Empresa', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (9, 'Particular', 1000.00, '3.0 A', 'Domestico', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (10, 'Particular', 1500.00, '3.1 A', 'Domestico', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (11, 'Gran empresa', 4500.00, '6.1 A', 'Empresa', 0);
INSERT INTO public.cluster_battery (id, battery_name, battery_price, battery_tariff, battery_customer_type, deleted) VALUES (12, 'Gran empresa', 6000.00, 'X', 'Empresa', 0);