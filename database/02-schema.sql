--
-- PostgreSQL database dump
--

\restrict WpDim6o1QJMYwdLbv4wV5OAKcqeDDVRIXw3iOg74DLq7mZGBH28ZnaXhGjutqtw

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-12-12 04:27:38

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 16408)
-- Name: categorias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(255),
    descripcion character varying(255),
    activo boolean
);


--
-- TOC entry 223 (class 1259 OID 16407)
-- Name: categorias_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.categorias ALTER COLUMN id_categoria ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categorias_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 16473)
-- Name: ciclos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ciclos (
    id_ciclo integer NOT NULL,
    nombre_ciclo character varying(255),
    descripcion character varying(255),
    fecha_inicio date,
    fecha_fin date,
    activo boolean,
    creado_por integer
);


--
-- TOC entry 235 (class 1259 OID 16472)
-- Name: ciclos_id_ciclo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.ciclos ALTER COLUMN id_ciclo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ciclos_id_ciclo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16442)
-- Name: contenidos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contenidos (
    id_contenido integer NOT NULL,
    tipo_contenido character varying(255),
    url_contenido text,
    nombre_archivo character varying(255),
    tamanio_bytes bigint,
    mime_type character varying(255),
    fecha_subida timestamp without time zone,
    subido_por integer
);


--
-- TOC entry 231 (class 1259 OID 16441)
-- Name: contenidos_id_contenido_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.contenidos ALTER COLUMN id_contenido ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.contenidos_id_contenido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16433)
-- Name: estados_pregunta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estados_pregunta (
    id_estado integer NOT NULL,
    nombre_estado character varying(255),
    descripcion character varying(255),
    orden integer
);


--
-- TOC entry 229 (class 1259 OID 16432)
-- Name: estados_pregunta_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.estados_pregunta ALTER COLUMN id_estado ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.estados_pregunta_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 252 (class 1259 OID 16630)
-- Name: examenes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.examenes (
    id_examen integer NOT NULL,
    titulo character varying(255),
    descripcion text,
    id_ciclo integer,
    id_grupo integer,
    fecha_inicio timestamp without time zone,
    fecha_fin timestamp without time zone,
    duracion_minutos integer,
    intentos_permitidos integer,
    calificacion_minima numeric(10,2),
    mostrar_resultados boolean,
    aleatorizar_preguntas boolean,
    aleatorizar_opciones boolean,
    activo boolean,
    fecha_creacion timestamp without time zone,
    creado_por integer,
    id_tipo_examen integer
);


--
-- TOC entry 251 (class 1259 OID 16629)
-- Name: examenes_id_examen_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.examenes ALTER COLUMN id_examen ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.examenes_id_examen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 254 (class 1259 OID 16654)
-- Name: examenes_preguntas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.examenes_preguntas (
    id_examen_pregunta integer NOT NULL,
    id_examen integer,
    id_pregunta integer,
    orden_definido integer,
    puntos_asignados numeric(10,2),
    usar_puntos_recomendados boolean,
    obligatoria boolean,
    fecha_agregada timestamp without time zone,
    agregada_por integer
);


--
-- TOC entry 253 (class 1259 OID 16653)
-- Name: examenes_preguntas_id_examen_pregunta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.examenes_preguntas ALTER COLUMN id_examen_pregunta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.examenes_preguntas_id_examen_pregunta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 16487)
-- Name: grupos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grupos (
    id_grupo integer NOT NULL,
    nombre_grupo character varying(255),
    id_ciclo integer,
    descripcion character varying(255),
    activo boolean
);


--
-- TOC entry 237 (class 1259 OID 16486)
-- Name: grupos_id_grupo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.grupos ALTER COLUMN id_grupo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.grupos_id_grupo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 256 (class 1259 OID 16676)
-- Name: intentos_examen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.intentos_examen (
    id_intento integer NOT NULL,
    id_examen integer,
    id_usuario integer,
    numero_intento integer,
    fecha_inicio timestamp without time zone,
    fecha_finalizacion timestamp without time zone,
    calificacion numeric(10,2),
    puntos_obtenidos numeric(10,2),
    puntos_totales numeric(10,2),
    requiere_revision_manual boolean,
    completado boolean
);


--
-- TOC entry 255 (class 1259 OID 16675)
-- Name: intentos_examen_id_intento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.intentos_examen ALTER COLUMN id_intento ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.intentos_examen_id_intento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16424)
-- Name: niveles_dificultad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.niveles_dificultad (
    id_dificultad integer NOT NULL,
    nivel character varying(255),
    descripcion character varying(255),
    activo boolean
);


--
-- TOC entry 227 (class 1259 OID 16423)
-- Name: niveles_dificultad_id_dificultad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.niveles_dificultad ALTER COLUMN id_dificultad ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.niveles_dificultad_id_dificultad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 16554)
-- Name: opciones_pregunta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.opciones_pregunta (
    id_opcion integer NOT NULL,
    id_pregunta integer,
    texto_opcion text,
    id_contenido_opcion integer,
    es_correcta boolean,
    orden integer,
    fecha_creacion timestamp without time zone
);


--
-- TOC entry 243 (class 1259 OID 16553)
-- Name: opciones_pregunta_id_opcion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.opciones_pregunta ALTER COLUMN id_opcion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.opciones_pregunta_id_opcion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 246 (class 1259 OID 16573)
-- Name: pares_emparejamiento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pares_emparejamiento (
    id_par integer NOT NULL,
    id_pregunta integer,
    texto_pregunta text,
    id_contenido_pregunta integer,
    texto_respuesta text,
    id_contenido_respuesta integer,
    orden integer,
    fecha_creacion timestamp without time zone
);


--
-- TOC entry 245 (class 1259 OID 16572)
-- Name: pares_emparejamiento_id_par_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pares_emparejamiento ALTER COLUMN id_par ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pares_emparejamiento_id_par_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 16515)
-- Name: preguntas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.preguntas (
    id_pregunta integer NOT NULL,
    id_subcategoria integer,
    id_rango_edad integer,
    id_dificultad integer,
    id_estado integer,
    tipo_pregunta character varying(255),
    titulo_pregunta character varying(255),
    id_contenido_pregunta integer,
    puntos_recomendados numeric(10,2),
    tiempo_estimado integer,
    explicacion text,
    fecha_creacion timestamp without time zone,
    fecha_modificacion timestamp without time zone,
    creado_por integer,
    votos_requeridos integer,
    votos_positivos integer,
    votos_negativos integer,
    fecha_publicacion timestamp without time zone,
    activa boolean
);


--
-- TOC entry 241 (class 1259 OID 16514)
-- Name: preguntas_id_pregunta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.preguntas ALTER COLUMN id_pregunta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.preguntas_id_pregunta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16399)
-- Name: privilegios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.privilegios (
    id_privilegio integer NOT NULL,
    nombre_privilegio character varying(255),
    descripcion character varying(255),
    activo boolean
);


--
-- TOC entry 221 (class 1259 OID 16398)
-- Name: privilegios_id_privilegio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.privilegios ALTER COLUMN id_privilegio ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.privilegios_id_privilegio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16417)
-- Name: rangos_edad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rangos_edad (
    id_rango_edad integer NOT NULL,
    nombre_rango character varying(255),
    edad_minima integer,
    edad_maxima integer,
    activo boolean
);


--
-- TOC entry 225 (class 1259 OID 16416)
-- Name: rangos_edad_id_rango_edad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.rangos_edad ALTER COLUMN id_rango_edad ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rangos_edad_id_rango_edad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 262 (class 1259 OID 16737)
-- Name: respuestas_desarrollo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.respuestas_desarrollo (
    id_respuesta_desarrollo integer NOT NULL,
    id_intento integer,
    id_examen_pregunta integer,
    respuesta_texto text,
    puntos_obtenidos numeric(10,2),
    fecha_respuesta timestamp without time zone,
    calificada boolean,
    calificada_por integer,
    fecha_calificacion timestamp without time zone,
    comentario_calificador text
);


--
-- TOC entry 261 (class 1259 OID 16736)
-- Name: respuestas_desarrollo_id_respuesta_desarrollo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.respuestas_desarrollo ALTER COLUMN id_respuesta_desarrollo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.respuestas_desarrollo_id_respuesta_desarrollo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 260 (class 1259 OID 16715)
-- Name: respuestas_emparejamiento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.respuestas_emparejamiento (
    id_respuesta_emparejamiento integer NOT NULL,
    id_intento integer,
    id_examen_pregunta integer,
    id_par integer,
    es_correcto boolean,
    fecha_respuesta timestamp without time zone
);


--
-- TOC entry 259 (class 1259 OID 16714)
-- Name: respuestas_emparejamiento_id_respuesta_emparejamiento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.respuestas_emparejamiento ALTER COLUMN id_respuesta_emparejamiento ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.respuestas_emparejamiento_id_respuesta_emparejamiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 248 (class 1259 OID 16597)
-- Name: respuestas_modelo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.respuestas_modelo (
    id_respuesta_modelo integer NOT NULL,
    id_pregunta integer,
    respuesta_texto text,
    palabras_clave text,
    fecha_creacion timestamp without time zone
);


--
-- TOC entry 247 (class 1259 OID 16596)
-- Name: respuestas_modelo_id_respuesta_modelo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.respuestas_modelo ALTER COLUMN id_respuesta_modelo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.respuestas_modelo_id_respuesta_modelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 258 (class 1259 OID 16693)
-- Name: respuestas_seleccion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.respuestas_seleccion (
    id_respuesta_seleccion integer NOT NULL,
    id_intento integer,
    id_examen_pregunta integer,
    id_opcion_seleccionada integer,
    es_correcta boolean,
    puntos_obtenidos numeric(10,2),
    fecha_respuesta timestamp without time zone
);


--
-- TOC entry 257 (class 1259 OID 16692)
-- Name: respuestas_seleccion_id_respuesta_seleccion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.respuestas_seleccion ALTER COLUMN id_respuesta_seleccion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.respuestas_seleccion_id_respuesta_seleccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 250 (class 1259 OID 16611)
-- Name: revisiones_pregunta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.revisiones_pregunta (
    id_revision integer NOT NULL,
    id_pregunta integer,
    id_revisor integer,
    voto character varying(50),
    comentario text,
    fecha_revision timestamp without time zone
);


--
-- TOC entry 249 (class 1259 OID 16610)
-- Name: revisiones_pregunta_id_revision_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.revisiones_pregunta ALTER COLUMN id_revision ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.revisiones_pregunta_id_revision_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 16501)
-- Name: subcategorias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subcategorias (
    id_subcategoria integer NOT NULL,
    id_categoria integer,
    nombre_subcategoria character varying(255),
    descripcion character varying(255),
    activo boolean
);


--
-- TOC entry 239 (class 1259 OID 16500)
-- Name: subcategorias_id_subcategoria_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.subcategorias ALTER COLUMN id_subcategoria ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.subcategorias_id_subcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 264 (class 1259 OID 16762)
-- Name: tipos_examen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipos_examen (
    id_tipo_examen integer NOT NULL,
    nombre_tipo character varying(100),
    descripcion character varying(255),
    activo boolean
);


--
-- TOC entry 263 (class 1259 OID 16761)
-- Name: tipos_examen_id_tipo_examen_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tipos_examen ALTER COLUMN id_tipo_examen ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tipos_examen_id_tipo_examen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    correo character varying(255),
    nombre_completo character varying(255),
    fecha_registro timestamp without time zone,
    registrado_por integer,
    activo boolean,
    password_hash character varying(255)
);


--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.usuarios ALTER COLUMN id_usuario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 16451)
-- Name: usuarios_privilegios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuarios_privilegios (
    id_usuario_privilegio integer NOT NULL,
    id_usuario integer,
    id_privilegio integer,
    asignado_por integer,
    fecha_asignacion timestamp without time zone
);


--
-- TOC entry 233 (class 1259 OID 16450)
-- Name: usuarios_privilegios_id_usuario_privilegio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.usuarios_privilegios ALTER COLUMN id_usuario_privilegio ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuarios_privilegios_id_usuario_privilegio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4870 (class 2606 OID 16415)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4882 (class 2606 OID 16480)
-- Name: ciclos ciclos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ciclos
    ADD CONSTRAINT ciclos_pkey PRIMARY KEY (id_ciclo);


--
-- TOC entry 4878 (class 2606 OID 16449)
-- Name: contenidos contenidos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contenidos
    ADD CONSTRAINT contenidos_pkey PRIMARY KEY (id_contenido);


--
-- TOC entry 4876 (class 2606 OID 16440)
-- Name: estados_pregunta estados_pregunta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estados_pregunta
    ADD CONSTRAINT estados_pregunta_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 4898 (class 2606 OID 16637)
-- Name: examenes examenes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.examenes
    ADD CONSTRAINT examenes_pkey PRIMARY KEY (id_examen);


--
-- TOC entry 4900 (class 2606 OID 16659)
-- Name: examenes_preguntas examenes_preguntas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.examenes_preguntas
    ADD CONSTRAINT examenes_preguntas_pkey PRIMARY KEY (id_examen_pregunta);


--
-- TOC entry 4884 (class 2606 OID 16494)
-- Name: grupos grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 4902 (class 2606 OID 16681)
-- Name: intentos_examen intentos_examen_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.intentos_examen
    ADD CONSTRAINT intentos_examen_pkey PRIMARY KEY (id_intento);


--
-- TOC entry 4874 (class 2606 OID 16431)
-- Name: niveles_dificultad niveles_dificultad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.niveles_dificultad
    ADD CONSTRAINT niveles_dificultad_pkey PRIMARY KEY (id_dificultad);


--
-- TOC entry 4890 (class 2606 OID 16561)
-- Name: opciones_pregunta opciones_pregunta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opciones_pregunta
    ADD CONSTRAINT opciones_pregunta_pkey PRIMARY KEY (id_opcion);


--
-- TOC entry 4892 (class 2606 OID 16580)
-- Name: pares_emparejamiento pares_emparejamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pares_emparejamiento
    ADD CONSTRAINT pares_emparejamiento_pkey PRIMARY KEY (id_par);


--
-- TOC entry 4888 (class 2606 OID 16522)
-- Name: preguntas preguntas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT preguntas_pkey PRIMARY KEY (id_pregunta);


--
-- TOC entry 4868 (class 2606 OID 16406)
-- Name: privilegios privilegios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.privilegios
    ADD CONSTRAINT privilegios_pkey PRIMARY KEY (id_privilegio);


--
-- TOC entry 4872 (class 2606 OID 16422)
-- Name: rangos_edad rangos_edad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rangos_edad
    ADD CONSTRAINT rangos_edad_pkey PRIMARY KEY (id_rango_edad);


--
-- TOC entry 4908 (class 2606 OID 16744)
-- Name: respuestas_desarrollo respuestas_desarrollo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_desarrollo
    ADD CONSTRAINT respuestas_desarrollo_pkey PRIMARY KEY (id_respuesta_desarrollo);


--
-- TOC entry 4906 (class 2606 OID 16720)
-- Name: respuestas_emparejamiento respuestas_emparejamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_emparejamiento
    ADD CONSTRAINT respuestas_emparejamiento_pkey PRIMARY KEY (id_respuesta_emparejamiento);


--
-- TOC entry 4894 (class 2606 OID 16604)
-- Name: respuestas_modelo respuestas_modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_modelo
    ADD CONSTRAINT respuestas_modelo_pkey PRIMARY KEY (id_respuesta_modelo);


--
-- TOC entry 4904 (class 2606 OID 16698)
-- Name: respuestas_seleccion respuestas_seleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_seleccion
    ADD CONSTRAINT respuestas_seleccion_pkey PRIMARY KEY (id_respuesta_seleccion);


--
-- TOC entry 4896 (class 2606 OID 16618)
-- Name: revisiones_pregunta revisiones_pregunta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revisiones_pregunta
    ADD CONSTRAINT revisiones_pregunta_pkey PRIMARY KEY (id_revision);


--
-- TOC entry 4886 (class 2606 OID 16508)
-- Name: subcategorias subcategorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT subcategorias_pkey PRIMARY KEY (id_subcategoria);


--
-- TOC entry 4910 (class 2606 OID 16767)
-- Name: tipos_examen tipos_examen_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipos_examen
    ADD CONSTRAINT tipos_examen_pkey PRIMARY KEY (id_tipo_examen);


--
-- TOC entry 4866 (class 2606 OID 16397)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4880 (class 2606 OID 16456)
-- Name: usuarios_privilegios usuarios_privilegios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios_privilegios
    ADD CONSTRAINT usuarios_privilegios_pkey PRIMARY KEY (id_usuario_privilegio);


--
-- TOC entry 4914 (class 2606 OID 16481)
-- Name: ciclos ciclos_creado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ciclos
    ADD CONSTRAINT ciclos_creado_por_fkey FOREIGN KEY (creado_por) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4931 (class 2606 OID 16648)
-- Name: examenes examenes_creado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.examenes
    ADD CONSTRAINT examenes_creado_por_fkey FOREIGN KEY (creado_por) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4932 (class 2606 OID 16638)
-- Name: examenes examenes_id_ciclo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.examenes
    ADD CONSTRAINT examenes_id_ciclo_fkey FOREIGN KEY (id_ciclo) REFERENCES public.ciclos(id_ciclo);


--
-- TOC entry 4933 (class 2606 OID 16643)
-- Name: examenes examenes_id_grupo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.examenes
    ADD CONSTRAINT examenes_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES public.grupos(id_grupo);


--
-- TOC entry 4934 (class 2606 OID 16768)
-- Name: examenes examenes_id_tipo_examen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.examenes
    ADD CONSTRAINT examenes_id_tipo_examen_fkey FOREIGN KEY (id_tipo_examen) REFERENCES public.tipos_examen(id_tipo_examen);


--
-- TOC entry 4935 (class 2606 OID 16670)
-- Name: examenes_preguntas examenes_preguntas_agregada_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.examenes_preguntas
    ADD CONSTRAINT examenes_preguntas_agregada_por_fkey FOREIGN KEY (agregada_por) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4936 (class 2606 OID 16660)
-- Name: examenes_preguntas examenes_preguntas_id_examen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.examenes_preguntas
    ADD CONSTRAINT examenes_preguntas_id_examen_fkey FOREIGN KEY (id_examen) REFERENCES public.examenes(id_examen);


--
-- TOC entry 4937 (class 2606 OID 16665)
-- Name: examenes_preguntas examenes_preguntas_id_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.examenes_preguntas
    ADD CONSTRAINT examenes_preguntas_id_pregunta_fkey FOREIGN KEY (id_pregunta) REFERENCES public.preguntas(id_pregunta);


--
-- TOC entry 4915 (class 2606 OID 16495)
-- Name: grupos grupos_id_ciclo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_id_ciclo_fkey FOREIGN KEY (id_ciclo) REFERENCES public.ciclos(id_ciclo);


--
-- TOC entry 4938 (class 2606 OID 16682)
-- Name: intentos_examen intentos_examen_id_examen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.intentos_examen
    ADD CONSTRAINT intentos_examen_id_examen_fkey FOREIGN KEY (id_examen) REFERENCES public.examenes(id_examen);


--
-- TOC entry 4939 (class 2606 OID 16687)
-- Name: intentos_examen intentos_examen_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.intentos_examen
    ADD CONSTRAINT intentos_examen_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4923 (class 2606 OID 16567)
-- Name: opciones_pregunta opciones_pregunta_id_contenido_opcion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opciones_pregunta
    ADD CONSTRAINT opciones_pregunta_id_contenido_opcion_fkey FOREIGN KEY (id_contenido_opcion) REFERENCES public.contenidos(id_contenido);


--
-- TOC entry 4924 (class 2606 OID 16562)
-- Name: opciones_pregunta opciones_pregunta_id_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.opciones_pregunta
    ADD CONSTRAINT opciones_pregunta_id_pregunta_fkey FOREIGN KEY (id_pregunta) REFERENCES public.preguntas(id_pregunta);


--
-- TOC entry 4925 (class 2606 OID 16586)
-- Name: pares_emparejamiento pares_emparejamiento_id_contenido_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pares_emparejamiento
    ADD CONSTRAINT pares_emparejamiento_id_contenido_pregunta_fkey FOREIGN KEY (id_contenido_pregunta) REFERENCES public.contenidos(id_contenido);


--
-- TOC entry 4926 (class 2606 OID 16591)
-- Name: pares_emparejamiento pares_emparejamiento_id_contenido_respuesta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pares_emparejamiento
    ADD CONSTRAINT pares_emparejamiento_id_contenido_respuesta_fkey FOREIGN KEY (id_contenido_respuesta) REFERENCES public.contenidos(id_contenido);


--
-- TOC entry 4927 (class 2606 OID 16581)
-- Name: pares_emparejamiento pares_emparejamiento_id_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pares_emparejamiento
    ADD CONSTRAINT pares_emparejamiento_id_pregunta_fkey FOREIGN KEY (id_pregunta) REFERENCES public.preguntas(id_pregunta);


--
-- TOC entry 4917 (class 2606 OID 16548)
-- Name: preguntas preguntas_creado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT preguntas_creado_por_fkey FOREIGN KEY (creado_por) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4918 (class 2606 OID 16543)
-- Name: preguntas preguntas_id_contenido_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT preguntas_id_contenido_pregunta_fkey FOREIGN KEY (id_contenido_pregunta) REFERENCES public.contenidos(id_contenido);


--
-- TOC entry 4919 (class 2606 OID 16533)
-- Name: preguntas preguntas_id_dificultad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT preguntas_id_dificultad_fkey FOREIGN KEY (id_dificultad) REFERENCES public.niveles_dificultad(id_dificultad);


--
-- TOC entry 4920 (class 2606 OID 16538)
-- Name: preguntas preguntas_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT preguntas_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES public.estados_pregunta(id_estado);


--
-- TOC entry 4921 (class 2606 OID 16528)
-- Name: preguntas preguntas_id_rango_edad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT preguntas_id_rango_edad_fkey FOREIGN KEY (id_rango_edad) REFERENCES public.rangos_edad(id_rango_edad);


--
-- TOC entry 4922 (class 2606 OID 16523)
-- Name: preguntas preguntas_id_subcategoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT preguntas_id_subcategoria_fkey FOREIGN KEY (id_subcategoria) REFERENCES public.subcategorias(id_subcategoria);


--
-- TOC entry 4946 (class 2606 OID 16755)
-- Name: respuestas_desarrollo respuestas_desarrollo_calificada_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_desarrollo
    ADD CONSTRAINT respuestas_desarrollo_calificada_por_fkey FOREIGN KEY (calificada_por) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4947 (class 2606 OID 16750)
-- Name: respuestas_desarrollo respuestas_desarrollo_id_examen_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_desarrollo
    ADD CONSTRAINT respuestas_desarrollo_id_examen_pregunta_fkey FOREIGN KEY (id_examen_pregunta) REFERENCES public.examenes_preguntas(id_examen_pregunta);


--
-- TOC entry 4948 (class 2606 OID 16745)
-- Name: respuestas_desarrollo respuestas_desarrollo_id_intento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_desarrollo
    ADD CONSTRAINT respuestas_desarrollo_id_intento_fkey FOREIGN KEY (id_intento) REFERENCES public.intentos_examen(id_intento);


--
-- TOC entry 4943 (class 2606 OID 16726)
-- Name: respuestas_emparejamiento respuestas_emparejamiento_id_examen_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_emparejamiento
    ADD CONSTRAINT respuestas_emparejamiento_id_examen_pregunta_fkey FOREIGN KEY (id_examen_pregunta) REFERENCES public.examenes_preguntas(id_examen_pregunta);


--
-- TOC entry 4944 (class 2606 OID 16721)
-- Name: respuestas_emparejamiento respuestas_emparejamiento_id_intento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_emparejamiento
    ADD CONSTRAINT respuestas_emparejamiento_id_intento_fkey FOREIGN KEY (id_intento) REFERENCES public.intentos_examen(id_intento);


--
-- TOC entry 4945 (class 2606 OID 16731)
-- Name: respuestas_emparejamiento respuestas_emparejamiento_id_par_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_emparejamiento
    ADD CONSTRAINT respuestas_emparejamiento_id_par_fkey FOREIGN KEY (id_par) REFERENCES public.pares_emparejamiento(id_par);


--
-- TOC entry 4928 (class 2606 OID 16605)
-- Name: respuestas_modelo respuestas_modelo_id_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_modelo
    ADD CONSTRAINT respuestas_modelo_id_pregunta_fkey FOREIGN KEY (id_pregunta) REFERENCES public.preguntas(id_pregunta);


--
-- TOC entry 4940 (class 2606 OID 16704)
-- Name: respuestas_seleccion respuestas_seleccion_id_examen_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_seleccion
    ADD CONSTRAINT respuestas_seleccion_id_examen_pregunta_fkey FOREIGN KEY (id_examen_pregunta) REFERENCES public.examenes_preguntas(id_examen_pregunta);


--
-- TOC entry 4941 (class 2606 OID 16699)
-- Name: respuestas_seleccion respuestas_seleccion_id_intento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_seleccion
    ADD CONSTRAINT respuestas_seleccion_id_intento_fkey FOREIGN KEY (id_intento) REFERENCES public.intentos_examen(id_intento);


--
-- TOC entry 4942 (class 2606 OID 16709)
-- Name: respuestas_seleccion respuestas_seleccion_id_opcion_seleccionada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.respuestas_seleccion
    ADD CONSTRAINT respuestas_seleccion_id_opcion_seleccionada_fkey FOREIGN KEY (id_opcion_seleccionada) REFERENCES public.opciones_pregunta(id_opcion);


--
-- TOC entry 4929 (class 2606 OID 16619)
-- Name: revisiones_pregunta revisiones_pregunta_id_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revisiones_pregunta
    ADD CONSTRAINT revisiones_pregunta_id_pregunta_fkey FOREIGN KEY (id_pregunta) REFERENCES public.preguntas(id_pregunta);


--
-- TOC entry 4930 (class 2606 OID 16624)
-- Name: revisiones_pregunta revisiones_pregunta_id_revisor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.revisiones_pregunta
    ADD CONSTRAINT revisiones_pregunta_id_revisor_fkey FOREIGN KEY (id_revisor) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4916 (class 2606 OID 16509)
-- Name: subcategorias subcategorias_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT subcategorias_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria);


--
-- TOC entry 4911 (class 2606 OID 16467)
-- Name: usuarios_privilegios usuarios_privilegios_asignado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios_privilegios
    ADD CONSTRAINT usuarios_privilegios_asignado_por_fkey FOREIGN KEY (asignado_por) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4912 (class 2606 OID 16462)
-- Name: usuarios_privilegios usuarios_privilegios_id_privilegio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios_privilegios
    ADD CONSTRAINT usuarios_privilegios_id_privilegio_fkey FOREIGN KEY (id_privilegio) REFERENCES public.privilegios(id_privilegio);


--
-- TOC entry 4913 (class 2606 OID 16457)
-- Name: usuarios_privilegios usuarios_privilegios_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios_privilegios
    ADD CONSTRAINT usuarios_privilegios_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


-- Completed on 2025-12-12 04:27:38

--
-- PostgreSQL database dump complete
--

\unrestrict WpDim6o1QJMYwdLbv4wV5OAKcqeDDVRIXw3iOg74DLq7mZGBH28ZnaXhGjutqtw

