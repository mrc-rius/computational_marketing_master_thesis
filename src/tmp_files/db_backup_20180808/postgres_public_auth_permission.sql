CREATE TABLE public.auth_permission
(
    id integer DEFAULT nextval('auth_permission_id_seq'::regclass) PRIMARY KEY NOT NULL,
    name varchar(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename varchar(100) NOT NULL,
    CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type (id) DEFERRABLE INITIALLY DEFERRED
);
CREATE UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq ON public.auth_permission (content_type_id, codename);
CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission (content_type_id);
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can add choice', 7, 'add_choice');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can change choice', 7, 'change_choice');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can delete choice', 7, 'delete_choice');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can add answer', 8, 'add_answer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can change answer', 8, 'change_answer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can delete answer', 8, 'delete_answer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add question', 9, 'add_question');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change question', 9, 'change_question');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete question', 9, 'delete_question');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can add prediction', 10, 'add_prediction');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can change prediction', 10, 'change_prediction');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can delete prediction', 10, 'delete_prediction');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can add battery', 11, 'add_battery');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can change battery', 11, 'change_battery');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can delete battery', 11, 'delete_battery');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can add centroids', 12, 'add_centroids');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can change centroids', 12, 'change_centroids');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can delete centroids', 12, 'delete_centroids');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add financing', 13, 'add_financing');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change financing', 13, 'change_financing');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete financing', 13, 'delete_financing');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can add insurance', 14, 'add_insurance');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can change insurance', 14, 'change_insurance');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can delete insurance', 14, 'delete_insurance');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can add maintenance', 15, 'add_maintenance');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can change maintenance', 15, 'change_maintenance');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can delete maintenance', 15, 'delete_maintenance');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can add manager', 16, 'add_manager');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can change manager', 16, 'change_manager');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can delete manager', 16, 'delete_manager');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add smarthome', 17, 'add_smarthome');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change smarthome', 17, 'change_smarthome');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete smarthome', 17, 'delete_smarthome');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can add vehicle', 18, 'add_vehicle');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can change vehicle', 18, 'change_vehicle');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can delete vehicle', 18, 'delete_vehicle');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can add costs', 19, 'add_costs');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can change costs', 19, 'change_costs');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can delete costs', 19, 'delete_costs');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can add translate hired power', 20, 'add_translatehiredpower');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can change translate hired power', 20, 'change_translatehiredpower');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can delete translate hired power', 20, 'delete_translatehiredpower');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add translate_ hired_ power', 21, 'add_translate_hired_power');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change translate_ hired_ power', 21, 'change_translate_hired_power');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete translate_ hired_ power', 21, 'delete_translate_hired_power');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can add translate_ interest', 22, 'add_translate_interest');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can change translate_ interest', 22, 'change_translate_interest');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can delete translate_ interest', 22, 'delete_translate_interest');