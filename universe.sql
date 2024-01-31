--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,3),
    distance_from_earth integer,
    galaxy_types integer
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
    name character varying(60) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    planet_id integer,
    age_in_millions_of_years numeric(5,3),
    distance_from_earth integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    star_id integer,
    age_in_millions_of_years numeric(5,3),
    distance_from_earth integer,
    planet_types integer
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    distance_from_earth integer,
    name character varying(60) NOT NULL,
    solar_system_id integer NOT NULL
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    galaxy_id integer,
    age_in_millions_of_years numeric(5,3),
    distance_from_earth integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'cool galaxy', 23.234, 192817922, 1);
INSERT INTO public.galaxy VALUES (2, 'Milky way', 'home', 54.234, 0, 2);
INSERT INTO public.galaxy VALUES (3, 'Gold eye', 'invented', 12.332, 4234102, 2);
INSERT INTO public.galaxy VALUES (4, 'Whirrpool', 'dont know', 33.234, 52897343, 1);
INSERT INTO public.galaxy VALUES (5, 'Magellanic', 'no idea', 23.320, 59237832, 2);
INSERT INTO public.galaxy VALUES (6, 'Comet galaxy', 'no idea', 34.320, 29372837, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'sdjfs', 'sdjgiesdg', false, true, 2, 20.340, 28939327);
INSERT INTO public.moon VALUES (2, 'skgjls', 'wiefwo', false, true, 1, 54.232, 49583582);
INSERT INTO public.moon VALUES (3, 'eiowfj', 'eioeg', false, true, 3, 54.234, 235729387);
INSERT INTO public.moon VALUES (4, 'eifwoe', 'rigeorgnv', false, true, 4, 43.235, 35972837);
INSERT INTO public.moon VALUES (5, 'qpwfjgwjlf', 'sdjgiesdg', false, true, 2, 20.340, 28939327);
INSERT INTO public.moon VALUES (6, 'iwojgwpgjr', 'wiefwo', false, true, 1, 54.232, 49583582);
INSERT INTO public.moon VALUES (7, 'sdhgoieo', 'eioeg', false, true, 3, 54.234, 235729387);
INSERT INTO public.moon VALUES (8, 'ieowgjd', 'rigeorgnv', false, true, 4, 43.235, 35972837);
INSERT INTO public.moon VALUES (9, 'wiogierjgofj', 'sdjgiesdg', false, true, 2, 20.340, 28939327);
INSERT INTO public.moon VALUES (10, 'qopwrieor', 'wiefwo', false, true, 1, 54.232, 49583582);
INSERT INTO public.moon VALUES (11, 'wieofji', 'eioeg', false, true, 3, 54.234, 235729387);
INSERT INTO public.moon VALUES (12, 'weoogrejig', 'rigeorgnv', false, true, 4, 43.235, 35972837);
INSERT INTO public.moon VALUES (13, 'wiowefewgierjgofj', 'sdjgiesdg', false, true, 2, 20.340, 28939327);
INSERT INTO public.moon VALUES (14, 'qorthpwrieor', 'wiefwo', false, true, 1, 54.232, 49583582);
INSERT INTO public.moon VALUES (15, 'wiwereofji', 'eioeg', false, true, 3, 54.234, 235729387);
INSERT INTO public.moon VALUES (16, 'weoogdfrejig', 'rigeorgnv', false, true, 4, 43.235, 35972837);
INSERT INTO public.moon VALUES (17, 'qowhfkldsk', 'sdjgiesdg', false, true, 2, 20.340, 28939327);
INSERT INTO public.moon VALUES (18, 'qorqpfjdlksjljde', 'wiefwo', false, true, 1, 54.232, 49583582);
INSERT INTO public.moon VALUES (19, 'qpjfodlk', 'eioeg', false, true, 3, 54.234, 235729387);
INSERT INTO public.moon VALUES (20, 'wwojfpwgfj', 'rigeorgnv', false, true, 4, 43.235, 35972837);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'we live here', true, 1, 45.234, 0, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 'here is  bad', false, 1, 46.234, 324, 2);
INSERT INTO public.planet VALUES (3, 'Mars', 'here is not so bad', false, 1, 48.430, 342, 3);
INSERT INTO public.planet VALUES (4, 'Venus', 'sdsdfd', false, 1, 35.430, 543, 2);
INSERT INTO public.planet VALUES (5, 'jupiter', 'sdfsfdsf', false, 1, 45.320, 4345, 2);
INSERT INTO public.planet VALUES (6, 'saturn', 'adjfhskd', false, 1, 45.540, 3453, 2);
INSERT INTO public.planet VALUES (7, 'neptun', 'kldjgldf', false, 1, 54.000, 54343, 2);
INSERT INTO public.planet VALUES (8, 'uranus', 'urtwoien', false, 1, 55.000, 34546, 2);
INSERT INTO public.planet VALUES (9, 'pluto', 'itoqqdpfv', false, 1, 54.000, 2546, 2);
INSERT INTO public.planet VALUES (10, 'wheegl', 'rigeonv', false, 1, 34.000, 3454, 1);
INSERT INTO public.planet VALUES (11, 'gironrow', 'ghowiep', false, 2, 56.000, 1232, 3);
INSERT INTO public.planet VALUES (12, 'pwjfwoe', 'eiqoeinwi', false, 3, 43.000, 1234, 4);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 2, 54, 'ioerjgj', 1);
INSERT INTO public.solar_system VALUES (2, 1, 45, 'girgeoj', 2);
INSERT INTO public.solar_system VALUES (3, 5, 564, 'eorgirgjg', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'whatever', 2, 22.450, 5400000);
INSERT INTO public.star VALUES (2, 'Some Star', 'whatever', 1, 56.230, 2359872);
INSERT INTO public.star VALUES (3, 'Another star', 'somewhere', 2, 34.430, 53875433);
INSERT INTO public.star VALUES (4, 'Fascinating', 'no idea', 2, 44.234, 32783334);
INSERT INTO public.star VALUES (5, 'Cool', 'whatever', 1, 54.545, 348758347);
INSERT INTO public.star VALUES (6, 'Red giant', 'very hot in there', 1, 34.345, 247538728);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: solar_system solar_system_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: solar_system solar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_name_key UNIQUE (name);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


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
-- Name: solar_system solar_system_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: solar_system solar_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

