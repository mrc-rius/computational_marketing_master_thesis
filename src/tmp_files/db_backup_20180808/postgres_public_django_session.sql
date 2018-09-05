CREATE TABLE public.django_session
(
    session_key varchar(40) PRIMARY KEY NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session (session_key);
CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session (expire_date);