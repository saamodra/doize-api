--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3

-- Started on 2021-08-21 17:44:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: lwfnuhlwxywuhs
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 4075 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: lwfnuhlwxywuhs
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 9035800)
-- Name: assignment; Type: TABLE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE TABLE public.assignment (
    id_assignment integer NOT NULL,
    name_assignment character varying,
    description_assignment character varying,
    course character varying,
    duedate_assignment timestamp without time zone,
    reminder_at timestamp without time zone,
    priority bigint DEFAULT 0,
    working_status bigint DEFAULT 0,
    status bigint DEFAULT 1,
    id_user bigint,
    creadate timestamp without time zone,
    modidate timestamp without time zone
);


ALTER TABLE public.assignment OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 202 (class 1259 OID 9035798)
-- Name: assignment_id_assignment_seq; Type: SEQUENCE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE SEQUENCE public.assignment_id_assignment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assignment_id_assignment_seq OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 4078 (class 0 OID 0)
-- Dependencies: 202
-- Name: assignment_id_assignment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER SEQUENCE public.assignment_id_assignment_seq OWNED BY public.assignment.id_assignment;


--
-- TOC entry 205 (class 1259 OID 9035862)
-- Name: daily_activity; Type: TABLE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE TABLE public.daily_activity (
    id_daily_activity integer NOT NULL,
    name_daily_activity character varying NOT NULL,
    description_daily_activity character varying,
    duedate_daily_activity timestamp without time zone,
    reminder_at timestamp without time zone,
    priority bigint DEFAULT 0 NOT NULL,
    working_status bigint DEFAULT 0 NOT NULL,
    status bigint DEFAULT 1 NOT NULL,
    id_user bigint NOT NULL,
    creadate timestamp without time zone DEFAULT now() NOT NULL,
    modidate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.daily_activity OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 204 (class 1259 OID 9035860)
-- Name: daily_activity_id_daily_activity_seq; Type: SEQUENCE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE SEQUENCE public.daily_activity_id_daily_activity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.daily_activity_id_daily_activity_seq OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 4079 (class 0 OID 0)
-- Dependencies: 204
-- Name: daily_activity_id_daily_activity_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER SEQUENCE public.daily_activity_id_daily_activity_seq OWNED BY public.daily_activity.id_daily_activity;


--
-- TOC entry 209 (class 1259 OID 9035946)
-- Name: detail_schedule; Type: TABLE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE TABLE public.detail_schedule (
    id_detail_schedule integer NOT NULL,
    name_detail_schedule character varying NOT NULL,
    day_schedule character varying NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    id_schedule integer NOT NULL,
    creadate timestamp without time zone DEFAULT now() NOT NULL,
    modidate time without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.detail_schedule OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 208 (class 1259 OID 9035944)
-- Name: detail_schedule_id_detail_schedule_seq; Type: SEQUENCE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE SEQUENCE public.detail_schedule_id_detail_schedule_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detail_schedule_id_detail_schedule_seq OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 4080 (class 0 OID 0)
-- Dependencies: 208
-- Name: detail_schedule_id_detail_schedule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER SEQUENCE public.detail_schedule_id_detail_schedule_seq OWNED BY public.detail_schedule.id_detail_schedule;


--
-- TOC entry 201 (class 1259 OID 3540530)
-- Name: doize_user; Type: TABLE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE TABLE public.doize_user (
    id_user integer NOT NULL,
    name character varying(255) NOT NULL,
    birth_date date,
    phone character varying(15),
    email character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    status integer NOT NULL,
    creadate date NOT NULL,
    modidate date NOT NULL
);


ALTER TABLE public.doize_user OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 211 (class 1259 OID 9035972)
-- Name: pomodoro; Type: TABLE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE TABLE public.pomodoro (
    id_pomodoro integer NOT NULL,
    id_user integer NOT NULL,
    productivity_time time without time zone DEFAULT '00:25:00'::time without time zone NOT NULL,
    count integer DEFAULT 1 NOT NULL,
    saved_time time without time zone DEFAULT '00:00:00'::time without time zone NOT NULL,
    short_break time without time zone DEFAULT '00:05:00'::time without time zone NOT NULL,
    long_break time without time zone DEFAULT '00:15:00'::time without time zone NOT NULL,
    modidate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.pomodoro OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 213 (class 1259 OID 9035991)
-- Name: pomodoro_activity; Type: TABLE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE TABLE public.pomodoro_activity (
    id_pomodoro_activity integer NOT NULL,
    id_pomodoro integer NOT NULL,
    activity_name character varying NOT NULL,
    working_status integer NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.pomodoro_activity OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 212 (class 1259 OID 9035989)
-- Name: pomodoro_activity_id_pomodoro_activity_seq; Type: SEQUENCE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE SEQUENCE public.pomodoro_activity_id_pomodoro_activity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pomodoro_activity_id_pomodoro_activity_seq OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 212
-- Name: pomodoro_activity_id_pomodoro_activity_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER SEQUENCE public.pomodoro_activity_id_pomodoro_activity_seq OWNED BY public.pomodoro_activity.id_pomodoro_activity;


--
-- TOC entry 210 (class 1259 OID 9035970)
-- Name: pomodoro_id_pomodoro_seq; Type: SEQUENCE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE SEQUENCE public.pomodoro_id_pomodoro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pomodoro_id_pomodoro_seq OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 210
-- Name: pomodoro_id_pomodoro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER SEQUENCE public.pomodoro_id_pomodoro_seq OWNED BY public.pomodoro.id_pomodoro;


--
-- TOC entry 207 (class 1259 OID 9035901)
-- Name: schedule; Type: TABLE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE TABLE public.schedule (
    id_schedule integer NOT NULL,
    name_schedule character varying NOT NULL,
    description_schedule character varying,
    status integer DEFAULT 1 NOT NULL,
    id_user integer NOT NULL,
    creadate timestamp without time zone DEFAULT now() NOT NULL,
    modidate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.schedule OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 206 (class 1259 OID 9035899)
-- Name: schedule_id_schedule_seq; Type: SEQUENCE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE SEQUENCE public.schedule_id_schedule_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedule_id_schedule_seq OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 206
-- Name: schedule_id_schedule_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER SEQUENCE public.schedule_id_schedule_seq OWNED BY public.schedule.id_schedule;


--
-- TOC entry 200 (class 1259 OID 3540528)
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: public; Owner: lwfnuhlwxywuhs
--

CREATE SEQUENCE public.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_user_seq OWNER TO lwfnuhlwxywuhs;

--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 200
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER SEQUENCE public.user_id_user_seq OWNED BY public.doize_user.id_user;


--
-- TOC entry 3880 (class 2604 OID 9035803)
-- Name: assignment id_assignment; Type: DEFAULT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.assignment ALTER COLUMN id_assignment SET DEFAULT nextval('public.assignment_id_assignment_seq'::regclass);


--
-- TOC entry 3889 (class 2604 OID 9036061)
-- Name: daily_activity id_daily_activity; Type: DEFAULT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.daily_activity ALTER COLUMN id_daily_activity SET DEFAULT nextval('public.daily_activity_id_daily_activity_seq'::regclass);


--
-- TOC entry 3894 (class 2604 OID 9035949)
-- Name: detail_schedule id_detail_schedule; Type: DEFAULT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.detail_schedule ALTER COLUMN id_detail_schedule SET DEFAULT nextval('public.detail_schedule_id_detail_schedule_seq'::regclass);


--
-- TOC entry 3879 (class 2604 OID 3540533)
-- Name: doize_user id_user; Type: DEFAULT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.doize_user ALTER COLUMN id_user SET DEFAULT nextval('public.user_id_user_seq'::regclass);


--
-- TOC entry 3897 (class 2604 OID 9035975)
-- Name: pomodoro id_pomodoro; Type: DEFAULT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.pomodoro ALTER COLUMN id_pomodoro SET DEFAULT nextval('public.pomodoro_id_pomodoro_seq'::regclass);


--
-- TOC entry 3904 (class 2604 OID 9035994)
-- Name: pomodoro_activity id_pomodoro_activity; Type: DEFAULT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.pomodoro_activity ALTER COLUMN id_pomodoro_activity SET DEFAULT nextval('public.pomodoro_activity_id_pomodoro_activity_seq'::regclass);


--
-- TOC entry 3890 (class 2604 OID 9035904)
-- Name: schedule id_schedule; Type: DEFAULT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.schedule ALTER COLUMN id_schedule SET DEFAULT nextval('public.schedule_id_schedule_seq'::regclass);


--
-- TOC entry 4059 (class 0 OID 9035800)
-- Dependencies: 203
-- Data for Name: assignment; Type: TABLE DATA; Schema: public; Owner: lwfnuhlwxywuhs
--

INSERT INTO public.assignment VALUES (1, 'Review PRG6', 'asd', 'Pemrograman 6', '2021-08-21 17:38:00', '2021-08-21 17:39:00', 1, 0, 1, 7, NULL, NULL);


--
-- TOC entry 4061 (class 0 OID 9035862)
-- Dependencies: 205
-- Data for Name: daily_activity; Type: TABLE DATA; Schema: public; Owner: lwfnuhlwxywuhs
--

INSERT INTO public.daily_activity VALUES (4, 'Makan', 'asdasd', '2021-08-21 17:36:00', '2021-08-21 17:36:00', 0, 0, 0, 7, '2021-08-21 10:36:34', '2021-08-21 10:36:59');


--
-- TOC entry 4065 (class 0 OID 9035946)
-- Dependencies: 209
-- Data for Name: detail_schedule; Type: TABLE DATA; Schema: public; Owner: lwfnuhlwxywuhs
--



--
-- TOC entry 4057 (class 0 OID 3540530)
-- Dependencies: 201
-- Data for Name: doize_user; Type: TABLE DATA; Schema: public; Owner: lwfnuhlwxywuhs
--

INSERT INTO public.doize_user VALUES (7, 'Samodra', '2021-08-21', '08123123', 'samodra@gmail.com', '$2y$10$cOWWk/pAjlhfoegaxpvpPO.TF0f2mGAYTaCs4XnqnxNfMXTKZlJW6', 1, '2021-08-21', '2021-08-21');


--
-- TOC entry 4067 (class 0 OID 9035972)
-- Dependencies: 211
-- Data for Name: pomodoro; Type: TABLE DATA; Schema: public; Owner: lwfnuhlwxywuhs
--

INSERT INTO public.pomodoro VALUES (1, 7, '00:00:05', 1, '00:00:00', '00:05:00', '00:15:00', '2021-08-21 10:38:19.718867');


--
-- TOC entry 4069 (class 0 OID 9035991)
-- Dependencies: 213
-- Data for Name: pomodoro_activity; Type: TABLE DATA; Schema: public; Owner: lwfnuhlwxywuhs
--

INSERT INTO public.pomodoro_activity VALUES (1, 1, 'test', 0, 0);


--
-- TOC entry 4063 (class 0 OID 9035901)
-- Dependencies: 207
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: lwfnuhlwxywuhs
--

INSERT INTO public.schedule VALUES (5, 'Poltek Astraasd', 'astra', 1, 7, '2021-08-21 10:35:32', '2021-08-21 10:35:55');


--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 202
-- Name: assignment_id_assignment_seq; Type: SEQUENCE SET; Schema: public; Owner: lwfnuhlwxywuhs
--

SELECT pg_catalog.setval('public.assignment_id_assignment_seq', 1, true);


--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 204
-- Name: daily_activity_id_daily_activity_seq; Type: SEQUENCE SET; Schema: public; Owner: lwfnuhlwxywuhs
--

SELECT pg_catalog.setval('public.daily_activity_id_daily_activity_seq', 4, true);


--
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 208
-- Name: detail_schedule_id_detail_schedule_seq; Type: SEQUENCE SET; Schema: public; Owner: lwfnuhlwxywuhs
--

SELECT pg_catalog.setval('public.detail_schedule_id_detail_schedule_seq', 1, true);


--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 212
-- Name: pomodoro_activity_id_pomodoro_activity_seq; Type: SEQUENCE SET; Schema: public; Owner: lwfnuhlwxywuhs
--

SELECT pg_catalog.setval('public.pomodoro_activity_id_pomodoro_activity_seq', 1, true);


--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 210
-- Name: pomodoro_id_pomodoro_seq; Type: SEQUENCE SET; Schema: public; Owner: lwfnuhlwxywuhs
--

SELECT pg_catalog.setval('public.pomodoro_id_pomodoro_seq', 1, true);


--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 206
-- Name: schedule_id_schedule_seq; Type: SEQUENCE SET; Schema: public; Owner: lwfnuhlwxywuhs
--

SELECT pg_catalog.setval('public.schedule_id_schedule_seq', 5, true);


--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 200
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: lwfnuhlwxywuhs
--

SELECT pg_catalog.setval('public.user_id_user_seq', 7, true);


--
-- TOC entry 3909 (class 2606 OID 9035811)
-- Name: assignment assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.assignment
    ADD CONSTRAINT assignment_pkey PRIMARY KEY (id_assignment);


--
-- TOC entry 3911 (class 2606 OID 9036063)
-- Name: daily_activity daily_activity_pk; Type: CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.daily_activity
    ADD CONSTRAINT daily_activity_pk PRIMARY KEY (id_daily_activity);


--
-- TOC entry 3915 (class 2606 OID 9035956)
-- Name: detail_schedule detail_schedule_pk; Type: CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.detail_schedule
    ADD CONSTRAINT detail_schedule_pk PRIMARY KEY (id_detail_schedule);


--
-- TOC entry 3919 (class 2606 OID 9036000)
-- Name: pomodoro_activity pomodoro_activity_pk; Type: CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.pomodoro_activity
    ADD CONSTRAINT pomodoro_activity_pk PRIMARY KEY (id_pomodoro_activity);


--
-- TOC entry 3917 (class 2606 OID 9035983)
-- Name: pomodoro pomodoro_pk; Type: CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.pomodoro
    ADD CONSTRAINT pomodoro_pk PRIMARY KEY (id_pomodoro);


--
-- TOC entry 3913 (class 2606 OID 9035912)
-- Name: schedule schedule_pk; Type: CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pk PRIMARY KEY (id_schedule);


--
-- TOC entry 3907 (class 2606 OID 3540538)
-- Name: doize_user user_pkey; Type: CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.doize_user
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);


--
-- TOC entry 3920 (class 2606 OID 9035886)
-- Name: assignment assignment_fk; Type: FK CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.assignment
    ADD CONSTRAINT assignment_fk FOREIGN KEY (id_user) REFERENCES public.doize_user(id_user);


--
-- TOC entry 3921 (class 2606 OID 9035876)
-- Name: daily_activity daily_activity_fk; Type: FK CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.daily_activity
    ADD CONSTRAINT daily_activity_fk FOREIGN KEY (id_user) REFERENCES public.doize_user(id_user);


--
-- TOC entry 3923 (class 2606 OID 9035957)
-- Name: detail_schedule detail_schedule_fk; Type: FK CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.detail_schedule
    ADD CONSTRAINT detail_schedule_fk FOREIGN KEY (id_schedule) REFERENCES public.schedule(id_schedule);


--
-- TOC entry 3925 (class 2606 OID 9036001)
-- Name: pomodoro_activity pomodoro_activity_fk; Type: FK CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.pomodoro_activity
    ADD CONSTRAINT pomodoro_activity_fk FOREIGN KEY (id_pomodoro) REFERENCES public.pomodoro(id_pomodoro);


--
-- TOC entry 3924 (class 2606 OID 9035984)
-- Name: pomodoro pomodoro_fk; Type: FK CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.pomodoro
    ADD CONSTRAINT pomodoro_fk FOREIGN KEY (id_user) REFERENCES public.doize_user(id_user);


--
-- TOC entry 3922 (class 2606 OID 9035913)
-- Name: schedule schedule_fk; Type: FK CONSTRAINT; Schema: public; Owner: lwfnuhlwxywuhs
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_fk FOREIGN KEY (id_user) REFERENCES public.doize_user(id_user);


--
-- TOC entry 4076 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: lwfnuhlwxywuhs
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO lwfnuhlwxywuhs;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 4077 (class 0 OID 0)
-- Dependencies: 670
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO lwfnuhlwxywuhs;


-- Completed on 2021-08-21 17:45:17

--
-- PostgreSQL database dump complete
--

