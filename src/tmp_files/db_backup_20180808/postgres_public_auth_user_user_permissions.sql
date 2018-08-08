CREATE TABLE public.auth_user_user_permissions
(
    id integer DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass) PRIMARY KEY NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL,
    CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id) DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission (id) DEFERRABLE INITIALLY DEFERRED
);
CREATE UNIQUE INDEX auth_user_user_permissions_user_id_permission_id_14a6b632_uniq ON public.auth_user_user_permissions (user_id, permission_id);
CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions (user_id);
CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions (permission_id);