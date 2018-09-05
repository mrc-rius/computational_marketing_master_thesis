CREATE TABLE public.surveys_translate_interest
(
    id integer DEFAULT nextval('surveys_translate_interest_id_seq'::regclass) PRIMARY KEY NOT NULL,
    interest_value varchar(2) NOT NULL,
    min_interest numeric(2,2) NOT NULL,
    max_interest numeric(2,2) NOT NULL,
    deleted integer NOT NULL
);
INSERT INTO public.surveys_translate_interest (id, interest_value, min_interest, max_interest, deleted) VALUES (1, '1', 0.00, 0.19, 0);
INSERT INTO public.surveys_translate_interest (id, interest_value, min_interest, max_interest, deleted) VALUES (2, '2', 0.20, 0.39, 0);
INSERT INTO public.surveys_translate_interest (id, interest_value, min_interest, max_interest, deleted) VALUES (3, '3', 0.40, 0.59, 0);
INSERT INTO public.surveys_translate_interest (id, interest_value, min_interest, max_interest, deleted) VALUES (4, '4', 0.60, 0.79, 0);
INSERT INTO public.surveys_translate_interest (id, interest_value, min_interest, max_interest, deleted) VALUES (5, '5', 0.80, 0.99, 0);