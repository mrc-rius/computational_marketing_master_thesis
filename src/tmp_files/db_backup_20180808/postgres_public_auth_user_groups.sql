CREATE TABLE public.auth_user_groups
(
    id integer DEFAULT nextval('auth_user_groups_id_seq'::regclass) PRIMARY KEY NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id) DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group (id) DEFERRABLE INITIALLY DEFERRED
);
CREATE UNIQUE INDEX auth_user_groups_user_id_group_id_94350c0c_uniq ON public.auth_user_groups (user_id, group_id);
CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups (user_id);
CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups (group_id);