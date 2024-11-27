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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    distance_from_earth_million numeric NOT NULL,
    number_of_stars_billion integer NOT NULL,
    age_in_billions_of_years integer NOT NULL,
    has_black_hole boolean NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(100) NOT NULL,
    composition text NOT NULL,
    distance_from_planet numeric NOT NULL,
    radius integer NOT NULL,
    orbital_period integer NOT NULL,
    has_water boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    planet_type text NOT NULL,
    distance_from_star_million numeric NOT NULL,
    radius integer NOT NULL,
    orbital_period integer NOT NULL,
    has_life boolean NOT NULL,
    is_habitable boolean NOT NULL,
    star_id integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(100) NOT NULL,
    moon_id integer,
    function text NOT NULL,
    speed numeric NOT NULL,
    diameter integer NOT NULL,
    weight integer,
    is_active boolean NOT NULL,
    is_visible boolean NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_type text NOT NULL,
    brightness numeric NOT NULL,
    temperature integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    is_binary boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 100, 14, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2200, 100, 10, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000, 40, 12, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000, 30, 13, true, true);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elliptical', 55000, 200, 13, true, false);
INSERT INTO public.galaxy VALUES (6, 'NGC 224', 'Spiral', 150000, 50, 8, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Rock and Ice', 384400, 1737, 27, true, true, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 'Ice and Rock', 670900, 1560, 85, true, true, 2);
INSERT INTO public.moon VALUES (3, 'Titan', 'Ice and Rock', 1222000, 2575, 16, true, true, 3);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Ice and Rock', 1070000, 2631, 172, true, true, 4);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Ice and Rock', 1883000, 2410, 400, true, true, 5);
INSERT INTO public.moon VALUES (8, 'Io', 'Rock and Sulfur', 421800, 1822, 2, true, true, 4);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Ice and Rock', 185000, 396, 23, false, true, 5);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Ice and Rock', 238020, 252, 33, true, true, 5);
INSERT INTO public.moon VALUES (11, 'Triton', 'Ice and Rock', 354760, 1353, 6, true, true, 6);
INSERT INTO public.moon VALUES (12, 'Charon', 'Rock and Ice', 19575, 606, 6, true, true, 9);
INSERT INTO public.moon VALUES (13, 'Phobos', 'Rock and Dust', 9376, 11, 8, false, true, 2);
INSERT INTO public.moon VALUES (14, 'Deimos', 'Rock and Dust', 23460, 6, 30, false, true, 2);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Ice and Rock', 129000, 472, 1, true, true, 6);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Ice and Rock', 190900, 1158, 3, true, true, 6);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Ice and Rock', 266300, 585, 4, true, true, 6);
INSERT INTO public.moon VALUES (18, 'Titania', 'Ice and Rock', 435000, 788, 9, true, true, 6);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Ice and Rock', 582700, 761, 14, true, true, 6);
INSERT INTO public.moon VALUES (20, 'Hyperion', 'Ice and Rock', 1218000, 180, 21, true, true, 5);
INSERT INTO public.moon VALUES (21, 'Iapetus', 'Ice and Rock', 3561300, 735, 79, false, true, 5);
INSERT INTO public.moon VALUES (22, 'Rhea', 'Ice and Rock', 527108, 1528, 5, true, true, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Rocky', 149600, 6371, 365, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Rocky', 227900, 3389, 687, false, true, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 'Rocky', 108200, 6052, 225, false, false, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', 778300, 69911, 4333, false, false, 4);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas Giant', 1427000, 58232, 10759, false, false, 5);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice Giant', 2871000, 25362, 30687, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice Giant', 4497000, 24622, 60190, false, false, 2);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Rocky', 57900, 2439, 88, false, false, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 5906000, 1188, 90500, false, false, 4);
INSERT INTO public.planet VALUES (10, 'Titan', 'Moon', 12000, 2575, 15000, true, true, 5);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 'Rocky', 620, 2130, 290, false, true, 1);
INSERT INTO public.planet VALUES (13, 'Gliese 581g', 'Rocky', 20.3, 1480, 37, false, true, 2);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'GPS I', 1, 'Navigation', 3.9, 10, 1000, true, true);
INSERT INTO public.satellite VALUES (2, 'Hubble', 2, 'Space Telescope', 4.0, 12, 1100, true, true);
INSERT INTO public.satellite VALUES (3, 'Lunar Reconnaissance Orbiter', 1, 'Mapping', 5.2, 8, 500, true, true);
INSERT INTO public.satellite VALUES (4, 'MAVEN', 3, 'Atmospheric Research', 4.5, 7, 800, true, false);
INSERT INTO public.satellite VALUES (5, 'Juno', 4, 'Space Exploration', 4.8, 9, 1200, true, true);
INSERT INTO public.satellite VALUES (6, 'Mars Odyssey', 3, 'Space Exploration', 6.2, 11, 900, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Main Sequence', 25.4, 9940, 240, true, false, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 1.6, 3500, 8000, false, false, 2);
INSERT INTO public.star VALUES (3, 'Rigel', 'Blue Supergiant', 120.5, 11000, 8000, false, true, 3);
INSERT INTO public.star VALUES (4, 'Vega', 'Main Sequence', 40.1, 9600, 455, true, false, 1);
INSERT INTO public.star VALUES (5, 'Polaris', 'Supergiant', 2.2, 6015, 7000, false, true, 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 'Main Sequence', 5.5, 5790, 6000, true, false, 3);
INSERT INTO public.star VALUES (7, 'Altair', 'Main Sequence', 40.0, 8700, 1000, true, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite satellite_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

