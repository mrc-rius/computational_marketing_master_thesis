CREATE TABLE public.surveys_question
(
    id integer DEFAULT nextval('surveys_question_id_seq'::regclass) PRIMARY KEY NOT NULL,
    question_text varchar(200) NOT NULL,
    publication_date timestamp with time zone NOT NULL
);
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (1, '¿Cuál es su consumo eléctrico mensual? (en kWh)', '2018-05-29 07:58:39.740015');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (2, '¿Cuál es su potencia contratada?', '2018-05-29 08:25:57.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (3, '¿Qué tipo de producto eléctrico tiene contratado?', '2018-05-29 08:25:59.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (4, '¿Cuál es su código postal?', '2018-05-29 08:26:00.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (5, '¿Qué tipo de cliente es?', '2018-05-29 08:26:04.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (6, '¿Qué tarifa tiene contratada?', '2018-05-29 08:26:05.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (7, 'En caso de poder tener seguro (emergencias) de instalaciones en su contrato, con que nivel de interés lo clasificaría?', '2018-05-29 08:26:11.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (8, 'En caso de poder tener mantenimiento (rutinario) de instalaciones en su contrato, con que nivel de interés lo clasificaría?', '2018-05-29 08:26:11.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (9, 'Con que nivel de interés clasificaría que la comercializadora le instalara en su casa baterias electricas para reaprovechar energía?', '2018-05-29 08:26:11.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (10, 'Con que nivel de interés clasificaría que la comercializadora le instalara en su casa elementos domoticos para hacer su casa SmartHome (menor consumo)?', '2018-05-29 08:26:11.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (11, 'Con que nivel de interés clasificaría que la comercializadora le instalara en su casa un punto de carga rápida para vehiculos eléctricos (coche,motocicleta,bicicleta)', '2018-05-29 08:26:11.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (12, 'Con que nivel de interés clasificaría que la comercializadora le garantice que está siendo suministrado con energia verde?', '2018-05-29 08:26:11.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (13, '¿Cómo calificaría de importante el precio del producto eléctrico que tiene contratado?', '2018-05-29 08:26:14.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (14, '¿Cómo calificaría de importante recibir notificaciones por email, what''s app o cualquier otro sistema de mensajería de su comercializadora notificándole las modificaciones en su contrato?', '2018-05-29 08:26:17.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (15, '¿Le importaría tener permanencia de un año en su contrato?', '2018-05-29 08:26:19.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (16, '¿Le interesa un asesor energético que le ayude a gestionar su contrato?', '2018-05-29 08:26:24.000000');
INSERT INTO public.surveys_question (id, question_text, publication_date) VALUES (17, '¿En caso de que algún subproducto requiera financiación, cuantos meses le interesa financiar?', '2018-05-29 08:26:24.000000');