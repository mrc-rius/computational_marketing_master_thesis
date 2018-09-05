CREATE TABLE public.cluster_financing
(
    id integer DEFAULT nextval('cluster_financing_id_seq'::regclass) PRIMARY KEY NOT NULL,
    financing_name varchar(200) NOT NULL,
    financing_monthly_interest numeric(10,2) NOT NULL,
    financing_month_duration integer NOT NULL,
    deleted integer NOT NULL
);
INSERT INTO public.cluster_financing (id, financing_name, financing_monthly_interest, financing_month_duration, deleted) VALUES (1, 'One year', 1.89, 12, 0);
INSERT INTO public.cluster_financing (id, financing_name, financing_monthly_interest, financing_month_duration, deleted) VALUES (2, 'Two year', 2.02, 24, 0);
INSERT INTO public.cluster_financing (id, financing_name, financing_monthly_interest, financing_month_duration, deleted) VALUES (3, 'Three year', 2.15, 36, 0);
INSERT INTO public.cluster_financing (id, financing_name, financing_monthly_interest, financing_month_duration, deleted) VALUES (4, 'Four year', 2.35, 48, 0);
INSERT INTO public.cluster_financing (id, financing_name, financing_monthly_interest, financing_month_duration, deleted) VALUES (5, 'Three months', 1.23, 3, 0);
INSERT INTO public.cluster_financing (id, financing_name, financing_monthly_interest, financing_month_duration, deleted) VALUES (6, 'Six months', 1.65, 6, 0);
INSERT INTO public.cluster_financing (id, financing_name, financing_monthly_interest, financing_month_duration, deleted) VALUES (7, 'Nine months', 1.80, 9, 0);