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
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cómo paga su factura?', '2018-05-29 08:26:01.000000');

INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Transferencia bancária', 0, 5);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Domiciliada', 0, 5);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Tiene notificaciones por correo electrónico o cualquier otro sistema que le informe de cualquier cambio en su factura o contrato?', '2018-05-29 08:26:03.000000');

INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Sí', 0, 6);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No', 0, 6);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No se', 0, 6);

---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Qué tipo de cliente es?', '2018-05-29 08:26:04.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Hogar', 0, 7);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Empresa', 0, 7);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Administración pública', 0, 7);

---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Qué tarifa tiene contratada?', '2018-05-29 08:26:05.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '2.0 A', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '2.0 DHA', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '2.1 A', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '2.1 DHA', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '3.0 A', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '3.1 A', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( '6.1 A', 0, 8);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ( 'Otros', 0, 8);

---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Tiene algún otro servicio eléctrico no convencional que le interese incluir en su factura?', '2018-05-29 08:26:06.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Vehículo eléctrico', 0,9);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Smart home', 0, 9);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Otros', 0, 9);
---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Tiene permanencia en su contrato?', '2018-05-29 08:26:07.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Sí', 0, 10);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No', 0, 10);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Tal vez', 0, 10);

---------------------------------------------------------------------------------------------------------------------------
INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Su contrato incluye suministro de gas?', '2018-05-29 08:26:08.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Sí', 0, 11);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No', 0, 11);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Tiene algún seguro o cobertura de mantenimiento de sus instalaciones?', '2018-05-29 08:26:10.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Sí', 0, 12);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No', 0, 12);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Tal vez', 0, 12);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('En caso de respuesta afirmativa a la anterior pregunta, ¿cómo calificaría el nivel de cobertura que se le ofrece?', '2018-05-29 08:26:11.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (cobertura mínima)', 0, 13);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 13);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 13);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 13);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (cobertura máxima)', 0, 13);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Tiene  algún tipo de certificado de energía verde que le garantice que la energía consumida proviene de fuentes renovables?', '2018-05-29 08:26:12.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Sí', 0, 14);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No', 0, 14);

---------------------------------------------------------------------------------------------------------------------------


INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Tiene un asesor energético contratado?', '2018-05-29 08:26:13.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Sí', 0, 15);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No', 0, 15);

---------------------------------------------------------------------------------------------------------------------------


INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cómo calificaría de importante el precio del producto eléctrico que tiene contratado?', '2018-05-29 08:26:14.000000');

INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Muy poco importante)', 0, 16);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 16);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 16);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 16);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Lo más importante)', 0, 16);

---------------------------------------------------------------------------------------------------------------------------


INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Le importa el tipo de producto eléctrico que tiene contratado (Fijo o indexado)?', '2018-05-29 08:26:15.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Muy poco importante)', 0, 17);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 17);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 17);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 17);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Lo más importante)', 0, 17);

---------------------------------------------------------------------------------------------------------------------------


INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cómo calificaría de importante recibir notificaciones por email, what''s app o cualquier otro sistema de mensajería de su comercializadora notificándole las modificaciones en su contrato?', '2018-05-29 08:26:17.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Muy poco importante)', 0, 18);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 18);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 18);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 18);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Lo más importante)', 0, 18);
---------------------------------------------------------------------------------------------------------------------------


INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Prefiere tener un único contrato para luz y gas, o prefiere contratos por separado?', '2018-05-29 08:26:18.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Me resulta indiferente)', 0, 19);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 19);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 19);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 19);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Es muy relevante para mi)', 0, 19);
---------------------------------------------------------------------------------------------------------------------------


INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Le importaría tener permanencia de un año en su contrato?', '2018-05-29 08:26:19.000000');

INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Prefiero un precio más alto y no tener permanencia.', 0, 20);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No me importa si eso implica conseguir un precio más barato.', 0, 20);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Otros', 0, 20);
---------------------------------------------------------------------------------------------------------------------------


INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Le gustaría tener seguro y/o cobertura de mantenimiento de sus instalaciones? ', '2018-05-29 08:26:20.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (No me interesa para nada)', 0, 21);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 21);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 21);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 21);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (Me encantaría)', 0, 21);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cuánto estaría dispuesto a pagar por el seguro y/o cobertura de mantenimiento de sus instalaciones?', '2018-05-29 08:26:21.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Nada)', 0, 22);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 22);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 0, 22);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0, 22);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (El máximo a cambio de la máxima calidad)', 0, 22);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Estaría dispuesto a pagar más por algún tipo de certificado de energía verde que le garantice que la energía consumida proviene de fuentes renovables?', '2018-05-29 08:26:23.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Sí', 0, 23);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No', 0, 23);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Tal vez', 0, 23);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Le interesa un asesor energético que le ayude a gestionar su contrato?', '2018-05-29 08:26:24.000000');
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Sí', 0, 24);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No', 0, 24);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Tal vez', 0, 24);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Cuánto estaría dispuesto a pagar por un asesor energético?', '2018-05-29 08:26:27.000000');

INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('1 (Nada)', 0, 25);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('2', 0, 25);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('3', 1,25);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('4', 0,25);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('5 (El máximo a cambio de olvidarme de cualquier gestión)', 0,25);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Le importa la metodología para efectuar el tipo de pago? (Paypal, transferencia, etc...)', '2018-05-29 08:26:28.000000');

INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Sí', 0, 26);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('No', 0, 26);
INSERT INTO surveys_choice ( choice_text, votes, question_id) VALUES ('Tal vez', 0, 26);
---------------------------------------------------------------------------------------------------------------------------

INSERT INTO surveys_question ( question_text, publication_date) VALUES ('¿Qué metodología de pago le gustaría que tuviera su empresa comercializadora?', '2018-05-29 08:26:30.000000');

---------------------------------------------------------------------------------------------------------------------------
