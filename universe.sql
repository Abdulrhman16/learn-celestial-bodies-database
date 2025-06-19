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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character varying(3) NOT NULL,
    family character varying(50),
    area_in_sq_degrees integer NOT NULL,
    is_official boolean DEFAULT true,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_billions_of_years numeric(4,2) NOT NULL,
    diameter_in_kly integer,
    mass_in_solar_masses integer,
    has_active_nucleus boolean,
    is_spherical boolean,
    description text
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
    name character varying(100) NOT NULL,
    diameter_in_km integer NOT NULL,
    orbital_period_days numeric(10,4) NOT NULL,
    discovery_year integer,
    is_tidally_locked boolean DEFAULT true,
    has_atmosphere boolean,
    description text
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
    name character varying(100) NOT NULL,
    planet_type character varying(50) NOT NULL,
    mass_in_earth_masses numeric(10,3),
    diameter_in_km integer,
    orbital_period_days numeric(12,4) NOT NULL,
    has_atmosphere boolean,
    is_habitable boolean,
    discovery_year integer,
    description text
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
    name character varying(100) NOT NULL,
    spectral_type character varying(20) NOT NULL,
    temperature_kelvin integer,
    luminosity_in_solar_units numeric(10,2),
    mass_in_solar_masses numeric(6,3) NOT NULL,
    age_in_millions_of_years integer,
    is_variable boolean,
    has_planetary_system boolean,
    description text
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'Orion', 594, true, 'The Hunter, contains Betelgeuse and Rigel');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 'UMa', 'Ursa Major', 1280, true, 'The Great Bear, contains Big Dipper');
INSERT INTO public.constellation VALUES (3, 'Scorpius', 'Sco', 'Zodiac', 497, true, 'The Scorpion, contains Antares');
INSERT INTO public.constellation VALUES (4, 'Centaurus', 'Cen', 'Hercules', 1060, true, 'The Centaur, contains Alpha Centauri');
INSERT INTO public.constellation VALUES (5, 'Andromeda', 'And', 'Perseus', 722, true, 'Princess Andromeda, contains Andromeda Galaxy');
INSERT INTO public.constellation VALUES (6, 'Lyra', 'Lyr', 'Hercules', 286, true, 'The Lyre, contains Vega');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 13.61, 105, 1500, true, false, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.01, 220, 1200, true, false, 'M31, nearest spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10.00, 60, 50, false, false, 'M33, third largest in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 12.00, 240, 2600, true, true, 'Famous for supermassive black hole');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 12.50, 49, 800, true, false, 'Edge-on spiral with large bulge');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 4.00, 14, 10, false, false, 'Satellite galaxy of Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 3474, 27.3217, NULL, true, false, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 5, 'Io', 3643, 1.7691, 1610, true, false, 'Most volcanically active body in Solar System');
INSERT INTO public.moon VALUES (3, 5, 'Europa', 3121, 3.5512, 1610, true, false, 'Potential subsurface ocean');
INSERT INTO public.moon VALUES (4, 5, 'Ganymede', 5268, 7.1546, 1610, true, false, 'Largest moon in Solar System');
INSERT INTO public.moon VALUES (5, 5, 'Callisto', 4820, 16.6890, 1610, true, false, 'Most heavily cratered object');
INSERT INTO public.moon VALUES (6, 6, 'Mimas', 396, 0.9420, 1789, true, false, 'Looks like Death Star');
INSERT INTO public.moon VALUES (7, 6, 'Enceladus', 504, 1.3700, 1789, true, false, 'Geysers of water vapor');
INSERT INTO public.moon VALUES (8, 6, 'Tethys', 1062, 1.8880, 1684, true, false, 'Large Ithaca Chasma');
INSERT INTO public.moon VALUES (9, 6, 'Dione', 1123, 2.7370, 1684, true, false, 'Wispy terrain');
INSERT INTO public.moon VALUES (10, 6, 'Rhea', 1527, 4.5180, 1672, true, false, 'Second largest moon of Saturn');
INSERT INTO public.moon VALUES (11, 6, 'Titan', 5149, 15.9450, 1655, true, true, 'Only moon with thick atmosphere');
INSERT INTO public.moon VALUES (12, 6, 'Iapetus', 1469, 79.3220, 1671, true, false, 'Two-toned coloration');
INSERT INTO public.moon VALUES (13, 7, 'Miranda', 471, 1.4130, 1948, true, false, 'Most extreme topography');
INSERT INTO public.moon VALUES (14, 7, 'Ariel', 1158, 2.5200, 1851, true, false, 'Brightest moon of Uranus');
INSERT INTO public.moon VALUES (15, 7, 'Umbriel', 1169, 4.1440, 1851, true, false, 'Darkest moon of Uranus');
INSERT INTO public.moon VALUES (16, 7, 'Titania', 1577, 8.7060, 1787, true, false, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (17, 7, 'Oberon', 1522, 13.4630, 1787, true, false, 'Most heavily cratered Uranian moon');
INSERT INTO public.moon VALUES (18, 8, 'Triton', 2706, 5.8770, 1846, true, true, 'Only large moon with retrograde orbit');
INSERT INTO public.moon VALUES (19, 8, 'Proteus', 420, 1.1220, 1989, true, false, 'Largest irregular moon');
INSERT INTO public.moon VALUES (20, 4, 'Phobos', 22, 0.3190, 1877, true, false, 'Closer to primary than any other moon');
INSERT INTO public.moon VALUES (21, 4, 'Deimos', 12, 1.2630, 1877, true, false, 'Smaller outer moon of Mars');
INSERT INTO public.moon VALUES (22, 13, 'Charon', 1212, 6.3870, 1978, true, false, 'Largest relative to its primary');
INSERT INTO public.moon VALUES (23, 13, 'Nix', 42, 24.8560, 2005, true, false, 'Small moon of Pluto');
INSERT INTO public.moon VALUES (24, 13, 'Hydra', 55, 38.2020, 2005, true, false, 'Outermost moon of Pluto');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', 0.055, 4879, 87.9691, false, false, 1610, 'Smallest planet in Solar System');
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', 0.815, 12104, 224.7010, true, false, 1610, 'Hottest planet with runaway greenhouse effect');
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', 1.000, 12742, 365.2560, true, true, NULL, 'Our home planet');
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', 0.107, 6779, 686.9800, true, false, 1610, 'The Red Planet');
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', 317.800, 139820, 4332.5890, true, false, 1610, 'Largest planet in Solar System');
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant', 95.159, 116460, 10759.2200, true, false, 1610, 'Known for its ring system');
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', 14.536, 50724, 30687.1500, true, false, 1781, 'Tilted on its side');
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice Giant', 17.147, 49244, 60190.0300, true, false, 1846, 'Windiest planet');
INSERT INTO public.planet VALUES (9, 2, 'Sirius b', 'White Dwarf', 1.018, 12000, 50.1280, false, false, 1862, 'First white dwarf discovered');
INSERT INTO public.planet VALUES (10, 3, 'Proxima Centauri b', 'Super Earth', 1.270, NULL, 11.1860, true, true, 2016, 'Closest known exoplanet to Earth');
INSERT INTO public.planet VALUES (11, 3, 'Alpha Centauri Bb', 'Super Earth', 1.130, NULL, 3.2360, true, false, 2012, 'Disputed exoplanet detection');
INSERT INTO public.planet VALUES (12, 5, 'Andromeda b', 'Gas Giant', 650.000, NULL, 241.2300, true, false, 2009, 'Hypothetical massive exoplanet');
INSERT INTO public.planet VALUES (13, 1, 'Pluto', 'Dwarf Planet', 0.002, 2376, 90560.0000, true, false, 1930, 'Former ninth planet');
INSERT INTO public.planet VALUES (14, 6, 'Vega b', 'Gas Giant', 9.800, NULL, 56.5000, true, false, 2021, 'Candidate exoplanet around Vega');
INSERT INTO public.planet VALUES (15, 7, 'Proxima Centauri c', 'Super Earth', 7.000, NULL, 1928.0000, false, false, 2019, 'Cold super-Earth in habitable zone');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G2V', 5778, 1.00, 1.000, 4600, false, true, 'Our solar system star');
INSERT INTO public.star VALUES (2, 1, 'Sirius', 'A1V', 9940, 25.40, 2.063, 242, false, true, 'Brightest star in night sky');
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri A', 'G2V', 5790, 1.52, 1.100, 4850, false, true, 'Closest star system to Sun');
INSERT INTO public.star VALUES (4, 1, 'Betelgeuse', 'M1-2Ia-ab', 3600, 126000.00, 11.600, 8, true, false, 'Red supergiant in Orion');
INSERT INTO public.star VALUES (5, 2, 'Alpheratz', 'B8IVp', 13800, 200.00, 3.800, 60, true, false, 'Brightest star in Andromeda');
INSERT INTO public.star VALUES (6, 1, 'Vega', 'A0V', 9602, 40.12, 2.135, 455, false, true, 'Fifth brightest star in night sky');
INSERT INTO public.star VALUES (7, 1, 'Proxima Centauri', 'M5.5Ve', 3050, 0.00, 0.122, 4850, true, true, 'Closest known star to Sun');
INSERT INTO public.star VALUES (8, 3, 'M33-013406.63', 'O8V', 38000, 100000.00, 25.000, 10, false, false, 'Massive star in Triangulum');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

