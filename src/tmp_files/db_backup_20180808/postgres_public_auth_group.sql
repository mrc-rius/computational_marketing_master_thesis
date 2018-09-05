CREATE TABLE public.auth_group
(
    id integer DEFAULT nextval('auth_group_id_seq'::regclass) PRIMARY KEY NOT NULL,
    name varchar(80) NOT NULL
);
CREATE UNIQUE INDEX auth_group_name_key ON public.auth_group (name);
CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group (name);