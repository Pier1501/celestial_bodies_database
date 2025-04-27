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
    name character varying(40) NOT NULL,
    planets_number integer NOT NULL,
    stars_number integer NOT NULL,
    diameter_in_km numeric(10,4),
    description text NOT NULL,
    is_dwarf boolean,
    has_black_holes boolean
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
    name character varying(40) NOT NULL,
    discovery_year integer,
    craters_number integer,
    diameter_in_km numeric(10,4),
    description text NOT NULL,
    is_dwarf boolean,
    orbits_gas_giant boolean,
    planet_id integer,
    planets_system_id integer
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
    name character varying(40) NOT NULL,
    satellites_number integer,
    discovery_year integer,
    diameter_in_km numeric(10,4),
    description text NOT NULL,
    has_rings boolean,
    is_dwarf boolean,
    star_id integer,
    planets_system_id integer
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
-- Name: planets_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_system (
    planets_system_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discovery_year integer,
    planets_number integer,
    moons_number integer,
    description text NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.planets_system OWNER TO freecodecamp;

--
-- Name: planets_system_planets_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_system_planets_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_system_planets_system_id_seq OWNER TO freecodecamp;

--
-- Name: planets_system_planets_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_system_planets_system_id_seq OWNED BY public.planets_system.planets_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mk_luminosity_class integer,
    discovery_year integer,
    temperature_in_kelvin numeric(10,2),
    description text NOT NULL,
    is_human_visible boolean,
    is_in_cluster boolean,
    star_class character(1),
    galaxy_id integer,
    planets_system_id integer
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
-- Name: planets_system planets_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_system ALTER COLUMN planets_system_id SET DEFAULT nextval('public.planets_system_planets_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000, 250000000, 105700.0000, 'Our home galaxy, a barred spiral galaxy.', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, 1000000000, 220000.0000, 'Largest galaxy in the Local Group, spiral galaxy.', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000000, 400000000, 60000.0000, 'Third-largest member of the Local Group, spiral galaxy.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 10000000, 300000000, 14000.0000, 'Satellite dwarf galaxy of the Milky Way.', true, true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 3000000, 300000000, 7000.0000, 'Dwarf irregular galaxy near the Milky Way.', true, false);
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf', 1000000, 100000000, 5000.0000, 'Disputed irregular galaxy, closest to Milky Way center.', true, false);
INSERT INTO public.galaxy VALUES (7, 'Sculptor Dwarf Galaxy', 500000, 50000000, 3000.0000, 'Dwarf spheroidal galaxy, satellite of the Milky Way.', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 300000, 3474.8000, 'Earths only natural satellite.', false, false, 3, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 100, 22.5300, 'Inner, larger moon of Mars, irregular shape.', false, false, 4, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 2, 12.4000, 'Outer, smaller moon of Mars, irregular shape.', false, false, 4, 1);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 400, 3643.2000, 'Most volcanically active body in the Solar System (orbits Jupiter).', false, true, 5, 1);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 50, 3121.6000, 'Icy moon of Jupiter, suspected subsurface ocean.', false, true, 5, 1);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 1000, 5268.2000, 'Largest moon in the Solar System (orbits Jupiter).', false, true, 5, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 100000, 4820.6000, 'Heavily cratered moon of Jupiter.', false, true, 5, 1);
INSERT INTO public.moon VALUES (8, 'Titan', 1655, 150, 5149.5000, 'Largest moon of Saturn, thick atmosphere, liquid methane lakes.', false, true, 6, 1);
INSERT INTO public.moon VALUES (9, 'Rhea', 1672, 500, 1527.6000, 'Second largest moon of Saturn, icy body.', false, true, 6, 1);
INSERT INTO public.moon VALUES (10, 'Iapetus', 1671, 300, 1469.0000, 'Saturnian moon with a distinctive two-tone coloration.', false, true, 6, 1);
INSERT INTO public.moon VALUES (11, 'Enceladus', 1789, 200, 504.2000, 'Saturnian moon with geysers erupting from subsurface ocean.', false, true, 6, 1);
INSERT INTO public.moon VALUES (12, 'Mimas', 1789, 75, 396.4000, 'Saturnian moon dominated by the large Herschel crater.', false, true, 6, 1);
INSERT INTO public.moon VALUES (13, 'Titania', 1787, 100, 1576.8000, 'Largest moon of Uranus.', false, true, 7, 1);
INSERT INTO public.moon VALUES (14, 'Oberon', 1787, 120, 1522.8000, 'Outer major moon of Uranus, heavily cratered.', false, true, 7, 1);
INSERT INTO public.moon VALUES (15, 'Miranda', 1948, 40, 471.6000, 'Uranian moon with extreme and varied geology.', false, true, 7, 1);
INSERT INTO public.moon VALUES (16, 'Triton', 1846, 80, 2706.8000, 'Largest moon of Neptune, retrograde orbit, geologically active.', false, true, 8, 1);
INSERT INTO public.moon VALUES (17, 'Nereid', 1949, 10, 340.0000, 'Neptunian moon with one of the most eccentric orbits.', false, true, 8, 1);
INSERT INTO public.moon VALUES (18, 'Proteus', 1989, 30, 420.0000, 'Second-largest Neptunian moon, irregular shape.', false, true, 8, 1);
INSERT INTO public.moon VALUES (19, 'Andromeda Prime Ia', 2088, 5, 50.0000, 'Small inner moon of Andromeda Prime I.', false, false, 10, 2);
INSERT INTO public.moon VALUES (20, 'Andromeda Prime IIa (Gigas)', 2088, 500, 2500.0000, 'Large moon orbiting the gas giant Andromeda Prime II.', false, true, 11, 2);
INSERT INTO public.moon VALUES (21, 'Andromeda Prime IIb', 2088, 20, 300.0000, 'Smaller captured asteroid moon of Andromeda Prime II.', false, true, 11, 2);
INSERT INTO public.moon VALUES (22, 'Triangulum Minor Alpha 1', 2105, 15, 150.0000, 'Icy moonlet orbiting Triangulum Minor Alpha.', false, false, 12, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, NULL, 4879.4000, 'Innermost planet, rocky, no atmosphere.', false, false, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, NULL, 12103.6000, 'Second planet, thick CO2 atmosphere, very hot.', false, false, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, NULL, 12742.0000, 'Our home planet, harbors life.', false, false, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, NULL, 6779.0000, 'The red planet, thin atmosphere, potential past life.', false, false, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 95, 1610, 139820.0000, 'Largest planet, gas giant with Great Red Spot.', true, false, 1, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 146, 1610, 116460.0000, 'Gas giant known for its prominent ring system.', true, false, 1, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 1781, 50724.0000, 'Ice giant, tilted on its side.', true, false, 1, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 1846, 49244.0000, 'Ice giant, blue, strong winds.', true, false, 1, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 0, 2016, 14000.0000, 'Exoplanet orbiting Proxima Centauri in the habitable zone.', false, false, 2, 1);
INSERT INTO public.planet VALUES (10, 'Andromeda Prime I', 3, 2088, 15000.0000, 'Rocky inner planet in the Andromeda Prime system.', false, false, 5, 2);
INSERT INTO public.planet VALUES (11, 'Andromeda Prime II', 5, 2088, 60000.0000, 'Gas giant in the Andromeda Prime system.', true, false, 5, 2);
INSERT INTO public.planet VALUES (12, 'Triangulum Minor Alpha', 1, 2105, 8000.0000, 'Small, cold planet in the Triangulum Minor system.', false, false, 6, 3);
INSERT INTO public.planet VALUES (13, 'Kepler-90b', 0, 2013, 16765.0000, 'Super-Earth exoplanet in Kepler-90 system.', false, false, 7, 4);
INSERT INTO public.planet VALUES (14, 'Kepler-90h', 0, 2013, 128694.0000, 'Gas giant exoplanet in Kepler-90 system.', false, false, 7, 4);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1e', 0, 2017, 11744.0000, 'Earth-sized exoplanet in the habitable zone of TRAPPIST-1.', false, false, 8, 5);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1f', 0, 2017, 13294.0000, 'Potentially water-rich exoplanet in TRAPPIST-1 system.', false, false, 8, 5);


--
-- Data for Name: planets_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_system VALUES (1, 'Solar System', NULL, 8, 290, 'Our home planetary system centered around the Sun.', 1);
INSERT INTO public.planets_system VALUES (2, 'Andromeda Prime System', 2088, 5, 15, 'A hypothetical system in the Andromeda Galaxy near its core.', 2);
INSERT INTO public.planets_system VALUES (3, 'Triangulum Minor System', 2105, 3, 4, 'A small system discovered in the outer arms of Triangulum.', 3);
INSERT INTO public.planets_system VALUES (4, 'Kepler-90 System', 2013, 8, 0, 'System with 8 known exoplanets orbiting Kepler-90 star.', 1);
INSERT INTO public.planets_system VALUES (5, 'TRAPPIST-1 System', 2016, 7, 0, 'System of seven Earth-sized planets orbiting an ultra-cool dwarf star.', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5, NULL, 5778.00, 'The G-type main-sequence star at the center of the Solar System.', true, false, 'G', 1, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 5, 1915, 3042.00, 'Red dwarf star, closest known star to the Sun.', false, true, 'M', 1, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 5, NULL, 9940.00, 'Brightest star in the night sky, A-type main-sequence.', true, true, 'A', 1, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, NULL, 3500.00, 'Red supergiant in the constellation of Orion.', true, false, 'M', 1, NULL);
INSERT INTO public.star VALUES (5, 'Andromeda Prime Star', 3, 2088, 6500.00, 'F-type giant star hypothetically hosting the Andromeda Prime System.', false, false, 'F', 2, 2);
INSERT INTO public.star VALUES (6, 'Triangulum Minor Star', 5, 2105, 4200.00, 'K-type main-sequence star in the Triangulum Minor System.', false, false, 'K', 3, 3);
INSERT INTO public.star VALUES (7, 'Kepler-90', 5, 2013, 6080.00, 'G-type star hosting the Kepler-90 system.', false, false, 'G', 1, 4);
INSERT INTO public.star VALUES (8, 'TRAPPIST-1', 6, 2015, 2566.00, 'Ultra-cool red dwarf star hosting the TRAPPIST-1 system.', false, false, 'M', 1, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: planets_system_planets_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_system_planets_system_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


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
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


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
-- Name: planets_system planets_system_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_system
    ADD CONSTRAINT planets_system_description_key UNIQUE (description);


--
-- Name: planets_system planets_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_system
    ADD CONSTRAINT planets_system_name_key UNIQUE (name);


--
-- Name: planets_system planets_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_system
    ADD CONSTRAINT planets_system_pkey PRIMARY KEY (planets_system_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planets_system fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_system
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_planets_system; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planets_system FOREIGN KEY (planets_system_id) REFERENCES public.planets_system(planets_system_id);


--
-- Name: planet fk_planets_system; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planets_system FOREIGN KEY (planets_system_id) REFERENCES public.planets_system(planets_system_id);


--
-- Name: star fk_planets_system; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_planets_system FOREIGN KEY (planets_system_id) REFERENCES public.planets_system(planets_system_id);


--
-- Name: planet fk_str; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_str FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

