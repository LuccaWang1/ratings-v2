--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Homebrew)
-- Dumped by pg_dump version 14.10 (Homebrew)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: robertsmith
--

CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    title character varying,
    overview text,
    release_date timestamp without time zone,
    poster_path character varying
);


ALTER TABLE public.movies OWNER TO robertsmith;

--
-- Name: movies_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: robertsmith
--

CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_movie_id_seq OWNER TO robertsmith;

--
-- Name: movies_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robertsmith
--

ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: robertsmith
--

CREATE TABLE public.ratings (
    rating_id integer NOT NULL,
    score integer,
    movie_id integer,
    user_id integer,
    comment character varying NOT NULL
);


ALTER TABLE public.ratings OWNER TO robertsmith;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: robertsmith
--

CREATE SEQUENCE public.ratings_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_rating_id_seq OWNER TO robertsmith;

--
-- Name: ratings_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robertsmith
--

ALTER SEQUENCE public.ratings_rating_id_seq OWNED BY public.ratings.rating_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: robertsmith
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO robertsmith;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: robertsmith
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO robertsmith;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: robertsmith
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: movies movie_id; Type: DEFAULT; Schema: public; Owner: robertsmith
--

ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);


--
-- Name: ratings rating_id; Type: DEFAULT; Schema: public; Owner: robertsmith
--

ALTER TABLE ONLY public.ratings ALTER COLUMN rating_id SET DEFAULT nextval('public.ratings_rating_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: robertsmith
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: robertsmith
--

COPY public.movies (movie_id, title, overview, release_date, poster_path) FROM stdin;
1	Jurassic Park	A pragmatic paleontologist touring an almost complete theme park on an island in Central America is tasked with protecting a couple of kids after a power hunger business mogel in just it for money	1993-06-11 00:00:00	photo
2	JurSASSic Park	When prehistoric creatures meet a dose of attitude, chaos finds a whole new meaning amid high-heeled raptors and snarky T-Rex quips	2024-01-04 17:41:13.448324	sassy trex
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: robertsmith
--

COPY public.ratings (rating_id, score, movie_id, user_id, comment) FROM stdin;
2	0	2	1	not sassy enough
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: robertsmith
--

COPY public.users (user_id, email, password) FROM stdin;
1	hotbod87@chiefs.com	ILoveTaylor89
2	ilovemymomforever@gmail.com	Meredith360
\.


--
-- Name: movies_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robertsmith
--

SELECT pg_catalog.setval('public.movies_movie_id_seq', 2, true);


--
-- Name: ratings_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robertsmith
--

SELECT pg_catalog.setval('public.ratings_rating_id_seq', 2, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: robertsmith
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: robertsmith
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: robertsmith
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: robertsmith
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: robertsmith
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: ratings ratings_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: robertsmith
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- Name: ratings ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: robertsmith
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

