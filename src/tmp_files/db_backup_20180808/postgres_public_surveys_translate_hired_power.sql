CREATE TABLE public.surveys_translate_hired_power
(
    id integer DEFAULT nextval('surveys_translate_hired_power_id_seq'::regclass) PRIMARY KEY NOT NULL,
    hired_power_literal varchar(200) NOT NULL,
    min_hired_power integer NOT NULL,
    max_hired_power integer NOT NULL,
    deleted integer NOT NULL
);
INSERT INTO public.surveys_translate_hired_power (id, hired_power_literal, min_hired_power, max_hired_power, deleted) VALUES (2, 'Menor de 10 kW', 0, 10, 0);
INSERT INTO public.surveys_translate_hired_power (id, hired_power_literal, min_hired_power, max_hired_power, deleted) VALUES (3, 'Entre 10 y 15 kW', 10, 15, 0);
INSERT INTO public.surveys_translate_hired_power (id, hired_power_literal, min_hired_power, max_hired_power, deleted) VALUES (4, 'Entre 15 y 450 kW', 15, 450, 0);
INSERT INTO public.surveys_translate_hired_power (id, hired_power_literal, min_hired_power, max_hired_power, deleted) VALUES (5, 'Mayor de 450 kW', 450, 900, 0);