CREATE TABLE public.cluster_vehicle
(
    id integer DEFAULT nextval('cluster_vehicle_id_seq'::regclass) PRIMARY KEY NOT NULL,
    vehicle_name varchar(200) NOT NULL,
    vehicle_tariff varchar(15) NOT NULL,
    deleted integer NOT NULL,
    vehicle_max_power integer NOT NULL,
    vehicle_max_price numeric(10,2) NOT NULL,
    vehicle_min_power integer NOT NULL,
    vehicle_min_price numeric(10,2) NOT NULL,
    vehicle_power_unit varchar(5) NOT NULL
);
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (4, 'Carga lenta indoor', '2.0 A', 0, 7, 1500.00, 3, 900.00, 'KW');
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (5, 'Carga lenta indoor', '2.1 A', 0, 7, 1500.00, 3, 900.00, 'KW');
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (6, 'Carga lenta indoor', '2.0 DHA', 0, 7, 1500.00, 3, 900.00, 'KW');
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (7, 'Carga lenta indoor', '2.1 DHA', 0, 7, 1500.00, 3, 900.00, 'KW');
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (8, 'Carga lenta indoor', '2.0 DHS', 0, 7, 1500.00, 3, 900.00, 'KW');
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (9, 'Carga lenta indoor', '2.1 DHS', 0, 7, 1500.00, 3, 900.00, 'KW');
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (10, 'Carga rapida outdoor', '3.0 A', 0, 0, 10000.00, 20, 3000.00, 'KW');
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (11, 'Carga rapida outdoor', '3.1 A', 0, 0, 10000.00, 20, 3000.00, 'KW');
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (12, 'Carga rapida', '6.1 A', 0, 0, 100000.00, 0, 30000.00, 'KW');
INSERT INTO public.cluster_vehicle (id, vehicle_name, vehicle_tariff, deleted, vehicle_max_power, vehicle_max_price, vehicle_min_power, vehicle_min_price, vehicle_power_unit) VALUES (13, 'Carga rapida', 'X', 0, 0, 100000.00, 0, 30000.00, 'KW');