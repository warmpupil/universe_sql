--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: clusters; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.clusters (
    clusters_id integer NOT NULL,
    name character varying(30) NOT NULL,
    cluster_coordinate character varying(100)
);


ALTER TABLE public.clusters OWNER TO freecodecamp;

--
-- Name: clusters_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.clusters_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: clusters_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.clusters_cluster_id_seq OWNED BY public.clusters.clusters_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types text NOT NULL,
    redshift double precision NOT NULL,
    distance double precision NOT NULL,
    axis_ratio numeric(3,1)
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass double precision,
    diameter double precision,
    is_spherical boolean
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_type text,
    mass double precision,
    radius double precision,
    age_million integer,
    is_life boolean
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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance double precision NOT NULL,
    mass double precision NOT NULL,
    age_million integer
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
-- Name: clusters clusters_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clusters ALTER COLUMN clusters_id SET DEFAULT nextval('public.clusters_cluster_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: clusters; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.clusters VALUES (1, 'local group', '中心位于银河系和仙女座星系之间');
INSERT INTO public.clusters VALUES (2, 'Virgo Cluster', 'RA 12h 28m 12.9s Dec 12° 23′ 49"');
INSERT INTO public.clusters VALUES (3, 'Coma Cluster', 'RA 13h 25m 11.6s Dec +12° 56′ 44″');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'NGC 1234', 'Spiral, Barred', 0.012, 50.2, 0.7);
INSERT INTO public.galaxy VALUES (2, 'M31', 'Spiral', 0.001, 0.78, 0.8);
INSERT INTO public.galaxy VALUES (3, 'M87', 'Elliptical', 0.004, 16.8, 0.3);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical, Radio', 0.0015, 3.8, 0.4);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Lenticular', 0.0009, 9.5, 0.2);
INSERT INTO public.galaxy VALUES (6, 'IC 1101', 'Elliptical', 0.031, 104, 0.1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'NGC1234-A1-I', 0.01, 3000, true);
INSERT INTO public.moon VALUES (2, 1, 'NGC1234-A1-II', 0.005, 2500, true);
INSERT INTO public.moon VALUES (3, 2, 'M31-X1-III', 0.02, 3500, true);
INSERT INTO public.moon VALUES (4, 2, 'M31-X1-IV', 0.015, 3000, true);
INSERT INTO public.moon VALUES (5, 3, 'M87-Z1-V', 0.03, 4000, true);
INSERT INTO public.moon VALUES (6, 3, 'M87-Z1-VI', 0.025, 3500, true);
INSERT INTO public.moon VALUES (7, 4, 'CenA-Q2-VII', 0.012, 2800, true);
INSERT INTO public.moon VALUES (8, 4, 'CenA-Q2-VIII', 0.008, 2500, true);
INSERT INTO public.moon VALUES (9, 5, 'Sombrero-R1-IX', 0.018, 3200, true);
INSERT INTO public.moon VALUES (10, 5, 'Sombrero-R1-X', 0.014, 3000, true);
INSERT INTO public.moon VALUES (11, 6, 'IC1101-T1-XI', 0.022, 3800, true);
INSERT INTO public.moon VALUES (12, 6, 'IC1101-T1-XII', 0.019, 3500, true);
INSERT INTO public.moon VALUES (13, 7, 'NGC1234-A1-XIII', 0.008, 2200, true);
INSERT INTO public.moon VALUES (14, 8, 'M31-X1-XIV', 0.01, 2800, true);
INSERT INTO public.moon VALUES (15, 9, 'M87-Z1-XV', 0.025, 3700, true);
INSERT INTO public.moon VALUES (16, 10, 'CenA-Q2-XVI', 0.015, 3200, true);
INSERT INTO public.moon VALUES (17, 11, 'Sombrero-R1-XVII', 0.02, 3400, true);
INSERT INTO public.moon VALUES (18, 12, 'IC1101-T1-XVIII', 0.018, 3300, true);
INSERT INTO public.moon VALUES (19, 3, 'M87-Z1-XIX', 0.01, 2500, false);
INSERT INTO public.moon VALUES (20, 6, 'IC1101-T1-XX', 0.005, 2000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'NGC1234-A1b', 'Terrestrial', 0.8, 0.9, 1000, false);
INSERT INTO public.planet VALUES (2, 1, 'NGC1234-A1c', 'Gas Giant', 317.8, 11.2, 1000, false);
INSERT INTO public.planet VALUES (3, 2, 'M31-X1d', 'Terrestrial', 1.2, 1.1, 1500, false);
INSERT INTO public.planet VALUES (4, 2, 'M31-X1e', 'Ice Giant', 14.5, 3.9, 1500, false);
INSERT INTO public.planet VALUES (5, 3, 'M87-Z1f', 'Gas Giant', 317.8, 10.2, 13000, false);
INSERT INTO public.planet VALUES (6, 3, 'M87-Z1g', 'Terrestrial', 0.6, 0.8, 13000, false);
INSERT INTO public.planet VALUES (7, 4, 'CenA-Q2h', 'Terrestrial', 0.9, 0.95, 600, false);
INSERT INTO public.planet VALUES (8, 4, 'CenA-Q2i', 'Gas Giant', 19.4, 5.2, 600, false);
INSERT INTO public.planet VALUES (9, 5, 'Sombrero-R1j', 'Terrestrial', 1.1, 1.05, 1100, false);
INSERT INTO public.planet VALUES (10, 5, 'Sombrero-R1k', 'Ice Giant', 17.2, 4.5, 1100, false);
INSERT INTO public.planet VALUES (11, 6, 'IC1101-T1l', 'Gas Giant', 317.8, 11.5, 12000, false);
INSERT INTO public.planet VALUES (12, 6, 'IC1101-T1m', 'Terrestrial', 0.7, 0.85, 12000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'NGC1234-A1', 4500, 1.2, 1000);
INSERT INTO public.star VALUES (2, 2, 'M31-X1', 2000, 2.5, 1500);
INSERT INTO public.star VALUES (3, 3, 'M87-Z1', 15000, 10, 13000);
INSERT INTO public.star VALUES (4, 4, 'CenA-Q2', 3000, 1.2, 600);
INSERT INTO public.star VALUES (5, 5, 'Sombrero-R1', 7500, 2, 1100);
INSERT INTO public.star VALUES (6, 6, 'IC1101-T1', 50000, 5, 12000);


--
-- Name: clusters_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.clusters_cluster_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: clusters clusters_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_name_key UNIQUE (name);


--
-- Name: clusters clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (clusters_id);


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

