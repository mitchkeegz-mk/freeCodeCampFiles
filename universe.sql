--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

ALTER TABLE ONLY public.star DROP CONSTRAINT star_galaxy_id_fkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_star_id_fkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_id_fkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.peoples_fav DROP CONSTRAINT peoples_fav_pkey;
ALTER TABLE ONLY public.peoples_fav DROP CONSTRAINT peoples_fav_people_id_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.peoples_fav ALTER COLUMN peoples_fav_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
DROP SEQUENCE public.star_star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.peoples_fav_people_id_seq;
DROP TABLE public.peoples_fav;
DROP SEQUENCE public.moon_moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    size integer,
    weight numeric(6,2) NOT NULL,
    is_gas boolean,
    latin_name text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    size integer,
    weight numeric(6,2) NOT NULL,
    is_gas boolean,
    latin_name text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: peoples_fav; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.peoples_fav (
    school text,
    age integer NOT NULL,
    location text,
    name character varying(30),
    peoples_fav_id integer NOT NULL
);


ALTER TABLE public.peoples_fav OWNER TO freecodecamp;

--
-- Name: peoples_fav_people_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.peoples_fav_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.peoples_fav_people_id_seq OWNER TO freecodecamp;

--
-- Name: peoples_fav_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.peoples_fav_people_id_seq OWNED BY public.peoples_fav.peoples_fav_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    size integer,
    weight numeric(6,2) NOT NULL,
    is_gas boolean,
    latin_name text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    size integer,
    weight numeric(6,2) NOT NULL,
    is_gas boolean,
    latin_name text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: peoples_fav peoples_fav_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.peoples_fav ALTER COLUMN peoples_fav_id SET DEFAULT nextval('public.peoples_fav_people_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 10, 5.00, true, 'wubrfuef');
INSERT INTO public.galaxy VALUES (2, 'Aererrera', 10, 5.00, true, 'werrrffds');
INSERT INTO public.galaxy VALUES (3, 'Aetgtda', 990, 666.00, false, 'werrwt4rrffds');
INSERT INTO public.galaxy VALUES (4, 'tterea', 566, 1226.00, false, 'ws');
INSERT INTO public.galaxy VALUES (5, 'srra', 46, 16.00, false, 'erfgrws');
INSERT INTO public.galaxy VALUES (6, 'srrtetta', 32, 78.00, false, 'erfgfffbs');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'sef', 4, 1.00, false, 'defe', 10);
INSERT INTO public.moon VALUES (3, 'fsef', 4, 1.00, false, 'defe', 11);
INSERT INTO public.moon VALUES (4, 'fgsef', 4, 1.00, false, 'defe', 12);
INSERT INTO public.moon VALUES (5, 'fgsgef', 4, 1.00, false, 'defe', 13);
INSERT INTO public.moon VALUES (6, 'fgggef', 4, 1.00, false, 'defe', 14);
INSERT INTO public.moon VALUES (7, 'fggggef', 4, 1.00, false, 'defe', 15);
INSERT INTO public.moon VALUES (8, 'fgggghef', 4, 1.00, false, 'defe', 16);
INSERT INTO public.moon VALUES (9, 'fggggghef', 4, 1.00, false, 'defe', 17);
INSERT INTO public.moon VALUES (10, 'fgggggghef', 4, 1.00, false, 'defe', 18);
INSERT INTO public.moon VALUES (11, 'fggggggghef', 4, 1.00, false, 'defe', 19);
INSERT INTO public.moon VALUES (12, 'fgggggggghef', 4, 1.00, false, 'defe', 20);
INSERT INTO public.moon VALUES (13, 'fggggggggghef', 4, 1.00, false, 'defe', 21);
INSERT INTO public.moon VALUES (15, 'fggggggggggghef', 4, 1.00, false, 'defe', 10);
INSERT INTO public.moon VALUES (16, 'fgggggggggggghef', 4, 1.00, false, 'defe', 11);
INSERT INTO public.moon VALUES (17, 'fggggggggggggghef', 4, 1.00, false, 'defe', 12);
INSERT INTO public.moon VALUES (18, 'fgggggggggggggghef', 4, 1.00, false, 'defe', 15);
INSERT INTO public.moon VALUES (19, 'fggggggggggggggghef', 4, 1.00, false, 'defe', 16);
INSERT INTO public.moon VALUES (20, 'fgggggggggggggggghef', 4, 1.00, false, 'defe', 17);
INSERT INTO public.moon VALUES (21, 'fggggggggggggggggghef', 4, 1.00, false, 'defe', 18);
INSERT INTO public.moon VALUES (22, 'fgggggggggggggggghghef', 4, 1.00, false, 'defe', 18);
INSERT INTO public.moon VALUES (23, 'fgggggggggghgggggghghef', 4, 1.00, false, 'defe', 19);
INSERT INTO public.moon VALUES (24, 'fgggggggggghggggjgghghef', 4, 1.00, false, 'defe', 20);
INSERT INTO public.moon VALUES (25, 'fgggggggggghggggjgghgghef', 4, 1.00, false, 'defe', 21);
INSERT INTO public.moon VALUES (26, 'fgggggggggghghgggjgghgghef', 4, 1.00, false, 'defe', 12);


--
-- Data for Name: peoples_fav; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.peoples_fav VALUES ('micrf', 5, NULL, NULL, 1);
INSERT INTO public.peoples_fav VALUES ('ef', 6, NULL, NULL, 2);
INSERT INTO public.peoples_fav VALUES ('efe', 7, NULL, NULL, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (10, 'mercity', 3, 5.00, false, 'efef', 2);
INSERT INTO public.planet VALUES (11, 'venus', 2, 5.00, true, 'rf', 5);
INSERT INTO public.planet VALUES (12, 'earth', 5, 6.00, true, 'efe', 5);
INSERT INTO public.planet VALUES (13, 'mars', 7, 2.00, false, 'ee', 6);
INSERT INTO public.planet VALUES (14, 'Jupiter', 4, 10.00, true, 'reefc', 2);
INSERT INTO public.planet VALUES (15, 'saturn', 4, 1.00, true, 'eeggtt', 5);
INSERT INTO public.planet VALUES (16, 'uranus', 6, 8.00, true, 'rgd', 2);
INSERT INTO public.planet VALUES (17, 'neptune', 7, 2.00, true, 'bb', 2);
INSERT INTO public.planet VALUES (18, 'pluto', 6, 9.00, false, 'cvv', 7);
INSERT INTO public.planet VALUES (19, 'efsee', 5, 7.00, true, 'refe', 4);
INSERT INTO public.planet VALUES (20, 'efseere', 5, 7.00, true, 'raaefe', 1);
INSERT INTO public.planet VALUES (21, 'efseereeeeeeeeeeeeeeeeeeeeee', 5, 7.00, true, 'raaedfe', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'srrterrgetta', 532, 748.00, true, 'eerrrrfgfffbs', 1);
INSERT INTO public.star VALUES (6, 'sadf ', 8, 7.00, true, 'ejjassssssssssssts', 2);
INSERT INTO public.star VALUES (7, 'sadttf ', 8, 9.00, false, 'ejjasssdddds', 2);
INSERT INTO public.star VALUES (8, 'sadrtgeff ', 8, 9.00, false, 'ejjasstygs', 2);
INSERT INTO public.star VALUES (5, 'srppppa', 52, 9.00, true, 'ejjtyhryjyhyts', 3);
INSERT INTO public.star VALUES (4, 'srrterta', 72, 7.00, true, 'ejjtyhs', 4);
INSERT INTO public.star VALUES (2, 'srrterrgeterta', 432, 68.00, true, 'ejjyjkrfgfffbs', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: peoples_fav_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.peoples_fav_people_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: peoples_fav peoples_fav_people_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.peoples_fav
    ADD CONSTRAINT peoples_fav_people_id_key UNIQUE (peoples_fav_id);


--
-- Name: peoples_fav peoples_fav_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.peoples_fav
    ADD CONSTRAINT peoples_fav_pkey PRIMARY KEY (peoples_fav_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

