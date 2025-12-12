--
-- PostgreSQL database dump
--

\restrict x80JU2agUcP3afSatE6gocoK06aZQrWCM7x6wE5cCFGx8wmByKZbrSHeQEhgSJ0

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-12-12 04:34:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5101 (class 0 OID 16408)
-- Dependencies: 224
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categorias (id_categoria, nombre_categoria, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (2, 'Matemáticas', 'Categoría para preguntas de matemáticas', NULL);
INSERT INTO public.categorias (id_categoria, nombre_categoria, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (3, 'Matemáticas', 'Categoría de matemáticas', NULL);


--
-- TOC entry 5097 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuarios (id_usuario, correo, nombre_completo, fecha_registro, registrado_por, activo, password_hash) OVERRIDING SYSTEM VALUE VALUES (4, 'admin@test.com', 'Administrador del sistema', '2025-12-02 22:34:31.430856', NULL, true, '$2b$10$dVCrG9dIQiZ.X2LS9QJhD.FIbzWAzc3yC/H.rttnvLDJY2LhOmAMO');
INSERT INTO public.usuarios (id_usuario, correo, nombre_completo, fecha_registro, registrado_por, activo, password_hash) OVERRIDING SYSTEM VALUE VALUES (5, 'docente1@test.com', 'Docente Principal', '2025-12-02 23:20:24.838', NULL, true, '$2b$10$v4pHM4F1bd.ONNUJsLGmp.hAocs1PQoP680CVDoTCC0kOSLv7DhAK');
INSERT INTO public.usuarios (id_usuario, correo, nombre_completo, fecha_registro, registrado_por, activo, password_hash) OVERRIDING SYSTEM VALUE VALUES (6, 'estudiante1@test.com', 'estudiante 1', '2025-12-03 08:31:46.983', NULL, true, '$2b$10$xnu9y./LgeQjXo40HhDwIuljqEQ28qgC4A4j8Xp2u03K//aFkIByW');
INSERT INTO public.usuarios (id_usuario, correo, nombre_completo, fecha_registro, registrado_por, activo, password_hash) OVERRIDING SYSTEM VALUE VALUES (7, 'docente1@test.com', 'Docente Principal', '2025-12-12 03:04:59.469', NULL, true, '$2b$10$6ZK1PioZs80a8o8q70mAJOrS6GGDxcAJySloGgssmvwbFI/mroGoy');


--
-- TOC entry 5113 (class 0 OID 16473)
-- Dependencies: 236
-- Data for Name: ciclos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5109 (class 0 OID 16442)
-- Dependencies: 232
-- Data for Name: contenidos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5107 (class 0 OID 16433)
-- Dependencies: 230
-- Data for Name: estados_pregunta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.estados_pregunta (id_estado, nombre_estado, descripcion, orden) OVERRIDING SYSTEM VALUE VALUES (1, 'BORRADOR', 'Pregunta en edici¢n', 1);
INSERT INTO public.estados_pregunta (id_estado, nombre_estado, descripcion, orden) OVERRIDING SYSTEM VALUE VALUES (2, 'PUBLICADA', 'Pregunta lista para ex menes', 2);
INSERT INTO public.estados_pregunta (id_estado, nombre_estado, descripcion, orden) OVERRIDING SYSTEM VALUE VALUES (3, 'BORRADOR', 'A£n no publicada', 1);
INSERT INTO public.estados_pregunta (id_estado, nombre_estado, descripcion, orden) OVERRIDING SYSTEM VALUE VALUES (4, 'PUBLICADA', 'Visible para usar', 2);


--
-- TOC entry 5115 (class 0 OID 16487)
-- Dependencies: 238
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5141 (class 0 OID 16762)
-- Dependencies: 264
-- Data for Name: tipos_examen; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5129 (class 0 OID 16630)
-- Dependencies: 252
-- Data for Name: examenes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.examenes (id_examen, titulo, descripcion, id_ciclo, id_grupo, fecha_inicio, fecha_fin, duracion_minutos, intentos_permitidos, calificacion_minima, mostrar_resultados, aleatorizar_preguntas, aleatorizar_opciones, activo, fecha_creacion, creado_por, id_tipo_examen) OVERRIDING SYSTEM VALUE VALUES (1, 'Examen Matemática 1', 'Unidad 1', NULL, NULL, NULL, NULL, 30, 2, NULL, true, true, true, true, '2025-12-12 02:09:47.038', 4, NULL);


--
-- TOC entry 5105 (class 0 OID 16424)
-- Dependencies: 228
-- Data for Name: niveles_dificultad; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.niveles_dificultad (id_dificultad, nivel, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (1, 'F cil', 'Preguntas sencillas', true);
INSERT INTO public.niveles_dificultad (id_dificultad, nivel, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (2, 'Medio', 'Preguntas intermedias', true);
INSERT INTO public.niveles_dificultad (id_dificultad, nivel, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (3, 'Dif¡cil', 'Preguntas avanzadas', true);
INSERT INTO public.niveles_dificultad (id_dificultad, nivel, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (4, 'F cil', 'Preguntas b sicas', true);
INSERT INTO public.niveles_dificultad (id_dificultad, nivel, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (5, 'Medio', 'Preguntas intermedias', true);
INSERT INTO public.niveles_dificultad (id_dificultad, nivel, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (6, 'Dif¡cil', 'Preguntas avanzadas', true);


--
-- TOC entry 5103 (class 0 OID 16417)
-- Dependencies: 226
-- Data for Name: rangos_edad; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.rangos_edad (id_rango_edad, nombre_rango, edad_minima, edad_maxima, activo) OVERRIDING SYSTEM VALUE VALUES (1, '18-25', 18, 25, true);


--
-- TOC entry 5117 (class 0 OID 16501)
-- Dependencies: 240
-- Data for Name: subcategorias; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5119 (class 0 OID 16515)
-- Dependencies: 242
-- Data for Name: preguntas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.preguntas (id_pregunta, id_subcategoria, id_rango_edad, id_dificultad, id_estado, tipo_pregunta, titulo_pregunta, id_contenido_pregunta, puntos_recomendados, tiempo_estimado, explicacion, fecha_creacion, fecha_modificacion, creado_por, votos_requeridos, votos_positivos, votos_negativos, fecha_publicacion, activa) OVERRIDING SYSTEM VALUE VALUES (6, NULL, NULL, NULL, NULL, NULL, '¿Cuánto es 2 + 2?', NULL, NULL, NULL, NULL, '2025-12-09 15:28:26.4', '2025-12-09 15:28:26.4', 4, NULL, NULL, NULL, NULL, true);
INSERT INTO public.preguntas (id_pregunta, id_subcategoria, id_rango_edad, id_dificultad, id_estado, tipo_pregunta, titulo_pregunta, id_contenido_pregunta, puntos_recomendados, tiempo_estimado, explicacion, fecha_creacion, fecha_modificacion, creado_por, votos_requeridos, votos_positivos, votos_negativos, fecha_publicacion, activa) OVERRIDING SYSTEM VALUE VALUES (7, NULL, NULL, 1, 2, NULL, '¿Cuánto es 3 + 5?', NULL, 1.00, 30, 'Suma básica de enteros.', '2025-12-09 15:33:36.31', '2025-12-09 15:33:36.31', 4, NULL, NULL, NULL, NULL, true);


--
-- TOC entry 5131 (class 0 OID 16654)
-- Dependencies: 254
-- Data for Name: examenes_preguntas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5133 (class 0 OID 16676)
-- Dependencies: 256
-- Data for Name: intentos_examen; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5121 (class 0 OID 16554)
-- Dependencies: 244
-- Data for Name: opciones_pregunta; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5123 (class 0 OID 16573)
-- Dependencies: 246
-- Data for Name: pares_emparejamiento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5099 (class 0 OID 16399)
-- Dependencies: 222
-- Data for Name: privilegios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.privilegios (id_privilegio, nombre_privilegio, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (1, 'ADMIN', 'Administrador del sistema', true);
INSERT INTO public.privilegios (id_privilegio, nombre_privilegio, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (2, 'DOCENTE', 'Puede crear ex menes y preguntas', true);
INSERT INTO public.privilegios (id_privilegio, nombre_privilegio, descripcion, activo) OVERRIDING SYSTEM VALUE VALUES (3, 'ESTUDIANTE', 'Puede rendir ex menes', true);


--
-- TOC entry 5139 (class 0 OID 16737)
-- Dependencies: 262
-- Data for Name: respuestas_desarrollo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5137 (class 0 OID 16715)
-- Dependencies: 260
-- Data for Name: respuestas_emparejamiento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5125 (class 0 OID 16597)
-- Dependencies: 248
-- Data for Name: respuestas_modelo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5135 (class 0 OID 16693)
-- Dependencies: 258
-- Data for Name: respuestas_seleccion; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5127 (class 0 OID 16611)
-- Dependencies: 250
-- Data for Name: revisiones_pregunta; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5111 (class 0 OID 16451)
-- Dependencies: 234
-- Data for Name: usuarios_privilegios; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.usuarios_privilegios (id_usuario_privilegio, id_usuario, id_privilegio, asignado_por, fecha_asignacion) OVERRIDING SYSTEM VALUE VALUES (2, 4, 1, 4, '2025-12-02 22:44:32.910807');
INSERT INTO public.usuarios_privilegios (id_usuario_privilegio, id_usuario, id_privilegio, asignado_por, fecha_asignacion) OVERRIDING SYSTEM VALUE VALUES (3, 5, 2, NULL, '2025-12-02 23:20:24.875');
INSERT INTO public.usuarios_privilegios (id_usuario_privilegio, id_usuario, id_privilegio, asignado_por, fecha_asignacion) OVERRIDING SYSTEM VALUE VALUES (4, 6, 3, NULL, '2025-12-03 08:31:47.018');
INSERT INTO public.usuarios_privilegios (id_usuario_privilegio, id_usuario, id_privilegio, asignado_por, fecha_asignacion) OVERRIDING SYSTEM VALUE VALUES (5, 7, 2, NULL, '2025-12-12 03:04:59.508');


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 223
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 3, true);


--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 235
-- Name: ciclos_id_ciclo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ciclos_id_ciclo_seq', 1, false);


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 231
-- Name: contenidos_id_contenido_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contenidos_id_contenido_seq', 1, false);


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 229
-- Name: estados_pregunta_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estados_pregunta_id_estado_seq', 4, true);


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 251
-- Name: examenes_id_examen_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.examenes_id_examen_seq', 1, true);


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 253
-- Name: examenes_preguntas_id_examen_pregunta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.examenes_preguntas_id_examen_pregunta_seq', 1, false);


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 237
-- Name: grupos_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grupos_id_grupo_seq', 1, false);


--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 255
-- Name: intentos_examen_id_intento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.intentos_examen_id_intento_seq', 1, false);


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 227
-- Name: niveles_dificultad_id_dificultad_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.niveles_dificultad_id_dificultad_seq', 6, true);


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 243
-- Name: opciones_pregunta_id_opcion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.opciones_pregunta_id_opcion_seq', 1, false);


--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 245
-- Name: pares_emparejamiento_id_par_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pares_emparejamiento_id_par_seq', 1, false);


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 241
-- Name: preguntas_id_pregunta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.preguntas_id_pregunta_seq', 7, true);


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 221
-- Name: privilegios_id_privilegio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.privilegios_id_privilegio_seq', 3, true);


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 225
-- Name: rangos_edad_id_rango_edad_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rangos_edad_id_rango_edad_seq', 1, true);


--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 261
-- Name: respuestas_desarrollo_id_respuesta_desarrollo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.respuestas_desarrollo_id_respuesta_desarrollo_seq', 1, false);


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 259
-- Name: respuestas_emparejamiento_id_respuesta_emparejamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.respuestas_emparejamiento_id_respuesta_emparejamiento_seq', 1, false);


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 247
-- Name: respuestas_modelo_id_respuesta_modelo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.respuestas_modelo_id_respuesta_modelo_seq', 1, false);


--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 257
-- Name: respuestas_seleccion_id_respuesta_seleccion_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.respuestas_seleccion_id_respuesta_seleccion_seq', 1, false);


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 249
-- Name: revisiones_pregunta_id_revision_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.revisiones_pregunta_id_revision_seq', 1, false);


--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 239
-- Name: subcategorias_id_subcategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subcategorias_id_subcategoria_seq', 1, false);


--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 263
-- Name: tipos_examen_id_tipo_examen_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipos_examen_id_tipo_examen_seq', 1, false);


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 7, true);


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 233
-- Name: usuarios_privilegios_id_usuario_privilegio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuarios_privilegios_id_usuario_privilegio_seq', 5, true);


-- Completed on 2025-12-12 04:34:50

--
-- PostgreSQL database dump complete
--

\unrestrict x80JU2agUcP3afSatE6gocoK06aZQrWCM7x6wE5cCFGx8wmByKZbrSHeQEhgSJ0

