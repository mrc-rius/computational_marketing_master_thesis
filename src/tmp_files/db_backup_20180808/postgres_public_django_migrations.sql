CREATE TABLE public.django_migrations
(
    id integer DEFAULT nextval('django_migrations_id_seq'::regclass) PRIMARY KEY NOT NULL,
    app varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2018-07-24 15:03:32.522370');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2018-07-24 15:03:32.633237');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2018-07-24 15:03:32.667227');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-07-24 15:03:32.680013');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2018-07-24 15:03:32.707617');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2018-07-24 15:03:32.732529');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0003_alter_user_email_max_length', '2018-07-24 15:03:32.745917');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0004_alter_user_username_opts', '2018-07-24 15:03:32.757408');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0005_alter_user_last_login_null', '2018-07-24 15:03:32.771028');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0006_require_contenttypes_0002', '2018-07-24 15:03:32.774623');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2018-07-24 15:03:32.785603');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0008_alter_user_username_max_length', '2018-07-24 15:03:32.806374');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0009_alter_user_last_name_max_length', '2018-07-24 15:03:32.820365');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'sessions', '0001_initial', '2018-07-24 15:03:32.841245');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'surveys', '0001_initial', '2018-07-24 15:03:32.868323');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'surveys', '0002_answer', '2018-07-24 15:03:32.885463');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'surveys', '0003_auto_20180606_1401', '2018-07-24 15:03:32.912913');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'surveys', '0004_auto_20180607_1331', '2018-07-24 15:03:32.932860');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'surveys', '0005_answer_training_set', '2018-07-30 17:49:07.275602');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'cluster', '0001_initial', '2018-07-31 10:33:10.905816');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'cluster', '0002_prediction_cluster_label', '2018-07-31 10:36:42.046420');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'cluster', '0003_battery_centroids_financing_insurance_maintenance_manager_smarthome_vehicle', '2018-07-31 17:34:39.354416');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'cluster', '0004_auto_20180731_1747', '2018-07-31 17:48:10.386467');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'cluster', '0005_costs', '2018-08-01 12:23:20.602946');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'cluster', '0006_auto_20180801_1521', '2018-08-01 15:21:27.015187');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'cluster', '0007_auto_20180801_1529', '2018-08-01 15:29:35.231810');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (27, 'cluster', '0008_costs_cost_tariff', '2018-08-03 10:38:32.637628');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (28, 'surveys', '0006_translatehiredpower', '2018-08-03 13:03:26.125754');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (29, 'surveys', '0006_translate_hired_power', '2018-08-03 13:05:38.465766');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (30, 'cluster', '0009_auto_20180803_1931', '2018-08-06 13:16:12.512577');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (31, 'surveys', '0007_translate_interest', '2018-08-06 13:16:12.530295');