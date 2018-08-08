CREATE TABLE public.django_admin_log
(
    id integer DEFAULT nextval('django_admin_log_id_seq'::regclass) PRIMARY KEY NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr varchar(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type (id) DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id) DEFERRABLE INITIALLY DEFERRED
);
CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log (content_type_id);
CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log (user_id);