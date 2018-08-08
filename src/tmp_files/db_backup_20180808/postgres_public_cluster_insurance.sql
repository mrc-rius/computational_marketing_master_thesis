CREATE TABLE public.cluster_insurance
(
    id integer DEFAULT nextval('cluster_insurance_id_seq'::regclass) PRIMARY KEY NOT NULL,
    insurance_name varchar(200) NOT NULL,
    insurance_price numeric(10,2) NOT NULL,
    insurance_level integer NOT NULL,
    deleted integer NOT NULL,
    insurance_customer_type varchar(200) NOT NULL,
    insurance_tariff varchar(15) NOT NULL
);
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (4, 'Emergencia Hogar', 2.50, 3, 0, 'Domestico', '2.0 A');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (5, 'Emergencia Hogar', 2.50, 3, 0, 'Domestico', '2.0 DHA');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (6, 'Emergencia Hogar', 2.50, 3, 0, 'Domestico', '2.0 DHS');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (7, 'Emergencia Hogar', 3.30, 3, 0, 'Domestico', '2.1 A');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (8, 'Emergencia Hogar', 3.30, 3, 0, 'Domestico', '2.1 DHA');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (9, 'Emergencia Hogar', 3.30, 3, 0, 'Domestico', '2.1 DHS');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (10, 'Emergencia Negocio', 5.23, 3, 0, 'Domestico', '3.0 A');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (11, 'Emergencia Negocio', 5.23, 3, 0, 'Domestico', '3.1 A');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (12, 'Emergencia Negocio', 7.97, 3, 0, 'Empresa', '3.0 A');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (13, 'Emergencia Negocio', 7.97, 3, 0, 'Empresa', '3.1 A');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (14, 'Emergencia Negocio Plus', 9.88, 5, 0, 'Empresa', '6.1 A');
INSERT INTO public.cluster_insurance (id, insurance_name, insurance_price, insurance_level, deleted, insurance_customer_type, insurance_tariff) VALUES (15, 'Emergencia Negocio Plus', 9.88, 5, 0, 'Empresa', 'X');