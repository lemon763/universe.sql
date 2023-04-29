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
    name character varying(255) NOT NULL,
    age integer,
    size numeric(10,2),
    has_blackhole boolean,
    has_life boolean DEFAULT false NOT NULL
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
    name character varying(255) NOT NULL,
    mass numeric(10,2) NOT NULL,
    temperature integer,
    has_atmosphere boolean DEFAULT false NOT NULL,
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
-- Name: moon_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_type (
    moon_type_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.moon_type OWNER TO freecodecamp;

--
-- Name: moon_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_type_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_type_type_id_seq OWNER TO freecodecamp;

--
-- Name: moon_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_type_type_id_seq OWNED BY public.moon_type.moon_type_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass numeric(10,2) NOT NULL,
    radius integer,
    is_habitable boolean DEFAULT false NOT NULL,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass numeric(10,2) NOT NULL,
    luminosity integer,
    is_main_sequence boolean DEFAULT true NOT NULL,
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
-- Name: moon_type moon_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type ALTER COLUMN moon_type_id SET DEFAULT nextval('public.moon_type_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 60000, 220.00, true, false);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 130000, 100.00, true, true);
INSERT INTO public.galaxy VALUES (3, 'IC 1101', 13000, 60.00, true, false);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 40000, 50.00, false, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 12000, 10.00, true, false);
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 6000, 30.00, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 7.34, -153, false, 13);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.15, -20, false, 21);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.47, -40, false, 22);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1.19, -160, true, 23);
INSERT INTO public.moon VALUES (5, 'Europa', 0.83, -220, true, 23);
INSERT INTO public.moon VALUES (6, 'Io', 0.93, 90, true, 13);
INSERT INTO public.moon VALUES (7, 'Callisto', 1.06, -120, true, 17);
INSERT INTO public.moon VALUES (8, 'Titan', 1.35, -180, true, 14);
INSERT INTO public.moon VALUES (9, 'Rhea', 0.23, -195, true, 15);
INSERT INTO public.moon VALUES (10, 'Dione', 0.12, -220, false, 19);
INSERT INTO public.moon VALUES (11, 'Tethys', 0.62, -187, false, 20);
INSERT INTO public.moon VALUES (12, 'Enceladus', 0.01, -200, true, 22);
INSERT INTO public.moon VALUES (13, 'Mimas', 0.48, -200, false, 16);
INSERT INTO public.moon VALUES (14, 'Hyperion', 0.68, -180, true, 15);
INSERT INTO public.moon VALUES (15, 'Iapetus', 1.05, -180, false, 14);
INSERT INTO public.moon VALUES (16, 'Miranda', 0.69, -187, true, 18);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1.27, -220, false, 23);
INSERT INTO public.moon VALUES (18, 'Ariel', 1.35, -170, true, 14);
INSERT INTO public.moon VALUES (19, 'Oberon', 3.01, -200, true, 15);
INSERT INTO public.moon VALUES (20, 'Titania', 3.98, -190, true, 16);


--
-- Data for Name: moon_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_type VALUES (1, 'Gas giant moons', 'Moons that orbit gas giants');
INSERT INTO public.moon_type VALUES (2, 'Terrestrial moons', 'Moons that orbit terrestrial planets');
INSERT INTO public.moon_type VALUES (3, 'Dwarf planet moons', 'Moons that orbit dwarf planets');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 0.06, 2440, false, 5);
INSERT INTO public.planet VALUES (14, 'Venus', 0.82, 6052, false, 3);
INSERT INTO public.planet VALUES (15, 'Earth', 1.00, 6371, true, 2);
INSERT INTO public.planet VALUES (16, 'Mars', 0.11, 3390, false, 6);
INSERT INTO public.planet VALUES (17, 'Saturn', 95.16, 58232, false, 4);
INSERT INTO public.planet VALUES (18, 'Uranus', 14.54, 25362, false, 1);
INSERT INTO public.planet VALUES (19, 'Neptune', 17.15, 24622, false, 3);
INSERT INTO public.planet VALUES (20, 'Pluto', 0.00, 1185, false, 2);
INSERT INTO public.planet VALUES (21, 'Kepler-22b', 0.03, 0, true, 1);
INSERT INTO public.planet VALUES (22, 'HD 209458 b', 0.69, 1, false, 4);
INSERT INTO public.planet VALUES (23, 'WASP-12b', 1.40, 2, false, 6);
INSERT INTO public.planet VALUES (24, 'TRAPPIST-1d', 0.00, 1, true, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.99, 3828000, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 0.12, 15000, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 17.50, 95000, false, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 2.06, 20200, true, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1.10, 150000, true, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 0.91, 94000, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_type_type_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: moon_type moon_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_name_key UNIQUE (name);


--
-- Name: moon_type moon_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_pkey PRIMARY KEY (moon_type_id);


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

