CREATE TABLE public.auth_user
(
    id integer DEFAULT nextval('auth_user_id_seq'::regclass) PRIMARY KEY NOT NULL,
    password varchar(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username varchar(150) NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(150) NOT NULL,
    email varchar(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
CREATE UNIQUE INDEX auth_user_username_key ON public.auth_user (username);
CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user (username);