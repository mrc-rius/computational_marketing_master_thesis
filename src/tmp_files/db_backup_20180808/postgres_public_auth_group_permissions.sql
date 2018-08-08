CREATE TABLE public.auth_group_permissions
(
    id integer DEFAULT nextval('auth_group_permissions_id_seq'::regclass) PRIMARY KEY NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL,
    CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group (id) DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission (id) DEFERRABLE INITIALLY DEFERRED
);
CREATE UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq ON public.auth_group_permissions (group_id, permission_id);
CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions (group_id);
CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions (permission_id);