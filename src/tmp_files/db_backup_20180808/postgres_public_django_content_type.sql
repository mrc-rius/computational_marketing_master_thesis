CREATE TABLE public.django_content_type
(
    id integer DEFAULT nextval('django_content_type_id_seq'::regclass) PRIMARY KEY NOT NULL,
    app_label varchar(100) NOT NULL,
    model varchar(100) NOT NULL
);
CREATE UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq ON public.django_content_type (app_label, model);
INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'surveys', 'choice');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'surveys', 'answer');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'surveys', 'question');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'cluster', 'prediction');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'cluster', 'battery');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'cluster', 'centroids');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'cluster', 'financing');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (14, 'cluster', 'insurance');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (15, 'cluster', 'maintenance');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (16, 'cluster', 'manager');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (17, 'cluster', 'smarthome');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (18, 'cluster', 'vehicle');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (19, 'cluster', 'costs');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (20, 'surveys', 'translatehiredpower');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (21, 'surveys', 'translate_hired_power');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (22, 'surveys', 'translate_interest');