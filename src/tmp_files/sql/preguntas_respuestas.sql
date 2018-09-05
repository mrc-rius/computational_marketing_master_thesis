ALTER SEQUENCE surveys_question_id_seq RESTART WITH 1;
ALTER SEQUENCE surveys_choice_id_seq RESTART WITH 1;

truncate table surveys_question cascade
truncate table surveys_choice

select * from surveys_choice;
select * from surveys_question;
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cuál es su consumo eléctrico mensual? (en kWh)', '2018-05-29 07:58:39.740015');
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cuál es su potencia contratada?', '2018-05-29 08:25:57.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Menor de 10 kW', 0, 2);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Entre 10 y 15 kW', 0, 2);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Entre 15 y 450 kW', 0, 2);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Mayor de 450 kW', 0, 2);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Qué tipo de producto eléctrico tiene contratado?', '2018-05-29 08:25:59.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Precio fijo anual',0, 3);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Precio indexado al Mercado Eléctrico',0, 3);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cuál es su código postal?', '2018-05-29 08:26:00.000000');
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Qué tipo de cliente es?', '2018-05-29 08:26:04.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Hogar', 0, 5);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Empresa', 0, 5);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Administración pública', 0, 5);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Qué tarifa tiene contratada?', '2018-05-29 08:26:05.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '2.0 A', 0, 6);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '2.0 DHA', 0, 6);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '2.1 A', 0, 6);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '2.1 DHA', 0, 6);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '3.0 A', 0, 6);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '3.1 A', 0, 6);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '6.1 A', 0, 6);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( 'Otros', 0, 6);

---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('En caso de poder tener seguro (emergencias) de instalaciones en su contrato, con que nivel de interés lo clasificaría?', '2018-05-29 08:26:11.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (cobertura mínima)', 0, 7);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 7);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 7);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 7);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (cobertura máxima)', 0, 7);

---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('En caso de poder tener mantenimiento (rutinario) de instalaciones en su contrato, con que nivel de interés lo clasificaría?', '2018-05-29 08:26:11.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (cobertura mínima)', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (cobertura máxima)', 0, 8);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('Con que nivel de interés clasificaría que la comercializadora le instalara en su casa baterias electricas para reaprovechar energía?', '2018-05-29 08:26:11.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Me interesa muy poco)', 0, 9);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 9);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 9);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 9);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Muy importante)', 0, 9);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('Con que nivel de interés clasificaría que la comercializadora le instalara en su casa elementos domoticos para hacer su casa SmartHome (menor consumo)?', '2018-05-29 08:26:11.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Me interesa muy poco)', 0, 10);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 10);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 10);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 10);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Muy importante)', 0, 10);

---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('Con que nivel de interés clasificaría que la comercializadora le instalara en su casa un punto de carga rápida para vehiculos eléctricos (coche,motocicleta,bicicleta)', '2018-05-29 08:26:11.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Me interesa muy poco)', 0, 11);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 11);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 11);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 11);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Muy importante)', 0, 11);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('Con que nivel de interés clasificaría que la comercializadora le garantice que está siendo suministrado con energia verde?', '2018-05-29 08:26:11.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Me interesa muy poco)', 0, 12);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 12);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 12);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 12);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Muy importante)', 0, 12);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cómo calificaría de importante el precio del producto eléctrico que tiene contratado?', '2018-05-29 08:26:14.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Muy poco importante)', 0, 13);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 13);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 13);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 13);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Lo más importante)', 0, 13);

-------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cómo calificaría de importante recibir notificaciones por email, what''s app o cualquier otro sistema de mensajería de su comercializadora notificándole las modificaciones en su contrato?', '2018-05-29 08:26:17.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Muy poco importante)', 0, 14);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 14);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 14);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 14);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Lo más importante)', 0, 14);

---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Le importaría tener permanencia de un año en su contrato?', '2018-05-29 08:26:19.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Me importa muy poco)', 0, 15);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 15);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 15);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 15);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Muy importante)', 0, 15);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Le interesa un asesor energético que le ayude a gestionar su contrato?', '2018-05-29 08:26:24.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Me interesa muy poco)', 0, 16);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 16);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 16);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 16);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Me interesa mucho)', 0, 16);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿En caso de que algún subproducto requiera financiación, cuantos meses le interesa financiar?', '2018-05-29 08:26:24.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('0', 0, 17);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('6', 0, 17);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('12', 0, 17);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('18', 0, 17);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('24', 0, 17);

