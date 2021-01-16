--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14
-- Dumped by pg_dump version 10.14

-- Started on 2021-01-15 16:40:40

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
-- TOC entry 196 (class 1259 OID 18409)
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_actor_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 18411)
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actor_id integer DEFAULT nextval('public.actor_actor_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 18416)
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_address_id_seq OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 18418)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    address_id integer DEFAULT nextval('public.address_address_id_seq'::regclass) NOT NULL,
    address character varying(50) NOT NULL,
    address2 character varying(50),
    district character varying(20) NOT NULL,
    city_id smallint NOT NULL,
    postal_code character varying(10),
    phone character varying(20) NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 18423)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 18425)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer DEFAULT nextval('public.category_category_id_seq'::regclass) NOT NULL,
    name character varying(25) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18430)
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_city_id_seq OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18432)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    city_id integer DEFAULT nextval('public.city_city_id_seq'::regclass) NOT NULL,
    city character varying(50) NOT NULL,
    country_id smallint NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18437)
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_country_id_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18439)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    country_id integer DEFAULT nextval('public.country_country_id_seq'::regclass) NOT NULL,
    country character varying(50) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18444)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18446)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer DEFAULT nextval('public.customer_customer_id_seq'::regclass) NOT NULL,
    store_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    address_id smallint NOT NULL,
    activebool boolean DEFAULT true NOT NULL,
    active integer
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18453)
-- Name: film_film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_film_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18455)
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    film_id integer DEFAULT nextval('public.film_film_id_seq'::regclass) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_year integer,
    language_id smallint NOT NULL,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating character varying(255)
);


ALTER TABLE public.film OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18466)
-- Name: film_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_actor (
    actor_id integer NOT NULL,
    film_id integer NOT NULL
);


ALTER TABLE public.film_actor OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 18470)
-- Name: film_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_category (
    film_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.film_category OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18474)
-- Name: inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_inventory_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 18476)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    inventory_id integer DEFAULT nextval('public.inventory_inventory_id_seq'::regclass) NOT NULL,
    film_id smallint NOT NULL,
    store_id smallint NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18481)
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_language_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_language_id_seq OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18483)
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    language_id integer DEFAULT nextval('public.language_language_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.language OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18488)
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_payment_id_seq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18490)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer DEFAULT nextval('public.payment_payment_id_seq'::regclass) NOT NULL,
    customer_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    rental_id integer NOT NULL,
    amount numeric(5,2) NOT NULL,
    payment_date date NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18494)
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rental_rental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rental_rental_id_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18496)
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rental (
    rental_id integer DEFAULT nextval('public.rental_rental_id_seq'::regclass) NOT NULL,
    rental_date date NOT NULL,
    inventory_id integer NOT NULL,
    customer_id smallint NOT NULL,
    return_date date,
    staff_id smallint NOT NULL
);


ALTER TABLE public.rental OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18501)
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_staff_id_seq OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 18503)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id integer DEFAULT nextval('public.staff_staff_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id smallint NOT NULL,
    email character varying(50),
    store_id smallint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(40)
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18512)
-- Name: store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.store_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_store_id_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18514)
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    store_id integer DEFAULT nextval('public.store_store_id_seq'::regclass) NOT NULL,
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL
);


ALTER TABLE public.store OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 18411)
-- Dependencies: 197
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (actor_id, first_name, last_name) FROM stdin;
1	Penelope	Guiness
2	Nick	Wahlberg
3	Ed	Chase
4	Jennifer	Davis
5	Johnny	Lollobrigida
6	Bette	Nicholson
7	Grace	Mostel
8	Matthew	Johansson
9	Joe	Swank
10	Christian	Gable
11	Zero	Cage
12	Karl	Berry
13	Uma	Wood
14	Vivien	Bergen
15	Cuba	Olivier
16	Fred	Costner
17	Helen	Voight
18	Dan	Torn
19	Bob	Fawcett
20	Lucille	Tracy
21	Kirsten	Paltrow
22	Elvis	Marx
23	Sandra	Kilmer
24	Cameron	Streep
25	Kevin	Bloom
26	Rip	Crawford
27	Julia	Mcqueen
28	Woody	Hoffman
29	Alec	Wayne
30	Sandra	Peck
31	Sissy	Sobieski
32	Tim	Hackman
33	Milla	Peck
34	Audrey	Olivier
35	Judy	Dean
36	Burt	Dukakis
37	Val	Bolger
38	Tom	Mckellen
39	Goldie	Brody
40	Johnny	Cage
41	Jodie	Degeneres
42	Tom	Miranda
43	Kirk	Jovovich
44	Nick	Stallone
45	Reese	Kilmer
46	Parker	Goldberg
47	Julia	Barrymore
48	Frances	Day-Lewis
49	Anne	Cronyn
50	Natalie	Hopkins
51	Gary	Phoenix
52	Carmen	Hunt
53	Mena	Temple
54	Penelope	Pinkett
55	Fay	Kilmer
56	Dan	Harris
57	Jude	Cruise
58	Christian	Akroyd
59	Dustin	Tautou
60	Henry	Berry
61	Christian	Neeson
62	Jayne	Neeson
63	Cameron	Wray
64	Ray	Johansson
65	Angela	Hudson
66	Mary	Tandy
67	Jessica	Bailey
68	Rip	Winslet
69	Kenneth	Paltrow
70	Michelle	Mcconaughey
71	Adam	Grant
72	Sean	Williams
73	Gary	Penn
74	Milla	Keitel
75	Burt	Posey
76	Angelina	Astaire
77	Cary	Mcconaughey
78	Groucho	Sinatra
79	Mae	Hoffman
80	Ralph	Cruz
81	Scarlett	Damon
82	Woody	Jolie
83	Ben	Willis
84	James	Pitt
85	Minnie	Zellweger
143	River	Dean
86	Greg	Chaplin
87	Spencer	Peck
88	Kenneth	Pesci
89	Charlize	Dench
90	Sean	Guiness
91	Christopher	Berry
92	Kirsten	Akroyd
93	Ellen	Presley
94	Kenneth	Torn
95	Daryl	Wahlberg
96	Gene	Willis
97	Meg	Hawke
98	Chris	Bridges
99	Jim	Mostel
100	Spencer	Depp
101	Susan	Davis
102	Walter	Torn
103	Matthew	Leigh
104	Penelope	Cronyn
105	Sidney	Crowe
106	Groucho	Dunst
107	Gina	Degeneres
108	Warren	Nolte
109	Sylvester	Dern
110	Susan	Davis
111	Cameron	Zellweger
112	Russell	Bacall
113	Morgan	Hopkins
114	Morgan	Mcdormand
115	Harrison	Bale
116	Dan	Streep
117	Renee	Tracy
118	Cuba	Allen
119	Warren	Jackman
120	Penelope	Monroe
121	Liza	Bergman
122	Salma	Nolte
123	Julianne	Dench
124	Scarlett	Bening
125	Albert	Nolte
126	Frances	Tomei
127	Kevin	Garland
128	Cate	Mcqueen
129	Daryl	Crawford
130	Greta	Keitel
131	Jane	Jackman
132	Adam	Hopper
133	Richard	Penn
134	Gene	Hopkins
135	Rita	Reynolds
136	Ed	Mansfield
137	Morgan	Williams
138	Lucille	Dee
139	Ewan	Gooding
140	Whoopi	Hurt
141	Cate	Harris
142	Jada	Ryder
144	Angela	Witherspoon
145	Kim	Allen
146	Albert	Johansson
147	Fay	Winslet
148	Emily	Dee
149	Russell	Temple
150	Jayne	Nolte
151	Geoffrey	Heston
152	Ben	Harris
153	Minnie	Kilmer
154	Meryl	Gibson
155	Ian	Tandy
156	Fay	Wood
157	Greta	Malden
158	Vivien	Basinger
159	Laura	Brody
160	Chris	Depp
161	Harvey	Hope
162	Oprah	Kilmer
163	Christopher	West
164	Humphrey	Willis
165	Al	Garland
166	Nick	Degeneres
167	Laurence	Bullock
168	Will	Wilson
169	Kenneth	Hoffman
170	Mena	Hopper
171	Olympia	Pfeiffer
172	Groucho	Williams
173	Alan	Dreyfuss
174	Michael	Bening
175	William	Hackman
176	Jon	Chase
177	Gene	Mckellen
178	Lisa	Monroe
179	Ed	Guiness
180	Jeff	Silverstone
181	Matthew	Carrey
182	Debbie	Akroyd
183	Russell	Close
184	Humphrey	Garland
185	Michael	Bolger
186	Julia	Zellweger
187	Renee	Ball
188	Rock	Dukakis
189	Cuba	Birch
190	Audrey	Bailey
191	Gregory	Gooding
192	John	Suvari
193	Burt	Temple
194	Meryl	Allen
195	Jayne	Silverstone
196	Bela	Walken
197	Reese	West
198	Mary	Keitel
199	Julia	Fawcett
200	Thora	Temple
\.


--
-- TOC entry 2960 (class 0 OID 18418)
-- Dependencies: 199
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (address_id, address, address2, district, city_id, postal_code, phone) FROM stdin;
1	47 MySakila Drive	\N	Alberta	300		
2	28 MySQL Boulevard	\N	QLD	576		
3	23 Workhaven Lane	\N	Alberta	300		14033335568
4	1411 Lillydale Drive	\N	QLD	576		6172235589
5	1913 Hanoi Way		Nagasaki	463	35200	28303384290
6	1121 Loja Avenue		California	449	17886	838635286649
7	692 Joliet Street		Attika	38	83579	448477190408
8	1566 Inegl Manor		Mandalay	349	53561	705814003527
9	53 Idfu Parkway		Nantou	361	42399	10655648674
10	1795 Santiago de Compostela Way		Texas	295	18743	860452626434
11	900 Santiago de Compostela Parkway		Central Serbia	280	93896	716571220373
12	478 Joliet Way		Hamilton	200	77948	657282285970
13	613 Korolev Drive		Masqat	329	45844	380657522649
14	1531 Sal Drive		Esfahan	162	53628	648856936185
15	1542 Tarlac Parkway		Kanagawa	440	1027	635297277345
16	808 Bhopal Manor		Haryana	582	10672	465887807014
17	270 Amroha Parkway		Osmaniye	384	29610	695479687538
18	770 Bydgoszcz Avenue		California	120	16266	517338314235
19	419 Iligan Lane		Madhya Pradesh	76	72878	990911107354
20	360 Toulouse Parkway		England	495	54308	949312333307
21	270 Toulon Boulevard		Kalmykia	156	81766	407752414682
22	320 Brest Avenue		Kaduna	252	43331	747791594069
23	1417 Lancaster Avenue		Northern Cape	267	72192	272572357893
24	1688 Okara Way		Nothwest Border Prov	327	21954	144453869132
25	262 A Corua (La Corua) Parkway		Dhaka	525	34418	892775750063
26	28 Charlotte Amalie Street		Rabat-Sal-Zammour-Z	443	37551	161968374323
27	1780 Hino Boulevard		Liepaja	303	7716	902731229323
28	96 Tafuna Way		Crdoba	128	99865	934730187245
29	934 San Felipe de Puerto Plata Street		Sind	472	99780	196495945706
30	18 Duisburg Boulevard			121	58327	998009777982
31	217 Botshabelo Place		Southern Mindanao	138	49521	665356572025
32	1425 Shikarpur Manor		Bihar	346	65599	678220867005
33	786 Aurora Avenue		Yamaguchi	474	65750	18461860151
34	1668 Anpolis Street		Taipei	316	50199	525255540978
35	33 Gorontalo Way		West Bengali	257	30348	745994947458
36	176 Mandaluyong Place		Uttar Pradesh	239	65213	627705991774
37	127 Purnea (Purnia) Manor		Piemonte	17	79388	911872220378
38	61 Tama Street		Okayama	284	94065	708403338270
39	391 Callao Drive		Midi-Pyrnes	544	34021	440512153169
40	334 Munger (Monghyr) Lane		Markazi	31	38145	481183273622
41	1440 Fukuyama Loop		Henan	362	47929	912257250465
42	269 Cam Ranh Parkway		Chisinau	115	34689	489783829737
43	306 Antofagasta Place		Esprito Santo	569	3989	378318851631
44	671 Graz Street		Oriental	353	94399	680768868518
45	42 Brindisi Place		Yerevan	586	16744	42384721397
46	1632 Bislig Avenue		Nonthaburi	394	61117	471675840679
47	1447 Imus Way		Tahiti	167	48942	539758313890
48	1998 Halifax Drive		Lipetsk	308	76022	177727722820
49	1718 Valencia Street		Antofagasta	27	37359	675292816413
50	46 Pjatigorsk Lane		Moscow (City)	343	23616	262076994845
51	686 Garland Manor		Cear	247	52535	69493378813
52	909 Garland Manor		Tatarstan	367	69367	705800322606
53	725 Isesaki Place		Mekka	237	74428	876295323994
54	115 Hidalgo Parkway		Khartum	379	80168	307703950263
55	1135 Izumisano Parkway		California	171	48150	171822533480
56	939 Probolinggo Loop		Galicia	1	4166	680428310138
57	17 Kabul Boulevard		Chiba	355	38594	697760867968
58	1964 Allappuzha (Alleppey) Street		Yamaguchi	227	48980	920811325222
59	1697 Kowloon and New Kowloon Loop		Moskova	49	57807	499352017190
60	1668 Saint Louis Place		Tahiti	397	39072	347487831378
61	943 Tokat Street		Vaduz	560	45428	889318963672
62	1114 Liepaja Street		Sarawak	282	69226	212869228936
63	1213 Ranchi Parkway		Karnataka	350	94352	800024380485
64	81 Hodeida Way		Rajasthan	231	55561	250767749542
65	915 Ponce Place		Basel-Stadt	56	83980	1395251317
66	1717 Guadalajara Lane		Missouri	441	85505	914090181665
67	1214 Hanoi Way		Nebraska	306	67055	491001136577
68	1966 Amroha Avenue		Sichuan	139	70385	333489324603
69	698 Otsu Street		Cayenne	105	71110	409983924481
70	1150 Kimchon Manor		Skne ln	321	96109	663449333709
71	1586 Guaruj Place		Hunan	579	5135	947233365992
72	57 Arlington Manor		Madhya Pradesh	475	48960	990214419142
73	1031 Daugavpils Parkway		Bchar	63	59025	107137400143
74	1124 Buenaventura Drive		Mekka	13	6856	407733804223
75	492 Cam Ranh Street		Eastern Visayas	61	50805	565018274456
76	89 Allappuzha (Alleppey) Manor		National Capital Reg	517	75444	255800440636
77	1947 Poos de Caldas Boulevard		Chiayi	114	60951	427454485876
78	1206 Dos Quebradas Place		So Paulo	431	20207	241832790687
79	1551 Rampur Lane		Changhwa	108	72394	251164340471
80	602 Paarl Street		Pavlodar	402	98889	896314772871
81	1692 Ede Loop		So Paulo	30	9223	918711376618
82	936 Salzburg Lane		Uttar Pradesh	425	96709	875756771675
83	586 Tete Way		Kanagawa	256	1079	18581624103
84	1888 Kabul Drive		Oyo & Osun	217	20936	701457319790
85	320 Baiyin Parkway		Mahajanga	319	37307	223664661973
86	927 Baha Blanca Parkway		Krim	479	9495	821972242086
87	929 Tallahassee Loop		Gauteng	497	74671	800716535041
88	125 Citt del Vaticano Boulevard		Puebla	40	67912	48417642933
89	1557 Ktahya Boulevard		England	88	88002	720998247660
90	870 Ashqelon Loop		Songkhla	489	84931	135117278909
91	1740 Portoviejo Avenue		Sucre	480	29932	198123170793
92	1942 Ciparay Parkway		Cheju	113	82624	978987363654
93	1926 El Alto Avenue		Buenos Aires	289	75543	846225459260
94	1952 Chatsworth Drive		Guangdong	332	25958	991562402283
95	1370 Le Mans Avenue		Brunei and Muara	53	52163	345679835036
96	984 Effon-Alaiye Avenue		Gois	183	17119	132986892228
97	832 Nakhon Sawan Manor		Inner Mongolia	592	49021	275595571388
98	152 Kitwe Parkway		Caraga	82	53182	835433605312
99	1697 Tanauan Lane		Punjab	399	22870	4764773857
100	1308 Arecibo Way		Georgia	41	30695	6171054059
101	1599 Plock Drive		Tete	534	71986	817248913162
102	669 Firozabad Loop		Abu Dhabi	12	92265	412903167998
103	588 Vila Velha Manor		Kyongsangbuk	268	51540	333339908719
104	1913 Kamakura Place		Lipetsk	238	97287	942570536750
105	733 Mandaluyong Place		Asir	2	77459	196568435814
106	659 Vaduz Drive		Ha Darom	34	49708	709935135487
107	1177 Jelets Way		Kwara & Kogi	220	3305	484292626944
108	1386 Yangor Avenue		Provence-Alpes-Cte	543	80720	449216226468
109	454 Nakhon Sawan Boulevard		Funafuti	173	76383	963887147572
110	1867 San Juan Bautista Tuxtepec Avenue		Ivanovo	225	78311	547003310357
111	1532 Dzerzinsk Way		Buenos Aires	334	9599	330838016880
112	1002 Ahmadnagar Manor		Mxico	213	93026	371490777743
113	682 Junan Way		North West	273	30418	622255216127
114	804 Elista Drive		Hubei	159	61069	379804592943
115	1378 Alvorada Avenue		Distrito Federal	102	75834	272234298332
116	793 Cam Ranh Avenue		California	292	87057	824370924746
117	1079 Tel Aviv-Jaffa Boulevard		Sucre	132	10885	358178933857
118	442 Rae Bareli Place		Nordrhein-Westfalen	148	24321	886636413768
119	1107 Nakhon Sawan Avenue		Mxico	365	75149	867546627903
120	544 Malm Parkway		Central Java	403	63502	386759646229
121	1967 Sincelejo Place		Gujarat	176	73644	577812616052
122	333 Goinia Way		Texas	185	78625	909029256431
123	1987 Coacalco de Berriozbal Loop		al-Qalyubiya	476	96065	787654415858
124	241 Mosul Lane		Risaralda	147	76157	765345144779
125	211 Chiayi Drive		Uttar Pradesh	164	58186	665993880048
126	1175 Tanauan Way		Lima	305	64615	937222955822
127	117 Boa Vista Way		Uttar Pradesh	566	6804	677976133614
128	848 Tafuna Manor		Ktahya	281	45142	614935229095
129	569 Baicheng Lane		Gauteng	85	60304	490211944645
130	1666 Qomsheh Drive		So Paulo	410	66255	582835362905
131	801 Hagonoy Drive		Smolensk	484	8439	237426099212
132	1050 Garden Grove Avenue		Slaskie	236	4999	973047364353
133	1854 Tieli Street		Shandong	302	15819	509492324775
134	758 Junan Lane		Gois	190	82639	935448624185
135	1752 So Leopoldo Parkway		Taka-Karpatia	345	14014	252265130067
136	898 Belm Manor		Free State	87	49757	707169393853
137	261 Saint Louis Way		Coahuila de Zaragoza	541	83401	321944036800
138	765 Southampton Drive		al-Qalyubiya	421	4285	23712411567
139	943 Johannesburg Avenue		Maharashtra	417	5892	90921003005
140	788 Atinsk Street		Karnataka	211	81691	146497509724
141	1749 Daxian Place		Gelderland	29	11044	963369996279
142	1587 Sullana Lane		Inner Mongolia	207	85769	468060467018
143	1029 Dzerzinsk Manor		Ynlin	542	57519	33173584456
144	1666 Beni-Mellal Place		Tennessee	123	13377	9099941466
145	928 Jaffna Loop		Hiroshima	172	93762	581852137991
146	483 Ljubertsy Parkway		Scotland	149	60562	581174211853
147	374 Bat Yam Boulevard		Kilis	266	97700	923261616249
148	1027 Songkhla Manor		Minsk	340	30861	563660187896
149	999 Sanaa Loop		Gauteng	491	3439	918032330119
150	879 Newcastle Way		Michigan	499	90732	206841104594
151	1337 Lincoln Parkway		Saitama	555	99457	597815221267
152	1952 Pune Lane		Saint-Denis	442	92150	354615066969
153	782 Mosul Street		Massachusetts	94	25545	885899703621
154	781 Shimonoseki Drive		Michoacn de Ocampo	202	95444	632316273199
155	1560 Jelets Boulevard		Shandong	291	77777	189446090264
156	1963 Moscow Place		Assam	354	64863	761379480249
157	456 Escobar Way		Jakarta Raya	232	36061	719202533520
158	798 Cianjur Avenue		Shanxi	590	76990	499408708580
159	185 Novi Sad Place		Bern	72	41778	904253967161
160	1367 Yantai Manor		Ondo & Ekiti	381	21294	889538496300
161	1386 Nakhon Sawan Boulevard		Pyongyang-si	420	53502	368899174225
162	369 Papeete Way		North Carolina	187	66639	170117068815
163	1440 Compton Place		North Austria	307	81037	931059836497
164	1623 Baha Blanca Manor		Moskova	310	81511	149981248346
165	97 Shimoga Avenue		Tel Aviv	533	44660	177167004331
166	1740 Le Mans Loop		Pays de la Loire	297	22853	168476538960
167	1287 Xiangfan Boulevard		Gifu	253	57844	819416131190
168	842 Salzburg Lane		Adana	529	3313	697151428760
169	154 Tallahassee Loop		Xinxiang	199	62250	935508855935
170	710 San Felipe del Progreso Avenue		Lilongwe	304	76901	843801144113
171	1540 Wroclaw Drive		Maharashtra	107	62686	182363341674
172	475 Atinsk Way		Gansu	240	59571	201705577290
173	1294 Firozabad Drive		Jiangxi	407	70618	161801569569
174	1877 Ezhou Lane		Rajasthan	550	63337	264541743403
175	316 Uruapan Street		Perak	223	58194	275788967899
176	29 Pyongyang Loop		Batman	58	47753	734780743462
177	1010 Klerksdorp Way		Steiermark	186	6802	493008546874
178	1848 Salala Boulevard		Miranda	373	25220	48265851133
179	431 Xiangtan Avenue		Kerala	18	4854	230250973122
180	757 Rustenburg Avenue		Skikda	483	89668	506134035434
181	146 Johannesburg Way		Tamaulipas	330	54132	953689007081
182	1891 Rizhao Boulevard		So Paulo	456	47288	391065549876
183	1089 Iwatsuki Avenue		Kirov	270	35109	866092335135
184	1410 Benin City Parkway		Risaralda	405	29747	104150372603
185	682 Garden Grove Place		Tennessee	333	67497	72136330362
186	533 al-Ayn Boulevard		California	126	8862	662227486184
187	1839 Szkesfehrvr Parkway		Gois	317	55709	947468818183
188	741 Ambattur Manor		Noord-Brabant	438	43310	302590383819
189	927 Barcelona Street		Chaharmahal va Bakht	467	65121	951486492670
190	435 0 Way		West Bengali	195	74750	760171523969
191	140 Chiayi Parkway		Sumy	506	38982	855863906434
192	1166 Changhwa Street		Caraga	62	58852	650752094490
193	891 Novi Sad Manor		Ontario	383	5379	247646995453
194	605 Rio Claro Parkway		Tabora	513	49348	352469351088
195	1077 San Felipe de Puerto Plata Place		Rostov-na-Donu	369	65387	812824036424
196	9 San Miguel de Tucumn Manor		Uttar Pradesh	169	90845	956188728558
197	447 Surakarta Loop		Nyanza	271	10428	940830176580
198	345 Oshawa Boulevard		Tokyo-to	204	32114	104491201771
199	1792 Valle de la Pascua Place		Nordrhein-Westfalen	477	15540	419419591240
200	1074 Binzhou Manor		Baden-Wrttemberg	325	36490	331132568928
201	817 Bradford Loop		Jiangsu	109	89459	264286442804
202	955 Bamenda Way		Ondo & Ekiti	218	1545	768481779568
203	1149 A Corua (La Corua) Boulevard		Haiphong	194	95824	470884141195
204	387 Mwene-Ditu Drive		Ahal	35	8073	764477681869
205	68 Molodetno Manor		Nordrhein-Westfalen	575	4662	146640639760
206	642 Nador Drive		Maharashtra	77	3924	369050085652
207	1688 Nador Lane		Sulawesi Utara	184	61613	652218196731
208	1215 Pyongyang Parkway		Usak	557	25238	646237101779
209	1679 Antofagasta Street		Alto Paran	122	86599	905903574913
210	1304 s-Hertogenbosch Way		Santa Catarina	83	10925	90336226227
211	850 Salala Loop		Kitaa	371	10800	403404780639
212	624 Oshawa Boulevard		West Bengali	51	89959	49677664184
213	43 Dadu Avenue		Rajasthan	74	4855	95666951770
214	751 Lima Loop		Aden	7	99405	756460337785
215	1333 Haldia Street		Jilin	174	82161	408304391718
216	660 Jedda Boulevard		Washington	65	25053	168758068397
217	1001 Miyakonojo Lane		Taizz	518	67924	584316724815
218	226 Brest Manor		California	508	2299	785881412500
219	1229 Valencia Parkway		Haskovo	498	99124	352679173732
220	1201 Qomsheh Manor		Gois	28	21464	873492228462
221	866 Shivapuri Manor		Uttar Pradesh	448	22474	778502731092
222	1168 Najafabad Parkway		Kabol	251	40301	886649065861
223	1244 Allappuzha (Alleppey) Place		Buenos Aires	567	20657	991802825778
224	1842 Luzinia Boulevard		Zanzibar West	593	94420	706878974831
225	1926 Gingoog Street		Sisilia	511	22824	469738825391
226	810 Palghat (Palakkad) Boulevard		Jaroslavl	235	73431	516331171356
227	1820 Maring Parkway		Punjab	324	88307	99760893676
228	60 Poos de Caldas Street		Rajasthan	243	82338	963063788669
229	1014 Loja Manor		Tamil Nadu	22	66851	460795526514
230	201 Effon-Alaiye Way		Asuncin	37	64344	684192903087
231	430 Alessandria Loop		Saarland	439	47446	669828224459
232	754 Valencia Place		Phnom Penh	406	87911	594319417514
233	356 Olomouc Manor		Gois	26	93323	22326410776
234	1256 Bislig Boulevard		Botosani	86	50598	479007229460
235	954 Kimchon Place		West Bengali	559	42420	541327526474
236	885 Yingkou Manor		Kaduna	596	31390	588964509072
237	1736 Cavite Place		Qina	216	98775	431770603551
238	346 Skikda Parkway		Hawalli	233	90628	630424482919
239	98 Stara Zagora Boulevard		Valle	96	76448	610173756082
240	1479 Rustenburg Boulevard		Southern Tagalog	527	18727	727785483194
241	647 A Corua (La Corua) Street		Chollanam	357	36971	792557457753
242	1964 Gijn Manor		Karnataka	473	14408	918119601885
243	47 Syktyvkar Lane		West Java	118	22236	63937119031
244	1148 Saarbrcken Parkway		Fukushima	226	1921	137773001988
245	1103 Bilbays Parkway		Hubei	578	87660	279979529227
246	1246 Boksburg Parkway		Hebei	422	28349	890283544295
247	1483 Pathankot Street		Tucumn	454	37288	686015532180
248	582 Papeete Loop		Central Visayas	294	27722	569868543137
249	300 Junan Street		Kyonggi	553	81314	890289150158
250	829 Grand Prairie Way		Paran	328	6461	741070712873
251	1473 Changhwa Parkway		Mxico	124	75933	266798132374
252	1309 Weifang Street		Florida	520	57338	435785045362
253	1760 Oshawa Manor		Tianjin	535	38140	56257502250
254	786 Stara Zagora Way		Oyo & Osun	390	98332	716256596301
255	1966 Tonghae Street		Anhalt Sachsen	198	36481	567359279425
256	1497 Yuzhou Drive		England	312	3433	246810237916
258	752 Ondo Loop		Miyazaki	338	32474	134673576619
259	1338 Zalantun Lane		Minas Gerais	413	45403	840522972766
260	127 Iwakuni Boulevard		Central Luzon	192	20777	987442542471
261	51 Laredo Avenue		Sagaing	342	68146	884536620568
262	771 Yaound Manor		Sofala	64	86768	245477603573
263	532 Toulon Street		Santiago	460	69517	46871694740
264	1027 Banjul Place		West Bengali	197	50390	538241037443
265	1158 Mandi Bahauddin Parkway		Shanxi	136	98484	276555730211
266	862 Xintai Lane		Cagayan Valley	548	30065	265153400632
267	816 Cayenne Parkway		Manab	414	93629	282874611748
268	1831 Nam Dinh Loop		National Capital Reg	323	51990	322888976727
269	446 Kirovo-Tepetsk Lane		Osaka	203	19428	303967439816
270	682 Halisahar Place		Severn Morava	378	20536	475553436330
271	1587 Loja Manor		Salzburg	447	5410	621625204422
272	1762 Paarl Parkway		Hunan	298	53928	192459639410
273	1519 Ilorin Place		Kerala	395	49298	357445645426
274	920 Kumbakonam Loop		California	446	75090	685010736240
275	906 Goinia Way		Wielkopolskie	255	83565	701767622697
276	1675 Xiangfan Manor		Tamil Nadu	283	11763	271149517630
277	85 San Felipe de Puerto Plata Drive		Shandong	584	46063	170739645687
278	144 South Hill Loop		Guanajuato	445	2012	45387294817
279	1884 Shikarpur Avenue		Haryana	263	85548	959949395183
280	1980 Kamjanets-Podilskyi Street		Illinois	404	89502	874337098891
281	1944 Bamenda Way		Michigan	573	24645	75975221996
282	556 Baybay Manor		Oyo & Osun	374	55802	363982224739
283	457 Tongliao Loop		Bursa	222	56254	880756161823
284	600 Bradford Street		East Azerbaidzan	514	96204	117592274996
285	1006 Santa Brbara dOeste Manor		Ondo & Ekiti	389	36229	85059738746
286	1308 Sumy Loop		Fujian	175	30657	583021225407
287	1405 Chisinau Place		Ponce	411	8160	62781725285
288	226 Halifax Street		Xinxiang	277	58492	790651020929
289	1279 Udine Parkway		Edo & Delta	69	75860	195003555232
290	1336 Benin City Drive		Shiga	386	46044	341242939532
291	1155 Liaocheng Place		Oyo & Osun	152	22650	558236142492
292	1993 Tabuk Lane		Tamil Nadu	522	64221	648482415405
293	86 Higashiosaka Lane		Guanajuato	563	33768	957128697225
294	1912 Allende Manor		Kowloon and New Kowl	279	58124	172262454487
295	544 Tarsus Boulevard		Gurico	562	53145	892523334
296	1936 Cuman Avenue		Virginia	433	61195	976798660411
297	1192 Tongliao Street		Sharja	470	19065	350970907017
298	44 Najafabad Way		Baskimaa	146	61391	96604821070
299	32 Pudukkottai Lane		Ohio	140	38834	967274728547
300	661 Chisinau Lane		Pietari	274	8856	816436065431
301	951 Stara Zagora Manor		Punjab	400	98573	429925609431
302	922 Vila Velha Loop		Maharashtra	9	4085	510737228015
303	898 Jining Lane		Pohjois-Pohjanmaa	387	40070	161643343536
304	1635 Kuwana Boulevard		Hiroshima	205	52137	710603868323
305	41 El Alto Parkway		Maharashtra	398	56883	51917807050
306	1883 Maikop Lane		Kaliningrad	254	68469	96110042435
307	1908 Gaziantep Place		Liaoning	536	58979	108053751300
308	687 Alessandria Parkway		Sanaa	455	57587	407218522294
309	827 Yuncheng Drive		Callao	99	79047	504434452842
310	913 Coacalco de Berriozbal Loop		Texas	33	42141	262088367001
311	715 So Bernardo do Campo Lane		Kedah	507	84804	181179321332
312	1354 Siegen Street		Rio de Janeiro	25	80184	573441801529
313	1191 Sungai Petani Boulevard		Missouri	262	9668	983259819766
314	1224 Huejutla de Reyes Boulevard		Lombardia	91	70923	806016930576
315	543 Bergamo Avenue		Minas Gerais	215	59686	103602195112
316	746 Joliet Lane		Kursk	286	94878	688485191923
317	780 Kimberley Way		Tabuk	515	17032	824396883951
318	1774 Yaound Place		Hubei	166	91400	613124286867
319	1957 Yantai Lane		So Paulo	490	59255	704948322302
320	1542 Lubumbashi Boulevard		Tel Aviv	57	62472	508800331065
321	651 Pathankot Loop		Maharashtra	336	59811	139378397418
322	1359 Zhoushan Parkway		Streymoyar	545	29763	46568045367
323	1769 Iwaki Lane		Kujawsko-Pomorskie	97	25787	556100547674
324	1145 Vilnius Manor		Mxico	451	73170	674805712553
325	1892 Nabereznyje Telny Lane		Tutuila	516	28396	478229987054
326	470 Boksburg Street		Central	81	97960	908029859266
327	1427 A Corua (La Corua) Place		Buenos Aires	45	85799	972574862516
328	479 San Felipe del Progreso Avenue		Morelos	130	54949	869051782691
329	867 Benin City Avenue		Henan	591	78543	168884817145
330	981 Kumbakonam Place		Distrito Federal	89	87611	829116184079
331	1016 Iwakuni Street		St George	269	49833	961370847344
332	663 Baha Blanca Parkway		Adana	5	33463	834418779292
333	1860 Taguig Loop		West Java	119	59550	38158430589
334	1816 Bydgoszcz Loop		Dhaka	234	64308	965273813662
335	587 Benguela Manor		Illinois	42	91590	165450987037
336	430 Kumbakonam Drive		Santa F	457	28814	105470691550
337	1838 Tabriz Lane		Dhaka	143	1195	38988715447
338	431 Szkesfehrvr Avenue		Baki	48	57828	119501405123
339	503 Sogamoso Loop		Sumqayit	505	49812	834626715837
340	507 Smolensk Loop		Sousse	492	22971	80303246192
341	1920 Weifang Avenue		Uttar Pradesh	427	15643	869507847714
342	124 al-Manama Way		Hiroshima	382	52368	647899404952
343	1443 Mardan Street		Western Cape	392	31483	231383037471
344	1909 Benguela Lane		Henan	581	19913	624138001031
345	68 Ponce Parkway		Hanoi	201	85926	870635127812
346	1217 Konotop Avenue		Gelderland	151	504	718917251754
347	1293 Nam Dinh Way		Roraima	84	71583	697656479977
348	785 Vaduz Street		Baja California	335	36170	895616862749
349	1516 Escobar Drive		Tongatapu	370	46069	64536069371
350	1628 Nagareyama Lane		Central	453	60079	20064292617
351	1157 Nyeri Loop		Adygea	320	56380	262744791493
352	1673 Tangail Drive		Daugavpils	137	26857	627924259271
353	381 Kabul Way		Taipei	209	87272	55477302294
354	953 Hodeida Street		Southern Tagalog	221	18841	53912826864
355	469 Nakhon Sawan Street		Tuvassia	531	58866	689199636560
356	1378 Beira Loop		Krasnojarsk	597	40792	840957664136
357	1641 Changhwa Place		Nord-Ouest	52	37636	256546485220
358	1698 Southport Loop		Hidalgo	393	49009	754358349853
359	519 Nyeri Manor		So Paulo	461	37650	764680915323
360	619 Hunuco Avenue		Shimane	331	81508	142596392389
361	45 Aparecida de Goinia Place		Madhya Pradesh	464	7431	650496654258
362	482 Kowloon and New Kowloon Manor		Bratislava	90	97056	738968474939
363	604 Bern Place		Jharkhand	429	5373	620719383725
364	1623 Kingstown Drive		Buenos Aires	20	91299	296394569728
365	1009 Zanzibar Lane		Arecibo	32	64875	102396298916
366	114 Jalib al-Shuyukh Manor		Centre	585	60440	845378657301
367	1163 London Parkway		Par	66	6066	675120358494
368	1658 Jastrzebie-Zdrj Loop		Central	372	96584	568367775448
369	817 Laredo Avenue		Jalisco	188	77449	151249681135
370	1565 Tangail Manor		Okinawa	377	45750	634445428822
371	1912 Emeishan Drive		Balikesir	50	33050	99883471275
372	230 Urawa Drive		Andhra Pradesh	8	2738	166898395731
373	1922 Miraj Way		Esfahan	356	13203	320471479776
374	433 Florencia Street		Chihuahua	250	91330	561729882725
375	1049 Matamoros Parkway		Karnataka	191	69640	960505250340
376	1061 Ede Avenue		Southern Tagalog	98	57810	333390595558
377	154 Oshawa Manor		East Java	415	72771	440365973660
378	1191 Tandil Drive		Southern Tagalog	523	6362	45554316010
379	1133 Rizhao Avenue		Pernambuco	572	2800	600264533987
380	1519 Santiago de los Caballeros Loop		East Kasai	348	22025	409315295763
381	1618 Olomouc Manor		Kurgan	285	26385	96846695220
382	220 Hidalgo Drive		Kermanshah	265	45298	342720754566
383	686 Donostia-San Sebastin Lane		Guangdong	471	97390	71857599858
384	97 Mogiljov Lane		Gujarat	73	89294	924815207181
385	1642 Charlotte Amalie Drive		Slaskie	549	75442	821476736117
386	1368 Maracabo Boulevard			493	32716	934352415130
387	401 Sucre Boulevard		New Hampshire	322	25007	486395999608
388	368 Hunuco Boulevard		Namibe	360	17165	106439158941
389	500 Lincoln Parkway		Jiangsu	210	95509	550306965159
390	102 Chapra Drive		Ibaragi	521	14073	776031833752
391	1793 Meixian Place		Hmelnytskyi	258	33535	619966287415
392	514 Ife Way		Shaba	315	69973	900235712074
393	717 Changzhou Lane		Southern Tagalog	104	21615	426255288071
394	753 Ilorin Avenue		Sichuan	157	3656	464511145118
395	1337 Mit Ghamr Avenue		Nakhon Sawan	358	29810	175283210378
396	767 Pyongyang Drive		Osaka	229	83536	667736124769
397	614 Pak Kret Street		Addis Abeba	6	27796	47808359842
398	954 Lapu-Lapu Way		Moskova	278	8816	737229003916
399	331 Bydgoszcz Parkway		Asturia	181	966	537374465982
400	1152 Citrus Heights Manor		al-Qadarif	15	5239	765957414528
401	168 Cianjur Manor		Saitama	228	73824	679095087143
402	616 Hagonoy Avenue		Krasnojarsk	39	46043	604177838256
403	1190 0 Place		Rio Grande do Sul	44	10417	841876514789
404	734 Bchar Place		Punjab	375	30586	280578750435
405	530 Lausanne Lane		Texas	135	11067	775235029633
406	454 Patiala Lane		Fukushima	276	13496	794553031307
407	1346 Mysore Drive		Bretagne	92	61507	516647474029
408	990 Etawah Loop		Tamil Nadu	564	79940	206169448769
409	1266 Laredo Parkway		Saitama	380	7664	1483365694
410	88 Nagaon Manor		Buenos Aires	524	86868	779461480495
411	264 Bhimavaram Manor		St Thomas	111	54749	302526949177
412	1639 Saarbrcken Drive		North West	437	9827	328494873422
413	692 Amroha Drive		Northern	230	35575	359478883004
414	1936 Lapu-Lapu Parkway		Bauchi & Gombe	141	7122	653436985797
415	432 Garden Grove Street		Ontario	430	65630	615964523510
416	1445 Carmen Parkway		West Java	117	70809	598912394463
417	791 Salinas Street		Punjab	208	40509	129953030512
418	126 Acua Parkway		West Bengali	71	58888	480039662421
419	397 Sunnyvale Avenue		Guanajuato	19	55566	680851640676
420	992 Klerksdorp Loop		Utrecht	23	33711	855290087237
421	966 Arecibo Loop		Sind	134	94018	15273765306
422	289 Santo Andr Manor		al-Sharqiya	16	72410	214976066017
423	437 Chungho Drive		Puerto Plata	450	59489	491271355190
424	1948 Bayugan Parkway		Bihar	264	60622	987306329957
425	1866 al-Qatif Avenue		California	155	89420	546793516940
426	1661 Abha Drive		Tamil Nadu	416	14400	270456873752
427	1557 Cape Coral Parkway		Hubei	293	46875	368284120423
428	1727 Matamoros Place		Sawhaj	465	78813	129673677866
429	1269 Botosani Manor		Guangdong	468	47394	736517327853
430	355 Vitria de Santo Anto Way		Oaxaca	452	81758	548003849552
431	1596 Acua Parkway		Jharkhand	418	70425	157133457169
432	259 Ipoh Drive		So Paulo	189	64964	419009857119
433	1823 Hoshiarpur Lane		Komi	510	33191	307133768620
434	1404 Taguig Drive		Okayama	547	87212	572068624538
435	740 Udaipur Lane		Nizni Novgorod	150	33505	497288595103
436	287 Cuautla Boulevard		Chuquisaca	501	72736	82619513349
437	1766 Almirante Brown Street		KwaZulu-Natal	364	63104	617567598243
438	596 Huixquilucan Place		Nampula	351	65892	342709348083
439	1351 Aparecida de Goinia Parkway		Northern Mindanao	391	41775	959834530529
440	722 Bradford Lane		Shandong	249	90920	746251338300
441	983 Santa F Way		British Colombia	565	47472	145720452260
442	1245 Ibirit Way		La Romana	290	40926	331888642162
443	1836 Korla Parkway		Copperbelt	272	55405	689681677428
444	231 Kaliningrad Place		Lombardia	70	57833	575081026569
445	495 Bhimavaram Lane		Maharashtra	144	3	82088937724
446	1924 Shimonoseki Drive		Batna	59	52625	406784385440
447	105 Dzerzinsk Manor		Inner Mongolia	540	48570	240776414296
448	614 Denizli Parkway		Rio Grande do Sul	486	29444	876491807547
449	1289 Belm Boulevard		Tartumaa	530	88306	237368926031
450	203 Tambaram Street		Buenos Aires	161	73942	411549550611
451	1704 Tambaram Manor		West Bengali	554	2834	39463554936
452	207 Cuernavaca Loop		Tatarstan	352	52671	782900030287
453	319 Springs Loop		Baijeri	160	99552	72524459905
454	956 Nam Dinh Manor		Kerman	481	21872	474047727727
455	1947 Paarl Way		Central Java	509	23636	834061016202
456	814 Simferopol Loop		Sinaloa	154	48745	524567129902
457	535 Ahmadnagar Manor		Abu Dhabi	3	41136	985109775584
458	138 Caracas Boulevard		Zulia	326	16790	974433019532
459	251 Florencia Drive		Michoacn de Ocampo	556	16119	118011831565
460	659 Gatineau Boulevard		La Paz	153	28587	205524798287
461	1889 Valparai Way		Ziguinchor	600	75559	670370974122
462	1485 Bratislava Place		Illinois	435	83183	924663855568
463	935 Aden Boulevard		Central Java	532	64709	335052544020
464	76 Kermanshah Manor		Esfahan	423	23343	762361821578
465	734 Tanshui Avenue		Caquet	170	70664	366776723320
466	118 Jaffna Loop		Northern Mindanao	182	10447	325526730021
467	1621 Tongliao Avenue		Irkutsk	558	22173	209342540247
468	1844 Usak Avenue		Nova Scotia	196	84461	164414772677
469	1872 Toulon Loop		OHiggins	428	7939	928809465153
470	1088 Ibirit Place		Jalisco	595	88502	49084281333
471	1322 Mosul Parkway		Shandong	145	95400	268053970382
472	1447 Chatsworth Place		Chihuahua	129	41545	769370126331
473	1257 Guadalajara Street		Karnataka	78	33599	195337700615
474	1469 Plock Lane		Galicia	388	95835	622884741180
475	434 Ourense (Orense) Manor		Hodeida	206	14122	562370137426
476	270 Tambaram Parkway		Gauteng	244	9668	248446668735
477	1786 Salinas Place		Nam Ha	359	66546	206060652238
478	1078 Stara Zagora Drive		Aceh	301	69221	932992626595
479	1854 Okara Boulevard		Drenthe	158	42123	131912793873
480	421 Yaound Street		Sumy	385	11363	726875628268
481	1153 Allende Way		Qubec	179	20336	856872225376
482	808 Naala-Porto Parkway		England	500	41060	553452430707
483	632 Usolje-Sibirskoje Parkway		Ha Darom	36	73085	667648979883
484	98 Pyongyang Boulevard		Ohio	11	88749	191958435142
485	984 Novoterkassk Loop		Gaziantep	180	28165	435118527255
486	64 Korla Street		Mwanza	347	25145	510383179153
487	1785 So Bernardo do Campo Street		Veracruz	125	71182	684529463244
488	698 Jelets Boulevard		Denizli	142	2596	975185523021
489	1297 Alvorada Parkway		Ningxia	587	11839	508348602835
490	1909 Dayton Avenue		Guangdong	469	88513	702955450528
491	1789 Saint-Denis Parkway		Coahuila de Zaragoza	4	8268	936806643983
492	185 Mannheim Lane		Stavropol	408	23661	589377568313
493	184 Mandaluyong Street		Baja California Sur	288	94239	488425406814
494	591 Sungai Petani Drive		Okayama	376	46400	37247325001
495	656 Matamoros Drive		Boyac	487	19489	17305839123
496	775 ostka Drive		al-Daqahliya	337	22358	171973024401
497	1013 Tabuk Boulevard		West Bengali	261	96203	158399646978
498	319 Plock Parkway		Istanbul	504	26101	854259976812
499	1954 Kowloon and New Kowloon Way		Chimborazo	434	63667	898559280434
500	362 Rajkot Lane		Gansu	47	98030	962020153680
501	1060 Tandil Lane		Shandong	432	72349	211256301880
502	1515 Korla Way		England	589	57197	959467760895
503	1416 San Juan Bautista Tuxtepec Avenue		Zufar	444	50592	144206758053
504	1 Valle de Santiago Avenue		Apulia	93	86208	465897838272
505	519 Brescia Parkway		East Java	318	69504	793996678771
506	414 Mandaluyong Street		Lubelskie	314	16370	52709222667
507	1197 Sokoto Boulevard		West Bengali	478	87687	868602816371
508	496 Celaya Drive		Nagano	552	90797	759586584889
509	786 Matsue Way		Illinois	245	37469	111177206479
510	48 Maracabo Place		Central Luzon	519	1570	82671830126
511	1152 al-Qatif Lane		Kalimantan Barat	412	44816	131370665218
512	1269 Ipoh Avenue		Eskisehir	163	54674	402630109080
513	758 Korolev Parkway		Andhra Pradesh	568	75474	441628280920
514	1747 Rustenburg Place		Bihar	110	51369	442673923363
515	886 Tonghae Place		Volgograd	259	19450	711928348157
516	1574 Goinia Boulevard		Heilongjiang	502	39529	59634255214
517	548 Uruapan Street		Ontario	312	35653	879347453467
519	962 Tama Loop			583	65952	282667506728
520	1778 Gijn Manor		Hubei	594	35156	288910576761
521	568 Dhule (Dhulia) Loop		Coquimbo	127	92568	602101369463
522	1768 Udine Loop		Battambang	60	32347	448876499197
523	608 Birgunj Parkway		Taipei	116	400	627425618482
524	680 A Corua (La Corua) Manor		Sivas	482	49806	158326114853
525	1949 Sanya Street		Gumma	224	61244	132100972047
526	617 Klerksdorp Place		Khanh Hoa	366	94707	574973479129
527	1993 0 Loop		Liaoning	588	41214	25865528181
528	1176 Southend-on-Sea Manor		Southern Tagalog	458	81651	236679267178
529	600 Purnea (Purnia) Avenue		Nghe An	571	18043	638409958875
530	1003 Qinhuangdao Street		West Java	419	25972	35533115997
531	1986 Sivas Place		Friuli-Venezia Giuli	551	95775	182059202712
532	1427 Tabuk Place		Florida	101	31342	214756839122
533	556 Asuncin Way		Mogiljov	339	35364	338244023543
534	486 Ondo Parkway		Benguela	67	35202	105882218332
535	635 Brest Manor		Andhra Pradesh	75	40899	80593242951
536	166 Jinchang Street		Buenos Aires	165	86760	717566026669
537	958 Sagamihara Lane		Mie	287	88408	427274926505
538	1817 Livorno Way		Khanh Hoa	100	79401	478380208348
539	1332 Gaziantep Lane		Shandong	80	22813	383353187467
540	949 Allende Lane		Uttar Pradesh	24	67521	122981120653
541	195 Ilorin Street		Chari-Baguirmi	363	49250	8912935608
542	193 Bhusawal Place		Kang-won	539	9750	745267607502
543	43 Vilnius Manor		Colorado	42	79814	484500282381
544	183 Haiphong Street		Jilin	46	69953	488600270038
545	163 Augusta-Richmond County Loop		Carabobo	561	33030	754579047924
546	191 Jos Azueta Parkway		Ruse	436	13629	932156667696
547	379 Lublin Parkway		Toscana	309	74568	921960450089
548	1658 Cuman Loop		Sumatera Selatan	396	51309	784907335610
549	454 Qinhuangdao Drive		Tadla-Azilal	68	25866	786270036240
550	1715 Okayama Street		So Paulo	485	55676	169352919175
551	182 Nukualofa Drive		Sumy	275	15414	426346224043
552	390 Wroclaw Way		Hainan	462	5753	357593328658
553	1421 Quilmes Lane		Ishikawa	260	19151	135407755975
554	947 Trshavn Place		Central Luzon	528	841	50898428626
555	1764 Jalib al-Shuyukh Parkway		Galicia	459	77642	84794532510
556	346 Cam Ranh Avenue		Zhejiang	599	39976	978430786151
557	1407 Pachuca de Soto Place		Rio Grande do Sul	21	26284	380077794770
558	904 Clarksville Drive		Zhejiang	193	52234	955349440539
559	1917 Kumbakonam Parkway		Vojvodina	368	11892	698182547686
560	1447 Imus Place		Gujarat	426	12905	62127829280
561	1497 Fengshan Drive		KwaZulu-Natal	112	63022	368738360376
562	869 Shikarpur Way		England	496	57380	590764256785
563	1059 Yuncheng Avenue		Vilna	570	47498	107092893983
564	505 Madiun Boulevard		Dolnoslaskie	577	97271	970638808606
565	1741 Hoshiarpur Boulevard		al-Sharqiya	79	22372	855066328617
566	1229 Varanasi (Benares) Manor		Buenos Aires	43	40195	817740355461
567	1894 Boa Vista Way		Texas	178	77464	239357986667
568	1342 Sharja Way		Sokoto & Kebbi & Zam	488	93655	946114054231
569	1342 Abha Boulevard		Bukarest	95	10714	997453607116
570	415 Pune Avenue		Shandong	580	44274	203202500108
571	1746 Faaa Way		Huanuco	214	32515	863080561151
572	539 Hami Way		Tokat	538	52196	525518075499
573	1407 Surakarta Manor		Moskova	466	33224	324346485054
574	502 Mandi Bahauddin Parkway		Anzotegui	55	15992	618156722572
575	1052 Pathankot Avenue		Sichuan	299	77397	128499386727
576	1351 Sousse Lane		Coahuila de Zaragoza	341	37815	203804046132
577	1501 Pangkal Pinang Avenue		Mazowieckie	409	943	770864062795
578	1405 Hagonoy Avenue		Slaskie	133	86587	867287719310
579	521 San Juan Bautista Tuxtepec Place		Qaraghandy	598	95093	844018348565
580	923 Tangail Boulevard		Tokyo-to	10	33384	315528269898
581	186 Skikda Lane		Morelos	131	89422	14465669789
582	1568 Celaya Parkway		Kaohsiung	168	34750	278669994384
583	1489 Kakamigahara Lane		Taipei	526	98883	29341849811
584	1819 Alessandria Loop		Campeche	103	53829	377633994405
585	1208 Tama Loop		Ninawa	344	73605	954786054144
586	951 Springs Lane		Central Mindanao	219	96115	165164761435
587	760 Miyakonojo Drive		Guerrero	246	64682	294449058179
588	966 Asuncin Way		Hidalgo	212	62703	995527378381
589	1584 Ljubertsy Lane		England	494	22954	285710089439
590	247 Jining Parkway		Banjul	54	53446	170115379190
591	773 Dallas Manor		Buenos Aires	424	12664	914466027044
592	1923 Stara Zagora Lane		Nantou	546	95179	182178609211
593	1402 Zanzibar Boulevard		Guanajuato	106	71102	387448063440
594	1464 Kursk Parkway		Shandong	574	17381	338758048786
595	1074 Sanaa Parkway		Loja	311	22474	154124128457
596	1759 Niznekamsk Avenue		al-Manama	14	39414	864392582257
597	32 Liaocheng Way		Minas Gerais	248	1944	410877354933
598	42 Fontana Avenue		Fejr	512	14684	437829801725
599	1895 Zhezqazghan Drive		California	177	36693	137809746111
600	1837 Kaduna Parkway		Inner Mongolia	241	82580	640843562301
601	844 Bucuresti Place		Liaoning	242	36603	935952366111
602	1101 Bucuresti Boulevard		West Greece	401	97661	199514580428
603	1103 Quilmes Boulevard		Piura	503	52137	644021380889
604	1331 Usak Boulevard		Vaud	296	61960	145308717464
605	1325 Fukuyama Street		Heilongjiang	537	27107	288241215394
\.


--
-- TOC entry 2962 (class 0 OID 18425)
-- Dependencies: 201
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, name) FROM stdin;
1	Action
2	Animation
3	Children
4	Classics
5	Comedy
6	Documentary
7	Drama
8	Family
9	Foreign
10	Games
11	Horror
12	Music
13	New
14	Sci-Fi
15	Sports
16	Travel
\.


--
-- TOC entry 2964 (class 0 OID 18432)
-- Dependencies: 203
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (city_id, city, country_id) FROM stdin;
1	A Corua (La Corua)	87
2	Abha	82
3	Abu Dhabi	101
4	Acua	60
5	Adana	97
6	Addis Abeba	31
7	Aden	107
8	Adoni	44
9	Ahmadnagar	44
10	Akishima	50
11	Akron	103
12	al-Ayn	101
13	al-Hawiya	82
14	al-Manama	11
15	al-Qadarif	89
16	al-Qatif	82
17	Alessandria	49
18	Allappuzha (Alleppey)	44
19	Allende	60
20	Almirante Brown	6
21	Alvorada	15
22	Ambattur	44
23	Amersfoort	67
24	Amroha	44
25	Angra dos Reis	15
26	Anpolis	15
27	Antofagasta	22
28	Aparecida de Goinia	15
29	Apeldoorn	67
30	Araatuba	15
31	Arak	46
32	Arecibo	77
33	Arlington	103
34	Ashdod	48
35	Ashgabat	98
36	Ashqelon	48
37	Asuncin	73
38	Athenai	39
39	Atinsk	80
40	Atlixco	60
41	Augusta-Richmond County	103
42	Aurora	103
43	Avellaneda	6
44	Bag	15
45	Baha Blanca	6
46	Baicheng	23
47	Baiyin	23
48	Baku	10
49	Balaiha	80
50	Balikesir	97
51	Balurghat	44
52	Bamenda	19
53	Bandar Seri Begawan	16
54	Banjul	37
55	Barcelona	104
56	Basel	91
57	Bat Yam	48
58	Batman	97
59	Batna	2
60	Battambang	18
61	Baybay	75
62	Bayugan	75
63	Bchar	2
64	Beira	63
65	Bellevue	103
66	Belm	15
67	Benguela	4
68	Beni-Mellal	62
69	Benin City	69
70	Bergamo	49
71	Berhampore (Baharampur)	44
72	Bern	91
73	Bhavnagar	44
74	Bhilwara	44
75	Bhimavaram	44
76	Bhopal	44
77	Bhusawal	44
78	Bijapur	44
79	Bilbays	29
80	Binzhou	23
81	Birgunj	66
82	Bislig	75
83	Blumenau	15
84	Boa Vista	15
85	Boksburg	85
86	Botosani	78
87	Botshabelo	85
88	Bradford	102
89	Braslia	15
90	Bratislava	84
91	Brescia	49
92	Brest	34
93	Brindisi	49
94	Brockton	103
95	Bucuresti	78
96	Buenaventura	24
97	Bydgoszcz	76
98	Cabuyao	75
99	Callao	74
100	Cam Ranh	105
101	Cape Coral	103
102	Caracas	104
103	Carmen	60
104	Cavite	75
105	Cayenne	35
106	Celaya	60
107	Chandrapur	44
108	Changhwa	92
109	Changzhou	23
110	Chapra	44
111	Charlotte Amalie	106
112	Chatsworth	85
113	Cheju	86
114	Chiayi	92
115	Chisinau	61
116	Chungho	92
117	Cianjur	45
118	Ciomas	45
119	Ciparay	45
120	Citrus Heights	103
121	Citt del Vaticano	41
122	Ciudad del Este	73
123	Clarksville	103
124	Coacalco de Berriozbal	60
125	Coatzacoalcos	60
126	Compton	103
127	Coquimbo	22
128	Crdoba	6
129	Cuauhtmoc	60
130	Cuautla	60
131	Cuernavaca	60
132	Cuman	104
133	Czestochowa	76
134	Dadu	72
135	Dallas	103
136	Datong	23
137	Daugavpils	54
138	Davao	75
139	Daxian	23
140	Dayton	103
141	Deba Habe	69
142	Denizli	97
143	Dhaka	12
144	Dhule (Dhulia)	44
145	Dongying	23
146	Donostia-San Sebastin	87
147	Dos Quebradas	24
148	Duisburg	38
149	Dundee	102
150	Dzerzinsk	80
151	Ede	67
152	Effon-Alaiye	69
153	El Alto	14
154	El Fuerte	60
155	El Monte	103
156	Elista	80
157	Emeishan	23
158	Emmen	67
159	Enshi	23
160	Erlangen	38
161	Escobar	6
162	Esfahan	46
163	Eskisehir	97
164	Etawah	44
165	Ezeiza	6
166	Ezhou	23
167	Faaa	36
168	Fengshan	92
169	Firozabad	44
170	Florencia	24
171	Fontana	103
172	Fukuyama	50
173	Funafuti	99
174	Fuyu	23
175	Fuzhou	23
176	Gandhinagar	44
177	Garden Grove	103
178	Garland	103
179	Gatineau	20
180	Gaziantep	97
181	Gijn	87
182	Gingoog	75
183	Goinia	15
184	Gorontalo	45
185	Grand Prairie	103
186	Graz	9
187	Greensboro	103
188	Guadalajara	60
189	Guaruj	15
190	guas Lindas de Gois	15
191	Gulbarga	44
192	Hagonoy	75
193	Haining	23
194	Haiphong	105
195	Haldia	44
196	Halifax	20
197	Halisahar	44
198	Halle/Saale	38
199	Hami	23
200	Hamilton	68
201	Hanoi	105
202	Hidalgo	60
203	Higashiosaka	50
204	Hino	50
205	Hiroshima	50
206	Hodeida	107
207	Hohhot	23
208	Hoshiarpur	44
209	Hsichuh	92
210	Huaian	23
211	Hubli-Dharwad	44
212	Huejutla de Reyes	60
213	Huixquilucan	60
214	Hunuco	74
215	Ibirit	15
216	Idfu	29
217	Ife	69
218	Ikerre	69
219	Iligan	75
220	Ilorin	69
221	Imus	75
222	Inegl	97
223	Ipoh	59
224	Isesaki	50
225	Ivanovo	80
226	Iwaki	50
227	Iwakuni	50
228	Iwatsuki	50
229	Izumisano	50
230	Jaffna	88
231	Jaipur	44
232	Jakarta	45
233	Jalib al-Shuyukh	53
234	Jamalpur	12
235	Jaroslavl	80
236	Jastrzebie-Zdrj	76
237	Jedda	82
238	Jelets	80
239	Jhansi	44
240	Jinchang	23
241	Jining	23
242	Jinzhou	23
243	Jodhpur	44
244	Johannesburg	85
245	Joliet	103
246	Jos Azueta	60
247	Juazeiro do Norte	15
248	Juiz de Fora	15
249	Junan	23
250	Jurez	60
251	Kabul	1
252	Kaduna	69
253	Kakamigahara	50
254	Kaliningrad	80
255	Kalisz	76
256	Kamakura	50
257	Kamarhati	44
258	Kamjanets-Podilskyi	100
259	Kamyin	80
260	Kanazawa	50
261	Kanchrapara	44
262	Kansas City	103
263	Karnal	44
264	Katihar	44
265	Kermanshah	46
266	Kilis	97
267	Kimberley	85
268	Kimchon	86
269	Kingstown	81
270	Kirovo-Tepetsk	80
271	Kisumu	52
272	Kitwe	109
273	Klerksdorp	85
274	Kolpino	80
275	Konotop	100
276	Koriyama	50
277	Korla	23
278	Korolev	80
279	Kowloon and New Kowloon	42
280	Kragujevac	108
281	Ktahya	97
282	Kuching	59
283	Kumbakonam	44
284	Kurashiki	50
285	Kurgan	80
286	Kursk	80
287	Kuwana	50
288	La Paz	60
289	La Plata	6
290	La Romana	27
291	Laiwu	23
292	Lancaster	103
293	Laohekou	23
294	Lapu-Lapu	75
295	Laredo	103
296	Lausanne	91
297	Le Mans	34
298	Lengshuijiang	23
299	Leshan	23
300	Lethbridge	20
301	Lhokseumawe	45
302	Liaocheng	23
303	Liepaja	54
304	Lilongwe	58
305	Lima	74
306	Lincoln	103
307	Linz	9
308	Lipetsk	80
309	Livorno	49
310	Ljubertsy	80
311	Loja	28
312	London	102
313	London	20
314	Lublin	76
315	Lubumbashi	25
316	Lungtan	92
317	Luzinia	15
318	Madiun	45
319	Mahajanga	57
320	Maikop	80
321	Malm	90
322	Manchester	103
323	Mandaluyong	75
324	Mandi Bahauddin	72
325	Mannheim	38
326	Maracabo	104
327	Mardan	72
328	Maring	15
329	Masqat	71
330	Matamoros	60
331	Matsue	50
332	Meixian	23
333	Memphis	103
334	Merlo	6
335	Mexicali	60
336	Miraj	44
337	Mit Ghamr	29
338	Miyakonojo	50
339	Mogiljov	13
340	Molodetno	13
341	Monclova	60
342	Monywa	64
343	Moscow	80
344	Mosul	47
345	Mukateve	100
346	Munger (Monghyr)	44
347	Mwanza	93
348	Mwene-Ditu	25
349	Myingyan	64
350	Mysore	44
351	Naala-Porto	63
352	Nabereznyje Telny	80
353	Nador	62
354	Nagaon	44
355	Nagareyama	50
356	Najafabad	46
357	Naju	86
358	Nakhon Sawan	94
359	Nam Dinh	105
360	Namibe	4
361	Nantou	92
362	Nanyang	23
363	NDjamna	21
364	Newcastle	85
365	Nezahualcyotl	60
366	Nha Trang	105
367	Niznekamsk	80
368	Novi Sad	108
369	Novoterkassk	80
370	Nukualofa	95
371	Nuuk	40
372	Nyeri	52
373	Ocumare del Tuy	104
374	Ogbomosho	69
375	Okara	72
376	Okayama	50
377	Okinawa	50
378	Olomouc	26
379	Omdurman	89
380	Omiya	50
381	Ondo	69
382	Onomichi	50
383	Oshawa	20
384	Osmaniye	97
385	ostka	100
386	Otsu	50
387	Oulu	33
388	Ourense (Orense)	87
389	Owo	69
390	Oyo	69
391	Ozamis	75
392	Paarl	85
393	Pachuca de Soto	60
394	Pak Kret	94
395	Palghat (Palakkad)	44
396	Pangkal Pinang	45
397	Papeete	36
398	Parbhani	44
399	Pathankot	44
400	Patiala	44
401	Patras	39
402	Pavlodar	51
403	Pemalang	45
404	Peoria	103
405	Pereira	24
406	Phnom Penh	18
407	Pingxiang	23
408	Pjatigorsk	80
409	Plock	76
410	Po	15
411	Ponce	77
412	Pontianak	45
413	Poos de Caldas	15
414	Portoviejo	28
415	Probolinggo	45
416	Pudukkottai	44
417	Pune	44
418	Purnea (Purnia)	44
419	Purwakarta	45
420	Pyongyang	70
421	Qalyub	29
422	Qinhuangdao	23
423	Qomsheh	46
424	Quilmes	6
425	Rae Bareli	44
426	Rajkot	44
427	Rampur	44
428	Rancagua	22
429	Ranchi	44
430	Richmond Hill	20
431	Rio Claro	15
432	Rizhao	23
433	Roanoke	103
434	Robamba	28
435	Rockford	103
436	Ruse	17
437	Rustenburg	85
438	s-Hertogenbosch	67
439	Saarbrcken	38
440	Sagamihara	50
441	Saint Louis	103
442	Saint-Denis	79
443	Sal	62
444	Salala	71
445	Salamanca	60
446	Salinas	103
447	Salzburg	9
448	Sambhal	44
449	San Bernardino	103
450	San Felipe de Puerto Plata	27
451	San Felipe del Progreso	60
452	San Juan Bautista Tuxtepec	60
453	San Lorenzo	73
454	San Miguel de Tucumn	6
455	Sanaa	107
456	Santa Brbara dOeste	15
457	Santa F	6
458	Santa Rosa	75
459	Santiago de Compostela	87
460	Santiago de los Caballeros	27
461	Santo Andr	15
462	Sanya	23
463	Sasebo	50
464	Satna	44
465	Sawhaj	29
466	Serpuhov	80
467	Shahr-e Kord	46
468	Shanwei	23
469	Shaoguan	23
470	Sharja	101
471	Shenzhen	23
472	Shikarpur	72
473	Shimoga	44
474	Shimonoseki	50
475	Shivapuri	44
476	Shubra al-Khayma	29
477	Siegen	38
478	Siliguri (Shiliguri)	44
479	Simferopol	100
480	Sincelejo	24
481	Sirjan	46
482	Sivas	97
483	Skikda	2
484	Smolensk	80
485	So Bernardo do Campo	15
486	So Leopoldo	15
487	Sogamoso	24
488	Sokoto	69
489	Songkhla	94
490	Sorocaba	15
491	Soshanguve	85
492	Sousse	96
493	South Hill	5
494	Southampton	102
495	Southend-on-Sea	102
496	Southport	102
497	Springs	85
498	Stara Zagora	17
499	Sterling Heights	103
500	Stockport	102
501	Sucre	14
502	Suihua	23
503	Sullana	74
504	Sultanbeyli	97
505	Sumqayit	10
506	Sumy	100
507	Sungai Petani	59
508	Sunnyvale	103
509	Surakarta	45
510	Syktyvkar	80
511	Syrakusa	49
512	Szkesfehrvr	43
513	Tabora	93
514	Tabriz	46
515	Tabuk	82
516	Tafuna	3
517	Taguig	75
518	Taizz	107
519	Talavera	75
520	Tallahassee	103
521	Tama	50
522	Tambaram	44
523	Tanauan	75
524	Tandil	6
525	Tangail	12
526	Tanshui	92
527	Tanza	75
528	Tarlac	75
529	Tarsus	97
530	Tartu	30
531	Teboksary	80
532	Tegal	45
533	Tel Aviv-Jaffa	48
534	Tete	63
535	Tianjin	23
536	Tiefa	23
537	Tieli	23
538	Tokat	97
539	Tonghae	86
540	Tongliao	23
541	Torren	60
542	Touliu	92
543	Toulon	34
544	Toulouse	34
545	Trshavn	32
546	Tsaotun	92
547	Tsuyama	50
548	Tuguegarao	75
549	Tychy	76
550	Udaipur	44
551	Udine	49
552	Ueda	50
553	Uijongbu	86
554	Uluberia	44
555	Urawa	50
556	Uruapan	60
557	Usak	97
558	Usolje-Sibirskoje	80
559	Uttarpara-Kotrung	44
560	Vaduz	55
561	Valencia	104
562	Valle de la Pascua	104
563	Valle de Santiago	60
564	Valparai	44
565	Vancouver	20
566	Varanasi (Benares)	44
567	Vicente Lpez	6
568	Vijayawada	44
569	Vila Velha	15
570	Vilnius	56
571	Vinh	105
572	Vitria de Santo Anto	15
573	Warren	103
574	Weifang	23
575	Witten	38
576	Woodridge	8
577	Wroclaw	76
578	Xiangfan	23
579	Xiangtan	23
580	Xintai	23
581	Xinxiang	23
582	Yamuna Nagar	44
583	Yangor	65
584	Yantai	23
585	Yaound	19
586	Yerevan	7
587	Yinchuan	23
588	Yingkou	23
589	York	102
590	Yuncheng	23
591	Yuzhou	23
592	Zalantun	23
593	Zanzibar	93
594	Zaoyang	23
595	Zapopan	60
596	Zaria	69
597	Zeleznogorsk	80
598	Zhezqazghan	51
599	Zhoushan	23
600	Ziguinchor	83
\.


--
-- TOC entry 2966 (class 0 OID 18439)
-- Dependencies: 205
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (country_id, country) FROM stdin;
1	Afghanistan
2	Algeria
3	American Samoa
4	Angola
5	Anguilla
6	Argentina
7	Armenia
8	Australia
9	Austria
10	Azerbaijan
11	Bahrain
12	Bangladesh
13	Belarus
14	Bolivia
15	Brazil
16	Brunei
17	Bulgaria
18	Cambodia
19	Cameroon
20	Canada
21	Chad
22	Chile
23	China
24	Colombia
25	Congo, The Democratic Republic of the
26	Czech Republic
27	Dominican Republic
28	Ecuador
29	Egypt
30	Estonia
31	Ethiopia
32	Faroe Islands
33	Finland
34	France
35	French Guiana
36	French Polynesia
37	Gambia
38	Germany
39	Greece
40	Greenland
41	Holy See (Vatican City State)
42	Hong Kong
43	Hungary
44	India
45	Indonesia
46	Iran
47	Iraq
48	Israel
49	Italy
50	Japan
51	Kazakstan
52	Kenya
53	Kuwait
54	Latvia
55	Liechtenstein
56	Lithuania
57	Madagascar
58	Malawi
59	Malaysia
60	Mexico
61	Moldova
62	Morocco
63	Mozambique
64	Myanmar
65	Nauru
66	Nepal
67	Netherlands
68	New Zealand
69	Nigeria
70	North Korea
71	Oman
72	Pakistan
73	Paraguay
74	Peru
75	Philippines
76	Poland
77	Puerto Rico
78	Romania
79	Runion
80	Russian Federation
81	Saint Vincent and the Grenadines
82	Saudi Arabia
83	Senegal
84	Slovakia
85	South Africa
86	South Korea
87	Spain
88	Sri Lanka
89	Sudan
90	Sweden
91	Switzerland
92	Taiwan
93	Tanzania
94	Thailand
95	Tonga
96	Tunisia
97	Turkey
98	Turkmenistan
99	Tuvalu
100	Ukraine
101	United Arab Emirates
102	United Kingdom
103	United States
104	Venezuela
105	Vietnam
106	Virgin Islands, U.S.
107	Yemen
108	Yugoslavia
109	Zambia
\.


--
-- TOC entry 2968 (class 0 OID 18446)
-- Dependencies: 207
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, active) FROM stdin;
524	1	Jared	Ely	jared.ely@sakilacustomer.org	530	t	1
1	1	Mary	Smith	mary.smith@sakilacustomer.org	5	t	1
2	1	Patricia	Johnson	patricia.johnson@sakilacustomer.org	6	t	1
3	1	Linda	Williams	linda.williams@sakilacustomer.org	7	t	1
4	2	Barbara	Jones	barbara.jones@sakilacustomer.org	8	t	1
5	1	Elizabeth	Brown	elizabeth.brown@sakilacustomer.org	9	t	1
6	2	Jennifer	Davis	jennifer.davis@sakilacustomer.org	10	t	1
7	1	Maria	Miller	maria.miller@sakilacustomer.org	11	t	1
8	2	Susan	Wilson	susan.wilson@sakilacustomer.org	12	t	1
9	2	Margaret	Moore	margaret.moore@sakilacustomer.org	13	t	1
10	1	Dorothy	Taylor	dorothy.taylor@sakilacustomer.org	14	t	1
11	2	Lisa	Anderson	lisa.anderson@sakilacustomer.org	15	t	1
12	1	Nancy	Thomas	nancy.thomas@sakilacustomer.org	16	t	1
13	2	Karen	Jackson	karen.jackson@sakilacustomer.org	17	t	1
14	2	Betty	White	betty.white@sakilacustomer.org	18	t	1
15	1	Helen	Harris	helen.harris@sakilacustomer.org	19	t	1
16	2	Sandra	Martin	sandra.martin@sakilacustomer.org	20	t	0
17	1	Donna	Thompson	donna.thompson@sakilacustomer.org	21	t	1
18	2	Carol	Garcia	carol.garcia@sakilacustomer.org	22	t	1
19	1	Ruth	Martinez	ruth.martinez@sakilacustomer.org	23	t	1
20	2	Sharon	Robinson	sharon.robinson@sakilacustomer.org	24	t	1
21	1	Michelle	Clark	michelle.clark@sakilacustomer.org	25	t	1
22	1	Laura	Rodriguez	laura.rodriguez@sakilacustomer.org	26	t	1
23	2	Sarah	Lewis	sarah.lewis@sakilacustomer.org	27	t	1
24	2	Kimberly	Lee	kimberly.lee@sakilacustomer.org	28	t	1
25	1	Deborah	Walker	deborah.walker@sakilacustomer.org	29	t	1
26	2	Jessica	Hall	jessica.hall@sakilacustomer.org	30	t	1
27	2	Shirley	Allen	shirley.allen@sakilacustomer.org	31	t	1
28	1	Cynthia	Young	cynthia.young@sakilacustomer.org	32	t	1
29	2	Angela	Hernandez	angela.hernandez@sakilacustomer.org	33	t	1
30	1	Melissa	King	melissa.king@sakilacustomer.org	34	t	1
31	2	Brenda	Wright	brenda.wright@sakilacustomer.org	35	t	1
32	1	Amy	Lopez	amy.lopez@sakilacustomer.org	36	t	1
33	2	Anna	Hill	anna.hill@sakilacustomer.org	37	t	1
34	2	Rebecca	Scott	rebecca.scott@sakilacustomer.org	38	t	1
35	2	Virginia	Green	virginia.green@sakilacustomer.org	39	t	1
36	2	Kathleen	Adams	kathleen.adams@sakilacustomer.org	40	t	1
37	1	Pamela	Baker	pamela.baker@sakilacustomer.org	41	t	1
38	1	Martha	Gonzalez	martha.gonzalez@sakilacustomer.org	42	t	1
39	1	Debra	Nelson	debra.nelson@sakilacustomer.org	43	t	1
40	2	Amanda	Carter	amanda.carter@sakilacustomer.org	44	t	1
41	1	Stephanie	Mitchell	stephanie.mitchell@sakilacustomer.org	45	t	1
42	2	Carolyn	Perez	carolyn.perez@sakilacustomer.org	46	t	1
43	2	Christine	Roberts	christine.roberts@sakilacustomer.org	47	t	1
44	1	Marie	Turner	marie.turner@sakilacustomer.org	48	t	1
45	1	Janet	Phillips	janet.phillips@sakilacustomer.org	49	t	1
46	2	Catherine	Campbell	catherine.campbell@sakilacustomer.org	50	t	1
47	1	Frances	Parker	frances.parker@sakilacustomer.org	51	t	1
48	1	Ann	Evans	ann.evans@sakilacustomer.org	52	t	1
49	2	Joyce	Edwards	joyce.edwards@sakilacustomer.org	53	t	1
50	1	Diane	Collins	diane.collins@sakilacustomer.org	54	t	1
51	1	Alice	Stewart	alice.stewart@sakilacustomer.org	55	t	1
52	1	Julie	Sanchez	julie.sanchez@sakilacustomer.org	56	t	1
53	1	Heather	Morris	heather.morris@sakilacustomer.org	57	t	1
54	1	Teresa	Rogers	teresa.rogers@sakilacustomer.org	58	t	1
55	2	Doris	Reed	doris.reed@sakilacustomer.org	59	t	1
56	1	Gloria	Cook	gloria.cook@sakilacustomer.org	60	t	1
57	2	Evelyn	Morgan	evelyn.morgan@sakilacustomer.org	61	t	1
58	1	Jean	Bell	jean.bell@sakilacustomer.org	62	t	1
59	1	Cheryl	Murphy	cheryl.murphy@sakilacustomer.org	63	t	1
60	1	Mildred	Bailey	mildred.bailey@sakilacustomer.org	64	t	1
61	2	Katherine	Rivera	katherine.rivera@sakilacustomer.org	65	t	1
62	1	Joan	Cooper	joan.cooper@sakilacustomer.org	66	t	1
63	1	Ashley	Richardson	ashley.richardson@sakilacustomer.org	67	t	1
64	2	Judith	Cox	judith.cox@sakilacustomer.org	68	t	0
65	2	Rose	Howard	rose.howard@sakilacustomer.org	69	t	1
66	2	Janice	Ward	janice.ward@sakilacustomer.org	70	t	1
67	1	Kelly	Torres	kelly.torres@sakilacustomer.org	71	t	1
68	1	Nicole	Peterson	nicole.peterson@sakilacustomer.org	72	t	1
69	2	Judy	Gray	judy.gray@sakilacustomer.org	73	t	1
70	2	Christina	Ramirez	christina.ramirez@sakilacustomer.org	74	t	1
71	1	Kathy	James	kathy.james@sakilacustomer.org	75	t	1
72	2	Theresa	Watson	theresa.watson@sakilacustomer.org	76	t	1
73	2	Beverly	Brooks	beverly.brooks@sakilacustomer.org	77	t	1
74	1	Denise	Kelly	denise.kelly@sakilacustomer.org	78	t	1
75	2	Tammy	Sanders	tammy.sanders@sakilacustomer.org	79	t	1
76	2	Irene	Price	irene.price@sakilacustomer.org	80	t	1
77	2	Jane	Bennett	jane.bennett@sakilacustomer.org	81	t	1
78	1	Lori	Wood	lori.wood@sakilacustomer.org	82	t	1
79	1	Rachel	Barnes	rachel.barnes@sakilacustomer.org	83	t	1
80	1	Marilyn	Ross	marilyn.ross@sakilacustomer.org	84	t	1
81	1	Andrea	Henderson	andrea.henderson@sakilacustomer.org	85	t	1
82	1	Kathryn	Coleman	kathryn.coleman@sakilacustomer.org	86	t	1
83	1	Louise	Jenkins	louise.jenkins@sakilacustomer.org	87	t	1
84	2	Sara	Perry	sara.perry@sakilacustomer.org	88	t	1
85	2	Anne	Powell	anne.powell@sakilacustomer.org	89	t	1
86	2	Jacqueline	Long	jacqueline.long@sakilacustomer.org	90	t	1
87	1	Wanda	Patterson	wanda.patterson@sakilacustomer.org	91	t	1
88	2	Bonnie	Hughes	bonnie.hughes@sakilacustomer.org	92	t	1
89	1	Julia	Flores	julia.flores@sakilacustomer.org	93	t	1
90	2	Ruby	Washington	ruby.washington@sakilacustomer.org	94	t	1
91	2	Lois	Butler	lois.butler@sakilacustomer.org	95	t	1
92	2	Tina	Simmons	tina.simmons@sakilacustomer.org	96	t	1
93	1	Phyllis	Foster	phyllis.foster@sakilacustomer.org	97	t	1
94	1	Norma	Gonzales	norma.gonzales@sakilacustomer.org	98	t	1
95	2	Paula	Bryant	paula.bryant@sakilacustomer.org	99	t	1
96	1	Diana	Alexander	diana.alexander@sakilacustomer.org	100	t	1
97	2	Annie	Russell	annie.russell@sakilacustomer.org	101	t	1
98	1	Lillian	Griffin	lillian.griffin@sakilacustomer.org	102	t	1
99	2	Emily	Diaz	emily.diaz@sakilacustomer.org	103	t	1
100	1	Robin	Hayes	robin.hayes@sakilacustomer.org	104	t	1
101	1	Peggy	Myers	peggy.myers@sakilacustomer.org	105	t	1
102	1	Crystal	Ford	crystal.ford@sakilacustomer.org	106	t	1
103	1	Gladys	Hamilton	gladys.hamilton@sakilacustomer.org	107	t	1
104	1	Rita	Graham	rita.graham@sakilacustomer.org	108	t	1
105	1	Dawn	Sullivan	dawn.sullivan@sakilacustomer.org	109	t	1
106	1	Connie	Wallace	connie.wallace@sakilacustomer.org	110	t	1
107	1	Florence	Woods	florence.woods@sakilacustomer.org	111	t	1
108	1	Tracy	Cole	tracy.cole@sakilacustomer.org	112	t	1
109	2	Edna	West	edna.west@sakilacustomer.org	113	t	1
110	2	Tiffany	Jordan	tiffany.jordan@sakilacustomer.org	114	t	1
111	1	Carmen	Owens	carmen.owens@sakilacustomer.org	115	t	1
112	2	Rosa	Reynolds	rosa.reynolds@sakilacustomer.org	116	t	1
113	2	Cindy	Fisher	cindy.fisher@sakilacustomer.org	117	t	1
114	2	Grace	Ellis	grace.ellis@sakilacustomer.org	118	t	1
115	1	Wendy	Harrison	wendy.harrison@sakilacustomer.org	119	t	1
116	1	Victoria	Gibson	victoria.gibson@sakilacustomer.org	120	t	1
117	1	Edith	Mcdonald	edith.mcdonald@sakilacustomer.org	121	t	1
118	1	Kim	Cruz	kim.cruz@sakilacustomer.org	122	t	1
119	1	Sherry	Marshall	sherry.marshall@sakilacustomer.org	123	t	1
120	2	Sylvia	Ortiz	sylvia.ortiz@sakilacustomer.org	124	t	1
121	1	Josephine	Gomez	josephine.gomez@sakilacustomer.org	125	t	1
122	1	Thelma	Murray	thelma.murray@sakilacustomer.org	126	t	1
123	2	Shannon	Freeman	shannon.freeman@sakilacustomer.org	127	t	1
124	1	Sheila	Wells	sheila.wells@sakilacustomer.org	128	t	0
125	1	Ethel	Webb	ethel.webb@sakilacustomer.org	129	t	1
126	1	Ellen	Simpson	ellen.simpson@sakilacustomer.org	130	t	1
127	2	Elaine	Stevens	elaine.stevens@sakilacustomer.org	131	t	1
128	1	Marjorie	Tucker	marjorie.tucker@sakilacustomer.org	132	t	1
129	1	Carrie	Porter	carrie.porter@sakilacustomer.org	133	t	1
130	1	Charlotte	Hunter	charlotte.hunter@sakilacustomer.org	134	t	1
131	2	Monica	Hicks	monica.hicks@sakilacustomer.org	135	t	1
132	2	Esther	Crawford	esther.crawford@sakilacustomer.org	136	t	1
133	1	Pauline	Henry	pauline.henry@sakilacustomer.org	137	t	1
134	1	Emma	Boyd	emma.boyd@sakilacustomer.org	138	t	1
135	2	Juanita	Mason	juanita.mason@sakilacustomer.org	139	t	1
136	2	Anita	Morales	anita.morales@sakilacustomer.org	140	t	1
137	2	Rhonda	Kennedy	rhonda.kennedy@sakilacustomer.org	141	t	1
138	1	Hazel	Warren	hazel.warren@sakilacustomer.org	142	t	1
139	1	Amber	Dixon	amber.dixon@sakilacustomer.org	143	t	1
140	1	Eva	Ramos	eva.ramos@sakilacustomer.org	144	t	1
141	1	Debbie	Reyes	debbie.reyes@sakilacustomer.org	145	t	1
142	1	April	Burns	april.burns@sakilacustomer.org	146	t	1
143	1	Leslie	Gordon	leslie.gordon@sakilacustomer.org	147	t	1
144	1	Clara	Shaw	clara.shaw@sakilacustomer.org	148	t	1
145	1	Lucille	Holmes	lucille.holmes@sakilacustomer.org	149	t	1
146	1	Jamie	Rice	jamie.rice@sakilacustomer.org	150	t	1
147	2	Joanne	Robertson	joanne.robertson@sakilacustomer.org	151	t	1
148	1	Eleanor	Hunt	eleanor.hunt@sakilacustomer.org	152	t	1
149	1	Valerie	Black	valerie.black@sakilacustomer.org	153	t	1
150	2	Danielle	Daniels	danielle.daniels@sakilacustomer.org	154	t	1
151	2	Megan	Palmer	megan.palmer@sakilacustomer.org	155	t	1
152	1	Alicia	Mills	alicia.mills@sakilacustomer.org	156	t	1
153	2	Suzanne	Nichols	suzanne.nichols@sakilacustomer.org	157	t	1
154	2	Michele	Grant	michele.grant@sakilacustomer.org	158	t	1
155	1	Gail	Knight	gail.knight@sakilacustomer.org	159	t	1
156	1	Bertha	Ferguson	bertha.ferguson@sakilacustomer.org	160	t	1
157	2	Darlene	Rose	darlene.rose@sakilacustomer.org	161	t	1
158	1	Veronica	Stone	veronica.stone@sakilacustomer.org	162	t	1
159	1	Jill	Hawkins	jill.hawkins@sakilacustomer.org	163	t	1
160	2	Erin	Dunn	erin.dunn@sakilacustomer.org	164	t	1
161	1	Geraldine	Perkins	geraldine.perkins@sakilacustomer.org	165	t	1
162	2	Lauren	Hudson	lauren.hudson@sakilacustomer.org	166	t	1
163	1	Cathy	Spencer	cathy.spencer@sakilacustomer.org	167	t	1
164	2	Joann	Gardner	joann.gardner@sakilacustomer.org	168	t	1
165	2	Lorraine	Stephens	lorraine.stephens@sakilacustomer.org	169	t	1
166	1	Lynn	Payne	lynn.payne@sakilacustomer.org	170	t	1
167	2	Sally	Pierce	sally.pierce@sakilacustomer.org	171	t	1
168	1	Regina	Berry	regina.berry@sakilacustomer.org	172	t	1
169	2	Erica	Matthews	erica.matthews@sakilacustomer.org	173	t	0
170	1	Beatrice	Arnold	beatrice.arnold@sakilacustomer.org	174	t	1
171	2	Dolores	Wagner	dolores.wagner@sakilacustomer.org	175	t	1
172	1	Bernice	Willis	bernice.willis@sakilacustomer.org	176	t	1
173	1	Audrey	Ray	audrey.ray@sakilacustomer.org	177	t	1
174	2	Yvonne	Watkins	yvonne.watkins@sakilacustomer.org	178	t	1
175	1	Annette	Olson	annette.olson@sakilacustomer.org	179	t	1
176	1	June	Carroll	june.carroll@sakilacustomer.org	180	t	1
177	2	Samantha	Duncan	samantha.duncan@sakilacustomer.org	181	t	1
178	2	Marion	Snyder	marion.snyder@sakilacustomer.org	182	t	1
179	1	Dana	Hart	dana.hart@sakilacustomer.org	183	t	1
180	2	Stacy	Cunningham	stacy.cunningham@sakilacustomer.org	184	t	1
181	2	Ana	Bradley	ana.bradley@sakilacustomer.org	185	t	1
182	1	Renee	Lane	renee.lane@sakilacustomer.org	186	t	1
183	2	Ida	Andrews	ida.andrews@sakilacustomer.org	187	t	1
184	1	Vivian	Ruiz	vivian.ruiz@sakilacustomer.org	188	t	1
185	1	Roberta	Harper	roberta.harper@sakilacustomer.org	189	t	1
186	2	Holly	Fox	holly.fox@sakilacustomer.org	190	t	1
187	2	Brittany	Riley	brittany.riley@sakilacustomer.org	191	t	1
188	1	Melanie	Armstrong	melanie.armstrong@sakilacustomer.org	192	t	1
189	1	Loretta	Carpenter	loretta.carpenter@sakilacustomer.org	193	t	1
190	2	Yolanda	Weaver	yolanda.weaver@sakilacustomer.org	194	t	1
191	1	Jeanette	Greene	jeanette.greene@sakilacustomer.org	195	t	1
192	1	Laurie	Lawrence	laurie.lawrence@sakilacustomer.org	196	t	1
193	2	Katie	Elliott	katie.elliott@sakilacustomer.org	197	t	1
194	2	Kristen	Chavez	kristen.chavez@sakilacustomer.org	198	t	1
195	1	Vanessa	Sims	vanessa.sims@sakilacustomer.org	199	t	1
196	1	Alma	Austin	alma.austin@sakilacustomer.org	200	t	1
197	2	Sue	Peters	sue.peters@sakilacustomer.org	201	t	1
198	2	Elsie	Kelley	elsie.kelley@sakilacustomer.org	202	t	1
199	2	Beth	Franklin	beth.franklin@sakilacustomer.org	203	t	1
200	2	Jeanne	Lawson	jeanne.lawson@sakilacustomer.org	204	t	1
201	1	Vicki	Fields	vicki.fields@sakilacustomer.org	205	t	1
202	2	Carla	Gutierrez	carla.gutierrez@sakilacustomer.org	206	t	1
203	1	Tara	Ryan	tara.ryan@sakilacustomer.org	207	t	1
204	1	Rosemary	Schmidt	rosemary.schmidt@sakilacustomer.org	208	t	1
205	2	Eileen	Carr	eileen.carr@sakilacustomer.org	209	t	1
206	1	Terri	Vasquez	terri.vasquez@sakilacustomer.org	210	t	1
207	1	Gertrude	Castillo	gertrude.castillo@sakilacustomer.org	211	t	1
208	1	Lucy	Wheeler	lucy.wheeler@sakilacustomer.org	212	t	1
209	2	Tonya	Chapman	tonya.chapman@sakilacustomer.org	213	t	1
210	2	Ella	Oliver	ella.oliver@sakilacustomer.org	214	t	1
211	1	Stacey	Montgomery	stacey.montgomery@sakilacustomer.org	215	t	1
212	2	Wilma	Richards	wilma.richards@sakilacustomer.org	216	t	1
213	1	Gina	Williamson	gina.williamson@sakilacustomer.org	217	t	1
214	1	Kristin	Johnston	kristin.johnston@sakilacustomer.org	218	t	1
215	2	Jessie	Banks	jessie.banks@sakilacustomer.org	219	t	1
216	1	Natalie	Meyer	natalie.meyer@sakilacustomer.org	220	t	1
217	2	Agnes	Bishop	agnes.bishop@sakilacustomer.org	221	t	1
218	1	Vera	Mccoy	vera.mccoy@sakilacustomer.org	222	t	1
219	2	Willie	Howell	willie.howell@sakilacustomer.org	223	t	1
220	2	Charlene	Alvarez	charlene.alvarez@sakilacustomer.org	224	t	1
221	1	Bessie	Morrison	bessie.morrison@sakilacustomer.org	225	t	1
222	2	Delores	Hansen	delores.hansen@sakilacustomer.org	226	t	1
223	1	Melinda	Fernandez	melinda.fernandez@sakilacustomer.org	227	t	1
224	2	Pearl	Garza	pearl.garza@sakilacustomer.org	228	t	1
225	1	Arlene	Harvey	arlene.harvey@sakilacustomer.org	229	t	1
226	2	Maureen	Little	maureen.little@sakilacustomer.org	230	t	1
227	1	Colleen	Burton	colleen.burton@sakilacustomer.org	231	t	1
228	2	Allison	Stanley	allison.stanley@sakilacustomer.org	232	t	1
229	1	Tamara	Nguyen	tamara.nguyen@sakilacustomer.org	233	t	1
230	2	Joy	George	joy.george@sakilacustomer.org	234	t	1
231	1	Georgia	Jacobs	georgia.jacobs@sakilacustomer.org	235	t	1
232	2	Constance	Reid	constance.reid@sakilacustomer.org	236	t	1
233	2	Lillie	Kim	lillie.kim@sakilacustomer.org	237	t	1
234	1	Claudia	Fuller	claudia.fuller@sakilacustomer.org	238	t	1
235	1	Jackie	Lynch	jackie.lynch@sakilacustomer.org	239	t	1
236	1	Marcia	Dean	marcia.dean@sakilacustomer.org	240	t	1
237	1	Tanya	Gilbert	tanya.gilbert@sakilacustomer.org	241	t	1
238	1	Nellie	Garrett	nellie.garrett@sakilacustomer.org	242	t	1
239	2	Minnie	Romero	minnie.romero@sakilacustomer.org	243	t	1
240	1	Marlene	Welch	marlene.welch@sakilacustomer.org	244	t	1
241	2	Heidi	Larson	heidi.larson@sakilacustomer.org	245	t	0
242	1	Glenda	Frazier	glenda.frazier@sakilacustomer.org	246	t	1
243	1	Lydia	Burke	lydia.burke@sakilacustomer.org	247	t	1
244	2	Viola	Hanson	viola.hanson@sakilacustomer.org	248	t	1
245	1	Courtney	Day	courtney.day@sakilacustomer.org	249	t	1
246	1	Marian	Mendoza	marian.mendoza@sakilacustomer.org	250	t	1
247	1	Stella	Moreno	stella.moreno@sakilacustomer.org	251	t	1
248	1	Caroline	Bowman	caroline.bowman@sakilacustomer.org	252	t	1
249	2	Dora	Medina	dora.medina@sakilacustomer.org	253	t	1
250	2	Jo	Fowler	jo.fowler@sakilacustomer.org	254	t	1
251	2	Vickie	Brewer	vickie.brewer@sakilacustomer.org	255	t	1
252	2	Mattie	Hoffman	mattie.hoffman@sakilacustomer.org	256	t	1
253	1	Terry	Carlson	terry.carlson@sakilacustomer.org	258	t	1
254	2	Maxine	Silva	maxine.silva@sakilacustomer.org	259	t	1
255	2	Irma	Pearson	irma.pearson@sakilacustomer.org	260	t	1
256	2	Mabel	Holland	mabel.holland@sakilacustomer.org	261	t	1
257	2	Marsha	Douglas	marsha.douglas@sakilacustomer.org	262	t	1
258	1	Myrtle	Fleming	myrtle.fleming@sakilacustomer.org	263	t	1
259	2	Lena	Jensen	lena.jensen@sakilacustomer.org	264	t	1
260	1	Christy	Vargas	christy.vargas@sakilacustomer.org	265	t	1
261	1	Deanna	Byrd	deanna.byrd@sakilacustomer.org	266	t	1
262	2	Patsy	Davidson	patsy.davidson@sakilacustomer.org	267	t	1
263	1	Hilda	Hopkins	hilda.hopkins@sakilacustomer.org	268	t	1
264	1	Gwendolyn	May	gwendolyn.may@sakilacustomer.org	269	t	1
265	2	Jennie	Terry	jennie.terry@sakilacustomer.org	270	t	1
266	2	Nora	Herrera	nora.herrera@sakilacustomer.org	271	t	1
267	1	Margie	Wade	margie.wade@sakilacustomer.org	272	t	1
268	1	Nina	Soto	nina.soto@sakilacustomer.org	273	t	1
269	1	Cassandra	Walters	cassandra.walters@sakilacustomer.org	274	t	1
270	1	Leah	Curtis	leah.curtis@sakilacustomer.org	275	t	1
271	1	Penny	Neal	penny.neal@sakilacustomer.org	276	t	0
272	1	Kay	Caldwell	kay.caldwell@sakilacustomer.org	277	t	1
273	2	Priscilla	Lowe	priscilla.lowe@sakilacustomer.org	278	t	1
274	1	Naomi	Jennings	naomi.jennings@sakilacustomer.org	279	t	1
275	2	Carole	Barnett	carole.barnett@sakilacustomer.org	280	t	1
276	1	Brandy	Graves	brandy.graves@sakilacustomer.org	281	t	1
277	2	Olga	Jimenez	olga.jimenez@sakilacustomer.org	282	t	1
278	2	Billie	Horton	billie.horton@sakilacustomer.org	283	t	1
279	2	Dianne	Shelton	dianne.shelton@sakilacustomer.org	284	t	1
280	2	Tracey	Barrett	tracey.barrett@sakilacustomer.org	285	t	1
281	2	Leona	Obrien	leona.obrien@sakilacustomer.org	286	t	1
282	2	Jenny	Castro	jenny.castro@sakilacustomer.org	287	t	1
283	1	Felicia	Sutton	felicia.sutton@sakilacustomer.org	288	t	1
284	1	Sonia	Gregory	sonia.gregory@sakilacustomer.org	289	t	1
285	1	Miriam	Mckinney	miriam.mckinney@sakilacustomer.org	290	t	1
286	1	Velma	Lucas	velma.lucas@sakilacustomer.org	291	t	1
287	2	Becky	Miles	becky.miles@sakilacustomer.org	292	t	1
288	1	Bobbie	Craig	bobbie.craig@sakilacustomer.org	293	t	1
289	1	Violet	Rodriquez	violet.rodriquez@sakilacustomer.org	294	t	1
290	1	Kristina	Chambers	kristina.chambers@sakilacustomer.org	295	t	1
291	1	Toni	Holt	toni.holt@sakilacustomer.org	296	t	1
292	2	Misty	Lambert	misty.lambert@sakilacustomer.org	297	t	1
293	2	Mae	Fletcher	mae.fletcher@sakilacustomer.org	298	t	1
294	2	Shelly	Watts	shelly.watts@sakilacustomer.org	299	t	1
295	1	Daisy	Bates	daisy.bates@sakilacustomer.org	300	t	1
296	2	Ramona	Hale	ramona.hale@sakilacustomer.org	301	t	1
297	1	Sherri	Rhodes	sherri.rhodes@sakilacustomer.org	302	t	1
298	1	Erika	Pena	erika.pena@sakilacustomer.org	303	t	1
299	2	James	Gannon	james.gannon@sakilacustomer.org	304	t	1
300	1	John	Farnsworth	john.farnsworth@sakilacustomer.org	305	t	1
301	2	Robert	Baughman	robert.baughman@sakilacustomer.org	306	t	1
302	1	Michael	Silverman	michael.silverman@sakilacustomer.org	307	t	1
303	2	William	Satterfield	william.satterfield@sakilacustomer.org	308	t	1
304	2	David	Royal	david.royal@sakilacustomer.org	309	t	1
305	1	Richard	Mccrary	richard.mccrary@sakilacustomer.org	310	t	1
306	1	Charles	Kowalski	charles.kowalski@sakilacustomer.org	311	t	1
307	2	Joseph	Joy	joseph.joy@sakilacustomer.org	312	t	1
308	1	Thomas	Grigsby	thomas.grigsby@sakilacustomer.org	313	t	1
309	1	Christopher	Greco	christopher.greco@sakilacustomer.org	314	t	1
310	2	Daniel	Cabral	daniel.cabral@sakilacustomer.org	315	t	1
311	2	Paul	Trout	paul.trout@sakilacustomer.org	316	t	1
312	2	Mark	Rinehart	mark.rinehart@sakilacustomer.org	317	t	1
313	2	Donald	Mahon	donald.mahon@sakilacustomer.org	318	t	1
314	1	George	Linton	george.linton@sakilacustomer.org	319	t	1
315	2	Kenneth	Gooden	kenneth.gooden@sakilacustomer.org	320	t	0
316	1	Steven	Curley	steven.curley@sakilacustomer.org	321	t	1
317	2	Edward	Baugh	edward.baugh@sakilacustomer.org	322	t	1
318	1	Brian	Wyman	brian.wyman@sakilacustomer.org	323	t	1
319	2	Ronald	Weiner	ronald.weiner@sakilacustomer.org	324	t	1
320	2	Anthony	Schwab	anthony.schwab@sakilacustomer.org	325	t	1
321	1	Kevin	Schuler	kevin.schuler@sakilacustomer.org	326	t	1
322	1	Jason	Morrissey	jason.morrissey@sakilacustomer.org	327	t	1
323	2	Matthew	Mahan	matthew.mahan@sakilacustomer.org	328	t	1
324	2	Gary	Coy	gary.coy@sakilacustomer.org	329	t	1
325	1	Timothy	Bunn	timothy.bunn@sakilacustomer.org	330	t	1
326	1	Jose	Andrew	jose.andrew@sakilacustomer.org	331	t	1
327	2	Larry	Thrasher	larry.thrasher@sakilacustomer.org	332	t	1
328	2	Jeffrey	Spear	jeffrey.spear@sakilacustomer.org	333	t	1
329	2	Frank	Waggoner	frank.waggoner@sakilacustomer.org	334	t	1
330	1	Scott	Shelley	scott.shelley@sakilacustomer.org	335	t	1
331	1	Eric	Robert	eric.robert@sakilacustomer.org	336	t	1
332	1	Stephen	Qualls	stephen.qualls@sakilacustomer.org	337	t	1
333	2	Andrew	Purdy	andrew.purdy@sakilacustomer.org	338	t	1
334	2	Raymond	Mcwhorter	raymond.mcwhorter@sakilacustomer.org	339	t	1
335	1	Gregory	Mauldin	gregory.mauldin@sakilacustomer.org	340	t	1
336	1	Joshua	Mark	joshua.mark@sakilacustomer.org	341	t	1
337	1	Jerry	Jordon	jerry.jordon@sakilacustomer.org	342	t	1
338	1	Dennis	Gilman	dennis.gilman@sakilacustomer.org	343	t	1
339	2	Walter	Perryman	walter.perryman@sakilacustomer.org	344	t	1
340	1	Patrick	Newsom	patrick.newsom@sakilacustomer.org	345	t	1
341	1	Peter	Menard	peter.menard@sakilacustomer.org	346	t	1
342	1	Harold	Martino	harold.martino@sakilacustomer.org	347	t	1
343	1	Douglas	Graf	douglas.graf@sakilacustomer.org	348	t	1
344	1	Henry	Billingsley	henry.billingsley@sakilacustomer.org	349	t	1
345	1	Carl	Artis	carl.artis@sakilacustomer.org	350	t	1
346	1	Arthur	Simpkins	arthur.simpkins@sakilacustomer.org	351	t	1
347	2	Ryan	Salisbury	ryan.salisbury@sakilacustomer.org	352	t	1
348	2	Roger	Quintanilla	roger.quintanilla@sakilacustomer.org	353	t	1
349	2	Joe	Gilliland	joe.gilliland@sakilacustomer.org	354	t	1
350	1	Juan	Fraley	juan.fraley@sakilacustomer.org	355	t	1
351	1	Jack	Foust	jack.foust@sakilacustomer.org	356	t	1
352	1	Albert	Crouse	albert.crouse@sakilacustomer.org	357	t	1
353	1	Jonathan	Scarborough	jonathan.scarborough@sakilacustomer.org	358	t	1
354	2	Justin	Ngo	justin.ngo@sakilacustomer.org	359	t	1
355	2	Terry	Grissom	terry.grissom@sakilacustomer.org	360	t	1
356	2	Gerald	Fultz	gerald.fultz@sakilacustomer.org	361	t	1
357	1	Keith	Rico	keith.rico@sakilacustomer.org	362	t	1
358	2	Samuel	Marlow	samuel.marlow@sakilacustomer.org	363	t	1
359	2	Willie	Markham	willie.markham@sakilacustomer.org	364	t	1
360	2	Ralph	Madrigal	ralph.madrigal@sakilacustomer.org	365	t	1
361	2	Lawrence	Lawton	lawrence.lawton@sakilacustomer.org	366	t	1
362	1	Nicholas	Barfield	nicholas.barfield@sakilacustomer.org	367	t	1
363	2	Roy	Whiting	roy.whiting@sakilacustomer.org	368	t	1
364	1	Benjamin	Varney	benjamin.varney@sakilacustomer.org	369	t	1
365	2	Bruce	Schwarz	bruce.schwarz@sakilacustomer.org	370	t	1
366	1	Brandon	Huey	brandon.huey@sakilacustomer.org	371	t	1
367	1	Adam	Gooch	adam.gooch@sakilacustomer.org	372	t	1
368	1	Harry	Arce	harry.arce@sakilacustomer.org	373	t	0
369	2	Fred	Wheat	fred.wheat@sakilacustomer.org	374	t	1
370	2	Wayne	Truong	wayne.truong@sakilacustomer.org	375	t	1
371	1	Billy	Poulin	billy.poulin@sakilacustomer.org	376	t	1
372	2	Steve	Mackenzie	steve.mackenzie@sakilacustomer.org	377	t	1
373	1	Louis	Leone	louis.leone@sakilacustomer.org	378	t	1
374	2	Jeremy	Hurtado	jeremy.hurtado@sakilacustomer.org	379	t	1
375	2	Aaron	Selby	aaron.selby@sakilacustomer.org	380	t	1
376	1	Randy	Gaither	randy.gaither@sakilacustomer.org	381	t	1
377	1	Howard	Fortner	howard.fortner@sakilacustomer.org	382	t	1
378	1	Eugene	Culpepper	eugene.culpepper@sakilacustomer.org	383	t	1
379	1	Carlos	Coughlin	carlos.coughlin@sakilacustomer.org	384	t	1
380	1	Russell	Brinson	russell.brinson@sakilacustomer.org	385	t	1
381	2	Bobby	Boudreau	bobby.boudreau@sakilacustomer.org	386	t	1
382	2	Victor	Barkley	victor.barkley@sakilacustomer.org	387	t	1
383	1	Martin	Bales	martin.bales@sakilacustomer.org	388	t	1
384	2	Ernest	Stepp	ernest.stepp@sakilacustomer.org	389	t	1
385	1	Phillip	Holm	phillip.holm@sakilacustomer.org	390	t	1
386	1	Todd	Tan	todd.tan@sakilacustomer.org	391	t	1
387	2	Jesse	Schilling	jesse.schilling@sakilacustomer.org	392	t	1
388	2	Craig	Morrell	craig.morrell@sakilacustomer.org	393	t	1
389	1	Alan	Kahn	alan.kahn@sakilacustomer.org	394	t	1
390	1	Shawn	Heaton	shawn.heaton@sakilacustomer.org	395	t	1
391	1	Clarence	Gamez	clarence.gamez@sakilacustomer.org	396	t	1
392	2	Sean	Douglass	sean.douglass@sakilacustomer.org	397	t	1
393	1	Philip	Causey	philip.causey@sakilacustomer.org	398	t	1
394	2	Chris	Brothers	chris.brothers@sakilacustomer.org	399	t	1
395	2	Johnny	Turpin	johnny.turpin@sakilacustomer.org	400	t	1
396	1	Earl	Shanks	earl.shanks@sakilacustomer.org	401	t	1
397	1	Jimmy	Schrader	jimmy.schrader@sakilacustomer.org	402	t	1
398	1	Antonio	Meek	antonio.meek@sakilacustomer.org	403	t	1
399	1	Danny	Isom	danny.isom@sakilacustomer.org	404	t	1
400	2	Bryan	Hardison	bryan.hardison@sakilacustomer.org	405	t	1
401	2	Tony	Carranza	tony.carranza@sakilacustomer.org	406	t	1
402	1	Luis	Yanez	luis.yanez@sakilacustomer.org	407	t	1
403	1	Mike	Way	mike.way@sakilacustomer.org	408	t	1
404	2	Stanley	Scroggins	stanley.scroggins@sakilacustomer.org	409	t	1
405	1	Leonard	Schofield	leonard.schofield@sakilacustomer.org	410	t	1
406	1	Nathan	Runyon	nathan.runyon@sakilacustomer.org	411	t	0
407	1	Dale	Ratcliff	dale.ratcliff@sakilacustomer.org	412	t	1
408	1	Manuel	Murrell	manuel.murrell@sakilacustomer.org	413	t	1
409	2	Rodney	Moeller	rodney.moeller@sakilacustomer.org	414	t	1
410	2	Curtis	Irby	curtis.irby@sakilacustomer.org	415	t	1
411	1	Norman	Currier	norman.currier@sakilacustomer.org	416	t	1
412	2	Allen	Butterfield	allen.butterfield@sakilacustomer.org	417	t	1
413	2	Marvin	Yee	marvin.yee@sakilacustomer.org	418	t	1
414	1	Vincent	Ralston	vincent.ralston@sakilacustomer.org	419	t	1
415	1	Glenn	Pullen	glenn.pullen@sakilacustomer.org	420	t	1
416	2	Jeffery	Pinson	jeffery.pinson@sakilacustomer.org	421	t	1
417	1	Travis	Estep	travis.estep@sakilacustomer.org	422	t	1
418	2	Jeff	East	jeff.east@sakilacustomer.org	423	t	1
419	1	Chad	Carbone	chad.carbone@sakilacustomer.org	424	t	1
420	1	Jacob	Lance	jacob.lance@sakilacustomer.org	425	t	1
421	1	Lee	Hawks	lee.hawks@sakilacustomer.org	426	t	1
422	1	Melvin	Ellington	melvin.ellington@sakilacustomer.org	427	t	1
423	2	Alfred	Casillas	alfred.casillas@sakilacustomer.org	428	t	1
424	2	Kyle	Spurlock	kyle.spurlock@sakilacustomer.org	429	t	1
425	2	Francis	Sikes	francis.sikes@sakilacustomer.org	430	t	1
426	1	Bradley	Motley	bradley.motley@sakilacustomer.org	431	t	1
427	2	Jesus	Mccartney	jesus.mccartney@sakilacustomer.org	432	t	1
428	2	Herbert	Kruger	herbert.kruger@sakilacustomer.org	433	t	1
429	2	Frederick	Isbell	frederick.isbell@sakilacustomer.org	434	t	1
430	1	Ray	Houle	ray.houle@sakilacustomer.org	435	t	1
431	2	Joel	Francisco	joel.francisco@sakilacustomer.org	436	t	1
432	1	Edwin	Burk	edwin.burk@sakilacustomer.org	437	t	1
433	1	Don	Bone	don.bone@sakilacustomer.org	438	t	1
434	1	Eddie	Tomlin	eddie.tomlin@sakilacustomer.org	439	t	1
435	2	Ricky	Shelby	ricky.shelby@sakilacustomer.org	440	t	1
436	1	Troy	Quigley	troy.quigley@sakilacustomer.org	441	t	1
437	2	Randall	Neumann	randall.neumann@sakilacustomer.org	442	t	1
438	1	Barry	Lovelace	barry.lovelace@sakilacustomer.org	443	t	1
439	2	Alexander	Fennell	alexander.fennell@sakilacustomer.org	444	t	1
440	1	Bernard	Colby	bernard.colby@sakilacustomer.org	445	t	1
441	1	Mario	Cheatham	mario.cheatham@sakilacustomer.org	446	t	1
442	1	Leroy	Bustamante	leroy.bustamante@sakilacustomer.org	447	t	1
443	2	Francisco	Skidmore	francisco.skidmore@sakilacustomer.org	448	t	1
444	2	Marcus	Hidalgo	marcus.hidalgo@sakilacustomer.org	449	t	1
445	1	Micheal	Forman	micheal.forman@sakilacustomer.org	450	t	1
446	2	Theodore	Culp	theodore.culp@sakilacustomer.org	451	t	0
447	1	Clifford	Bowens	clifford.bowens@sakilacustomer.org	452	t	1
448	1	Miguel	Betancourt	miguel.betancourt@sakilacustomer.org	453	t	1
449	2	Oscar	Aquino	oscar.aquino@sakilacustomer.org	454	t	1
450	1	Jay	Robb	jay.robb@sakilacustomer.org	455	t	1
451	1	Jim	Rea	jim.rea@sakilacustomer.org	456	t	1
452	1	Tom	Milner	tom.milner@sakilacustomer.org	457	t	1
453	1	Calvin	Martel	calvin.martel@sakilacustomer.org	458	t	1
454	2	Alex	Gresham	alex.gresham@sakilacustomer.org	459	t	1
455	2	Jon	Wiles	jon.wiles@sakilacustomer.org	460	t	1
456	2	Ronnie	Ricketts	ronnie.ricketts@sakilacustomer.org	461	t	1
457	2	Bill	Gavin	bill.gavin@sakilacustomer.org	462	t	1
458	1	Lloyd	Dowd	lloyd.dowd@sakilacustomer.org	463	t	1
459	1	Tommy	Collazo	tommy.collazo@sakilacustomer.org	464	t	1
460	1	Leon	Bostic	leon.bostic@sakilacustomer.org	465	t	1
461	1	Derek	Blakely	derek.blakely@sakilacustomer.org	466	t	1
462	2	Warren	Sherrod	warren.sherrod@sakilacustomer.org	467	t	1
463	2	Darrell	Power	darrell.power@sakilacustomer.org	468	t	1
464	1	Jerome	Kenyon	jerome.kenyon@sakilacustomer.org	469	t	1
465	1	Floyd	Gandy	floyd.gandy@sakilacustomer.org	470	t	1
466	1	Leo	Ebert	leo.ebert@sakilacustomer.org	471	t	1
467	2	Alvin	Deloach	alvin.deloach@sakilacustomer.org	472	t	1
468	1	Tim	Cary	tim.cary@sakilacustomer.org	473	t	1
469	2	Wesley	Bull	wesley.bull@sakilacustomer.org	474	t	1
470	1	Gordon	Allard	gordon.allard@sakilacustomer.org	475	t	1
471	1	Dean	Sauer	dean.sauer@sakilacustomer.org	476	t	1
472	1	Greg	Robins	greg.robins@sakilacustomer.org	477	t	1
473	2	Jorge	Olivares	jorge.olivares@sakilacustomer.org	478	t	1
474	2	Dustin	Gillette	dustin.gillette@sakilacustomer.org	479	t	1
475	2	Pedro	Chestnut	pedro.chestnut@sakilacustomer.org	480	t	1
476	1	Derrick	Bourque	derrick.bourque@sakilacustomer.org	481	t	1
477	1	Dan	Paine	dan.paine@sakilacustomer.org	482	t	1
478	1	Lewis	Lyman	lewis.lyman@sakilacustomer.org	483	t	1
479	1	Zachary	Hite	zachary.hite@sakilacustomer.org	484	t	1
480	1	Corey	Hauser	corey.hauser@sakilacustomer.org	485	t	1
481	1	Herman	Devore	herman.devore@sakilacustomer.org	486	t	1
482	1	Maurice	Crawley	maurice.crawley@sakilacustomer.org	487	t	0
483	2	Vernon	Chapa	vernon.chapa@sakilacustomer.org	488	t	1
484	1	Roberto	Vu	roberto.vu@sakilacustomer.org	489	t	1
485	1	Clyde	Tobias	clyde.tobias@sakilacustomer.org	490	t	1
486	1	Glen	Talbert	glen.talbert@sakilacustomer.org	491	t	1
487	2	Hector	Poindexter	hector.poindexter@sakilacustomer.org	492	t	1
488	2	Shane	Millard	shane.millard@sakilacustomer.org	493	t	1
489	1	Ricardo	Meador	ricardo.meador@sakilacustomer.org	494	t	1
490	1	Sam	Mcduffie	sam.mcduffie@sakilacustomer.org	495	t	1
491	2	Rick	Mattox	rick.mattox@sakilacustomer.org	496	t	1
492	2	Lester	Kraus	lester.kraus@sakilacustomer.org	497	t	1
493	1	Brent	Harkins	brent.harkins@sakilacustomer.org	498	t	1
494	2	Ramon	Choate	ramon.choate@sakilacustomer.org	499	t	1
495	2	Charlie	Bess	charlie.bess@sakilacustomer.org	500	t	1
496	2	Tyler	Wren	tyler.wren@sakilacustomer.org	501	t	1
497	2	Gilbert	Sledge	gilbert.sledge@sakilacustomer.org	502	t	1
498	1	Gene	Sanborn	gene.sanborn@sakilacustomer.org	503	t	1
499	2	Marc	Outlaw	marc.outlaw@sakilacustomer.org	504	t	1
500	1	Reginald	Kinder	reginald.kinder@sakilacustomer.org	505	t	1
501	1	Ruben	Geary	ruben.geary@sakilacustomer.org	506	t	1
502	1	Brett	Cornwell	brett.cornwell@sakilacustomer.org	507	t	1
503	1	Angel	Barclay	angel.barclay@sakilacustomer.org	508	t	1
504	1	Nathaniel	Adam	nathaniel.adam@sakilacustomer.org	509	t	1
505	1	Rafael	Abney	rafael.abney@sakilacustomer.org	510	t	1
506	2	Leslie	Seward	leslie.seward@sakilacustomer.org	511	t	1
507	2	Edgar	Rhoads	edgar.rhoads@sakilacustomer.org	512	t	1
508	2	Milton	Howland	milton.howland@sakilacustomer.org	513	t	1
509	1	Raul	Fortier	raul.fortier@sakilacustomer.org	514	t	1
510	2	Ben	Easter	ben.easter@sakilacustomer.org	515	t	0
511	1	Chester	Benner	chester.benner@sakilacustomer.org	516	t	1
512	1	Cecil	Vines	cecil.vines@sakilacustomer.org	517	t	1
513	2	Duane	Tubbs	duane.tubbs@sakilacustomer.org	519	t	1
514	2	Franklin	Troutman	franklin.troutman@sakilacustomer.org	520	t	1
515	1	Andre	Rapp	andre.rapp@sakilacustomer.org	521	t	1
516	2	Elmer	Noe	elmer.noe@sakilacustomer.org	522	t	1
517	2	Brad	Mccurdy	brad.mccurdy@sakilacustomer.org	523	t	1
518	1	Gabriel	Harder	gabriel.harder@sakilacustomer.org	524	t	1
519	2	Ron	Deluca	ron.deluca@sakilacustomer.org	525	t	1
520	2	Mitchell	Westmoreland	mitchell.westmoreland@sakilacustomer.org	526	t	1
521	2	Roland	South	roland.south@sakilacustomer.org	527	t	1
522	2	Arnold	Havens	arnold.havens@sakilacustomer.org	528	t	1
523	1	Harvey	Guajardo	harvey.guajardo@sakilacustomer.org	529	t	1
525	2	Adrian	Clary	adrian.clary@sakilacustomer.org	531	t	1
526	2	Karl	Seal	karl.seal@sakilacustomer.org	532	t	1
527	1	Cory	Meehan	cory.meehan@sakilacustomer.org	533	t	1
528	1	Claude	Herzog	claude.herzog@sakilacustomer.org	534	t	1
529	2	Erik	Guillen	erik.guillen@sakilacustomer.org	535	t	1
530	2	Darryl	Ashcraft	darryl.ashcraft@sakilacustomer.org	536	t	1
531	2	Jamie	Waugh	jamie.waugh@sakilacustomer.org	537	t	1
532	2	Neil	Renner	neil.renner@sakilacustomer.org	538	t	1
533	1	Jessie	Milam	jessie.milam@sakilacustomer.org	539	t	1
534	1	Christian	Jung	christian.jung@sakilacustomer.org	540	t	0
535	1	Javier	Elrod	javier.elrod@sakilacustomer.org	541	t	1
536	2	Fernando	Churchill	fernando.churchill@sakilacustomer.org	542	t	1
537	2	Clinton	Buford	clinton.buford@sakilacustomer.org	543	t	1
538	2	Ted	Breaux	ted.breaux@sakilacustomer.org	544	t	1
539	1	Mathew	Bolin	mathew.bolin@sakilacustomer.org	545	t	1
540	1	Tyrone	Asher	tyrone.asher@sakilacustomer.org	546	t	1
541	2	Darren	Windham	darren.windham@sakilacustomer.org	547	t	1
542	2	Lonnie	Tirado	lonnie.tirado@sakilacustomer.org	548	t	1
543	1	Lance	Pemberton	lance.pemberton@sakilacustomer.org	549	t	1
544	2	Cody	Nolen	cody.nolen@sakilacustomer.org	550	t	1
545	2	Julio	Noland	julio.noland@sakilacustomer.org	551	t	1
546	1	Kelly	Knott	kelly.knott@sakilacustomer.org	552	t	1
547	1	Kurt	Emmons	kurt.emmons@sakilacustomer.org	553	t	1
548	1	Allan	Cornish	allan.cornish@sakilacustomer.org	554	t	1
549	1	Nelson	Christenson	nelson.christenson@sakilacustomer.org	555	t	1
550	2	Guy	Brownlee	guy.brownlee@sakilacustomer.org	556	t	1
551	2	Clayton	Barbee	clayton.barbee@sakilacustomer.org	557	t	1
552	2	Hugh	Waldrop	hugh.waldrop@sakilacustomer.org	558	t	1
553	1	Max	Pitt	max.pitt@sakilacustomer.org	559	t	1
554	1	Dwayne	Olvera	dwayne.olvera@sakilacustomer.org	560	t	1
555	1	Dwight	Lombardi	dwight.lombardi@sakilacustomer.org	561	t	1
556	2	Armando	Gruber	armando.gruber@sakilacustomer.org	562	t	1
557	1	Felix	Gaffney	felix.gaffney@sakilacustomer.org	563	t	1
558	1	Jimmie	Eggleston	jimmie.eggleston@sakilacustomer.org	564	t	0
559	2	Everett	Banda	everett.banda@sakilacustomer.org	565	t	1
560	1	Jordan	Archuleta	jordan.archuleta@sakilacustomer.org	566	t	1
561	2	Ian	Still	ian.still@sakilacustomer.org	567	t	1
562	1	Wallace	Slone	wallace.slone@sakilacustomer.org	568	t	1
563	2	Ken	Prewitt	ken.prewitt@sakilacustomer.org	569	t	1
564	2	Bob	Pfeiffer	bob.pfeiffer@sakilacustomer.org	570	t	1
565	2	Jaime	Nettles	jaime.nettles@sakilacustomer.org	571	t	1
566	1	Casey	Mena	casey.mena@sakilacustomer.org	572	t	1
567	2	Alfredo	Mcadams	alfredo.mcadams@sakilacustomer.org	573	t	1
568	2	Alberto	Henning	alberto.henning@sakilacustomer.org	574	t	1
569	2	Dave	Gardiner	dave.gardiner@sakilacustomer.org	575	t	1
570	2	Ivan	Cromwell	ivan.cromwell@sakilacustomer.org	576	t	1
571	2	Johnnie	Chisholm	johnnie.chisholm@sakilacustomer.org	577	t	1
572	1	Sidney	Burleson	sidney.burleson@sakilacustomer.org	578	t	1
573	1	Byron	Box	byron.box@sakilacustomer.org	579	t	1
574	2	Julian	Vest	julian.vest@sakilacustomer.org	580	t	1
575	2	Isaac	Oglesby	isaac.oglesby@sakilacustomer.org	581	t	1
576	2	Morris	Mccarter	morris.mccarter@sakilacustomer.org	582	t	1
577	2	Clifton	Malcolm	clifton.malcolm@sakilacustomer.org	583	t	1
578	2	Willard	Lumpkin	willard.lumpkin@sakilacustomer.org	584	t	1
579	2	Daryl	Larue	daryl.larue@sakilacustomer.org	585	t	1
580	1	Ross	Grey	ross.grey@sakilacustomer.org	586	t	1
581	1	Virgil	Wofford	virgil.wofford@sakilacustomer.org	587	t	1
582	2	Andy	Vanhorn	andy.vanhorn@sakilacustomer.org	588	t	1
583	1	Marshall	Thorn	marshall.thorn@sakilacustomer.org	589	t	1
584	2	Salvador	Teel	salvador.teel@sakilacustomer.org	590	t	1
585	1	Perry	Swafford	perry.swafford@sakilacustomer.org	591	t	1
586	1	Kirk	Stclair	kirk.stclair@sakilacustomer.org	592	t	1
587	1	Sergio	Stanfield	sergio.stanfield@sakilacustomer.org	593	t	1
588	1	Marion	Ocampo	marion.ocampo@sakilacustomer.org	594	t	1
589	1	Tracy	Herrmann	tracy.herrmann@sakilacustomer.org	595	t	1
590	2	Seth	Hannon	seth.hannon@sakilacustomer.org	596	t	1
591	1	Kent	Arsenault	kent.arsenault@sakilacustomer.org	597	t	1
592	1	Terrance	Roush	terrance.roush@sakilacustomer.org	598	t	0
593	2	Rene	Mcalister	rene.mcalister@sakilacustomer.org	599	t	1
594	1	Eduardo	Hiatt	eduardo.hiatt@sakilacustomer.org	600	t	1
595	1	Terrence	Gunderson	terrence.gunderson@sakilacustomer.org	601	t	1
596	1	Enrique	Forsythe	enrique.forsythe@sakilacustomer.org	602	t	1
597	1	Freddie	Duggan	freddie.duggan@sakilacustomer.org	603	t	1
598	1	Wade	Delvalle	wade.delvalle@sakilacustomer.org	604	t	1
599	2	Austin	Cintron	austin.cintron@sakilacustomer.org	605	t	1
\.


--
-- TOC entry 2970 (class 0 OID 18455)
-- Dependencies: 209
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating) FROM stdin;
133	Chamber Italian	A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria	2006	1	7	4.99	117	14.99	NC-17
384	Grosse Wonderful	A Epic Drama of a Cat And a Explorer who must Redeem a Moose in Australia	2006	1	5	4.99	49	19.99	R
8	Airport Pollock	A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India	2006	1	6	4.99	54	15.99	R
1	Academy Dinosaur	A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies	2006	1	6	0.99	86	20.99	PG
2	Ace Goldfinger	A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China	2006	1	3	4.99	48	12.99	G
3	Adaptation Holes	A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory	2006	1	7	2.99	50	18.99	NC-17
4	Affair Prejudice	A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank	2006	1	5	2.99	117	26.99	G
5	African Egg	A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico	2006	1	6	2.99	130	22.99	G
6	Agent Truman	A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China	2006	1	3	2.99	169	17.99	PG
7	Airplane Sierra	A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat	2006	1	6	4.99	62	28.99	PG-13
9	Alabama Devil	A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat	2006	1	3	2.99	114	21.99	PG-13
10	Aladdin Calendar	A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China	2006	1	6	4.99	63	24.99	NC-17
11	Alamo Videotape	A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention	2006	1	6	0.99	126	16.99	G
12	Alaska Phantom	A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia	2006	1	6	0.99	136	22.99	PG
213	Date Speed	A Touching Saga of a Composer And a Moose who must Discover a Dentist in A MySQL Convention	2006	1	4	0.99	104	19.99	R
13	Ali Forever	A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies	2006	1	4	4.99	150	21.99	PG
14	Alice Fantasia	A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia	2006	1	6	0.99	94	23.99	NC-17
15	Alien Center	A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention	2006	1	5	2.99	46	10.99	NC-17
31	Apache Divine	A Awe-Inspiring Reflection of a Pastry Chef And a Teacher who must Overcome a Sumo Wrestler in A U-Boat	2006	3	5	4.99	92	16.99	NC-17
32	Apocalypse Flamingos	A Astounding Story of a Dog And a Squirrel who must Defeat a Woman in An Abandoned Amusement Park	2006	3	6	4.99	119	11.99	R
33	Apollo Teen	A Action-Packed Reflection of a Crocodile And a Explorer who must Find a Sumo Wrestler in An Abandoned Mine Shaft	2006	3	5	2.99	153	15.99	PG-13
265	Dying Maker	A Intrepid Tale of a Boat And a Monkey who must Kill a Cat in California	2006	1	5	4.99	168	28.99	PG
46	Autumn Crow	A Beautiful Tale of a Dentist And a Mad Cow who must Battle a Moose in The Sahara Desert	2006	1	3	4.99	108	13.99	G
47	Baby Hall	A Boring Character Study of a A Shark And a Girl who must Outrace a Feminist in An Abandoned Mine Shaft	2006	4	5	4.99	153	23.99	NC-17
48	Backlash Undefeated	A Stunning Character Study of a Mad Scientist And a Mad Cow who must Kill a Car in A Monastery	2006	4	3	4.99	118	24.99	PG-13
49	Badman Dawn	A Emotional Panorama of a Pioneer And a Composer who must Escape a Mad Scientist in A Jet Boat	2006	4	6	2.99	162	22.99	R
50	Baked Cleopatra	A Stunning Drama of a Forensic Psychologist And a Husband who must Overcome a Waitress in A Monastery	2006	4	3	2.99	182	20.99	G
126	Casualties Encino	A Insightful Yarn of a A Shark And a Pastry Chef who must Face a Boy in A Monastery	2006	1	3	4.99	179	16.99	G
61	Beauty Grease	A Fast-Paced Display of a Composer And a Moose who must Sink a Robot in An Abandoned Mine Shaft	2006	5	5	4.99	175	28.99	G
62	Bed Highball	A Astounding Panorama of a Lumberjack And a Dog who must Redeem a Woman in An Abandoned Fun House	2006	5	5	2.99	106	23.99	NC-17
63	Bedazzled Married	A Astounding Character Study of a Madman And a Robot who must Meet a Mad Scientist in An Abandoned Fun House	2006	5	6	0.99	73	21.99	PG
64	Beethoven Exorcist	A Epic Display of a Pioneer And a Student who must Challenge a Butler in The Gulf of Mexico	2006	5	6	0.99	151	26.99	PG-13
65	Behavior Runaway	A Unbelieveable Drama of a Student And a Husband who must Outrace a Sumo Wrestler in Berlin	2006	5	3	4.99	100	20.99	PG
66	Beneath Rush	A Astounding Panorama of a Man And a Monkey who must Discover a Man in The First Manned Space Station	2006	5	6	0.99	53	27.99	NC-17
67	Berets Agent	A Taut Saga of a Crocodile And a Boy who must Overcome a Technical Writer in Ancient China	2006	5	5	2.99	77	24.99	PG-13
76	Birdcage Casper	A Fast-Paced Saga of a Frisbee And a Astronaut who must Overcome a Feminist in Ancient India	2006	6	4	0.99	103	23.99	NC-17
77	Birds Perdition	A Boring Story of a Womanizer And a Pioneer who must Face a Dog in California	2006	6	5	4.99	61	15.99	G
78	Blackout Private	A Intrepid Yarn of a Pastry Chef And a Mad Scientist who must Challenge a Secret Agent in Ancient Japan	2006	6	7	2.99	85	12.99	PG
79	Blade Polish	A Thoughtful Character Study of a Frisbee And a Pastry Chef who must Fight a Dentist in The First Manned Space Station	2006	6	5	0.99	114	10.99	PG-13
80	Blanket Beverly	A Emotional Documentary of a Student And a Girl who must Build a Boat in Nigeria	2006	6	7	2.99	148	21.99	G
81	Blindness Gun	A Touching Drama of a Robot And a Dentist who must Meet a Hunter in A Jet Boat	2006	6	6	4.99	103	29.99	PG-13
82	Blood Argonauts	A Boring Drama of a Explorer And a Man who must Kill a Lumberjack in A Manhattan Penthouse	2006	6	3	0.99	71	13.99	G
83	Blues Instinct	A Insightful Documentary of a Boat And a Composer who must Meet a Forensic Psychologist in An Abandoned Fun House	2006	6	5	2.99	50	18.99	G
101	Brotherhood Blanket	A Fateful Character Study of a Butler And a Technical Writer who must Sink a Astronaut in Ancient Japan	2006	1	3	0.99	73	26.99	R
102	Bubble Grosse	A Awe-Inspiring Panorama of a Crocodile And a Moose who must Confront a Girl in A Baloon	2006	1	4	4.99	60	20.99	R
103	Bucket Brotherhood	A Amazing Display of a Girl And a Womanizer who must Succumb a Lumberjack in A Baloon Factory	2006	1	7	4.99	133	27.99	PG
104	Bugsy Song	A Awe-Inspiring Character Study of a Secret Agent And a Boat who must Find a Squirrel in The First Manned Space Station	2006	1	4	2.99	119	17.99	G
105	Bull Shawshank	A Fanciful Drama of a Moose And a Squirrel who must Conquer a Pioneer in The Canadian Rockies	2006	1	6	0.99	125	21.99	NC-17
91	Bound Cheaper	A Thrilling Panorama of a Database Administrator And a Astronaut who must Challenge a Lumberjack in A Baloon	2006	6	5	0.99	98	17.99	PG
92	Bowfinger Gables	A Fast-Paced Yarn of a Waitress And a Composer who must Outgun a Dentist in California	2006	6	7	4.99	72	19.99	NC-17
93	Brannigan Sunrise	A Amazing Epistle of a Moose And a Crocodile who must Outrace a Dog in Berlin	2006	6	4	4.99	121	27.99	PG
94	Braveheart Human	A Insightful Story of a Dog And a Pastry Chef who must Battle a Girl in Berlin	2006	6	7	2.99	176	14.99	PG-13
95	Breakfast Goldfinger	A Beautiful Reflection of a Student And a Student who must Fight a Moose in Berlin	2006	6	5	4.99	123	18.99	G
106	Bulworth Commandments	A Amazing Display of a Mad Cow And a Pioneer who must Redeem a Sumo Wrestler in The Outback	2006	1	4	2.99	61	14.99	G
107	Bunch Minds	A Emotional Story of a Feminist And a Feminist who must Escape a Pastry Chef in A MySQL Convention	2006	1	4	2.99	63	13.99	G
108	Butch Panther	A Lacklusture Yarn of a Feminist And a Database Administrator who must Face a Hunter in New Orleans	2006	1	6	0.99	67	19.99	PG-13
109	Butterfly Chocolat	A Fateful Story of a Girl And a Composer who must Conquer a Husband in A Shark Tank	2006	1	3	0.99	89	17.99	G
110	Cabin Flash	A Stunning Epistle of a Boat And a Man who must Challenge a A Shark in A Baloon Factory	2006	1	4	0.99	53	25.99	NC-17
111	Caddyshack Jedi	A Awe-Inspiring Epistle of a Woman And a Madman who must Fight a Robot in Soviet Georgia	2006	1	3	0.99	52	17.99	NC-17
112	Calendar Gunfight	A Thrilling Drama of a Frisbee And a Lumberjack who must Sink a Man in Nigeria	2006	1	4	4.99	120	22.99	NC-17
113	California Birds	A Thrilling Yarn of a Database Administrator And a Robot who must Battle a Database Administrator in Ancient India	2006	1	4	4.99	75	19.99	NC-17
114	Camelot Vacation	A Touching Character Study of a Woman And a Waitress who must Battle a Pastry Chef in A MySQL Convention	2006	1	3	0.99	61	26.99	NC-17
115	Campus Remember	A Astounding Drama of a Crocodile And a Mad Cow who must Build a Robot in A Jet Boat	2006	1	5	2.99	167	27.99	R
116	Candidate Perdition	A Brilliant Epistle of a Composer And a Database Administrator who must Vanquish a Mad Scientist in The First Manned Space Station	2006	1	4	2.99	70	10.99	R
117	Candles Grapes	A Fanciful Character Study of a Monkey And a Explorer who must Build a Astronaut in An Abandoned Fun House	2006	1	6	4.99	135	15.99	NC-17
118	Canyon Stock	A Thoughtful Reflection of a Waitress And a Feminist who must Escape a Squirrel in A Manhattan Penthouse	2006	1	7	0.99	85	26.99	R
119	Caper Motions	A Fateful Saga of a Moose And a Car who must Pursue a Woman in A MySQL Convention	2006	1	6	0.99	176	22.99	G
120	Caribbean Liberty	A Fanciful Tale of a Pioneer And a Technical Writer who must Outgun a Pioneer in A Shark Tank	2006	1	3	4.99	92	16.99	NC-17
121	Carol Texas	A Astounding Character Study of a Composer And a Student who must Overcome a Composer in A Monastery	2006	1	4	2.99	151	15.99	PG
122	Carrie Bunch	A Amazing Epistle of a Student And a Astronaut who must Discover a Frisbee in The Canadian Rockies	2006	1	7	0.99	114	11.99	PG
123	Casablanca Super	A Amazing Panorama of a Crocodile And a Forensic Psychologist who must Pursue a Secret Agent in The First Manned Space Station	2006	1	6	4.99	85	22.99	G
124	Casper Dragonfly	A Intrepid Documentary of a Boat And a Crocodile who must Chase a Robot in The Sahara Desert	2006	1	3	4.99	163	16.99	PG-13
125	Cassidy Wyoming	A Intrepid Drama of a Frisbee And a Hunter who must Kill a Secret Agent in New Orleans	2006	1	5	2.99	61	19.99	NC-17
127	Cat Coneheads	A Fast-Paced Panorama of a Girl And a A Shark who must Confront a Boy in Ancient India	2006	1	5	4.99	112	14.99	G
128	Catch Amistad	A Boring Reflection of a Lumberjack And a Feminist who must Discover a Woman in Nigeria	2006	1	7	0.99	183	10.99	G
567	Meet Chocolate	A Boring Documentary of a Dentist And a Butler who must Confront a Monkey in A MySQL Convention	2006	1	3	2.99	80	26.99	G
129	Cause Date	A Taut Tale of a Explorer And a Pastry Chef who must Conquer a Hunter in A MySQL Convention	2006	1	3	2.99	179	16.99	R
130	Celebrity Horn	A Amazing Documentary of a Secret Agent And a Astronaut who must Vanquish a Hunter in A Shark Tank	2006	1	7	0.99	110	24.99	PG-13
131	Center Dinosaur	A Beautiful Character Study of a Sumo Wrestler And a Dentist who must Find a Dog in California	2006	1	5	4.99	152	12.99	PG
132	Chainsaw Uptown	A Beautiful Documentary of a Boy And a Robot who must Discover a Squirrel in Australia	2006	1	6	0.99	114	25.99	PG
134	Champion Flatliners	A Amazing Story of a Mad Cow And a Dog who must Kill a Husband in A Monastery	2006	1	4	4.99	51	21.99	PG
135	Chance Resurrection	A Astounding Story of a Forensic Psychologist And a Forensic Psychologist who must Overcome a Moose in Ancient China	2006	1	3	2.99	70	22.99	R
154	Clash Freddy	A Amazing Yarn of a Composer And a Squirrel who must Escape a Astronaut in Australia	2006	1	6	2.99	81	12.99	G
136	Chaplin License	A Boring Drama of a Dog And a Forensic Psychologist who must Outrace a Explorer in Ancient India	2006	1	7	2.99	146	26.99	NC-17
137	Charade Duffel	A Action-Packed Display of a Man And a Waitress who must Build a Dog in A MySQL Convention	2006	1	3	2.99	66	21.99	PG
138	Chariots Conspiracy	A Unbelieveable Epistle of a Robot And a Husband who must Chase a Robot in The First Manned Space Station	2006	1	5	2.99	71	29.99	R
139	Chasing Fight	A Astounding Saga of a Technical Writer And a Butler who must Battle a Butler in A Shark Tank	2006	1	7	4.99	114	21.99	PG
140	Cheaper Clyde	A Emotional Character Study of a Pioneer And a Girl who must Discover a Dog in Ancient Japan	2006	1	6	0.99	87	23.99	G
141	Chicago North	A Fateful Yarn of a Mad Cow And a Waitress who must Battle a Student in California	2006	1	6	4.99	185	11.99	PG-13
142	Chicken Hellfighters	A Emotional Drama of a Dog And a Explorer who must Outrace a Technical Writer in Australia	2006	1	3	0.99	122	24.99	PG
143	Chill Luck	A Lacklusture Epistle of a Boat And a Technical Writer who must Fight a A Shark in The Canadian Rockies	2006	1	6	0.99	142	17.99	PG
144	Chinatown Gladiator	A Brilliant Panorama of a Technical Writer And a Lumberjack who must Escape a Butler in Ancient India	2006	1	7	4.99	61	24.99	PG
145	Chisum Behavior	A Epic Documentary of a Sumo Wrestler And a Butler who must Kill a Car in Ancient India	2006	1	5	4.99	124	25.99	G
146	Chitty Lock	A Boring Epistle of a Boat And a Database Administrator who must Kill a Sumo Wrestler in The First Manned Space Station	2006	1	6	2.99	107	24.99	G
166	Color Philadelphia	A Thoughtful Panorama of a Car And a Crocodile who must Sink a Monkey in The Sahara Desert	2006	1	6	2.99	149	19.99	G
147	Chocolat Harry	A Action-Packed Epistle of a Dentist And a Moose who must Meet a Mad Cow in Ancient Japan	2006	1	5	0.99	101	16.99	NC-17
148	Chocolate Duck	A Unbelieveable Story of a Mad Scientist And a Technical Writer who must Discover a Composer in Ancient China	2006	1	3	2.99	132	13.99	R
149	Christmas Moonshine	A Action-Packed Epistle of a Feminist And a Astronaut who must Conquer a Boat in A Manhattan Penthouse	2006	1	7	0.99	150	21.99	NC-17
150	Cider Desire	A Stunning Character Study of a Composer And a Mad Cow who must Succumb a Cat in Soviet Georgia	2006	1	7	2.99	101	9.99	PG
151	Cincinatti Whisperer	A Brilliant Saga of a Pastry Chef And a Hunter who must Confront a Butler in Berlin	2006	1	5	4.99	143	26.99	NC-17
152	Circus Youth	A Thoughtful Drama of a Pastry Chef And a Dentist who must Pursue a Girl in A Baloon	2006	1	5	2.99	90	13.99	PG-13
153	Citizen Shrek	A Fanciful Character Study of a Technical Writer And a Husband who must Redeem a Robot in The Outback	2006	1	7	0.99	165	18.99	G
155	Cleopatra Devil	A Fanciful Documentary of a Crocodile And a Technical Writer who must Fight a A Shark in A Baloon	2006	1	6	0.99	150	26.99	PG-13
156	Clerks Angels	A Thrilling Display of a Sumo Wrestler And a Girl who must Confront a Man in A Baloon	2006	1	3	4.99	164	15.99	G
157	Clockwork Paradise	A Insightful Documentary of a Technical Writer And a Feminist who must Challenge a Cat in A Baloon	2006	1	7	0.99	143	29.99	PG-13
158	Clones Pinocchio	A Amazing Drama of a Car And a Robot who must Pursue a Dentist in New Orleans	2006	1	6	2.99	124	16.99	R
159	Closer Bang	A Unbelieveable Panorama of a Frisbee And a Hunter who must Vanquish a Monkey in Ancient India	2006	1	5	4.99	58	12.99	R
160	Club Graffiti	A Epic Tale of a Pioneer And a Hunter who must Escape a Girl in A U-Boat	2006	1	4	0.99	65	12.99	PG-13
161	Clue Grail	A Taut Tale of a Butler And a Mad Scientist who must Build a Crocodile in Ancient China	2006	1	6	4.99	70	27.99	NC-17
162	Clueless Bucket	A Taut Tale of a Car And a Pioneer who must Conquer a Sumo Wrestler in An Abandoned Fun House	2006	1	4	2.99	95	13.99	R
163	Clyde Theory	A Beautiful Yarn of a Astronaut And a Frisbee who must Overcome a Explorer in A Jet Boat	2006	1	4	0.99	139	29.99	PG-13
164	Coast Rainbow	A Astounding Documentary of a Mad Cow And a Pioneer who must Challenge a Butler in The Sahara Desert	2006	1	4	0.99	55	20.99	PG
184	Core Suit	A Unbelieveable Tale of a Car And a Explorer who must Confront a Boat in A Manhattan Penthouse	2006	1	3	2.99	92	24.99	PG-13
165	Coldblooded Darling	A Brilliant Panorama of a Dentist And a Moose who must Find a Student in The Gulf of Mexico	2006	1	7	4.99	70	27.99	G
167	Coma Head	A Awe-Inspiring Drama of a Boy And a Frisbee who must Escape a Pastry Chef in California	2006	1	6	4.99	109	10.99	NC-17
168	Comancheros Enemy	A Boring Saga of a Lumberjack And a Monkey who must Find a Monkey in The Gulf of Mexico	2006	1	5	0.99	67	23.99	R
169	Comforts Rush	A Unbelieveable Panorama of a Pioneer And a Husband who must Meet a Mad Cow in An Abandoned Mine Shaft	2006	1	3	2.99	76	19.99	NC-17
170	Command Darling	A Awe-Inspiring Tale of a Forensic Psychologist And a Woman who must Challenge a Database Administrator in Ancient Japan	2006	1	5	4.99	120	28.99	PG-13
171	Commandments Express	A Fanciful Saga of a Student And a Mad Scientist who must Battle a Hunter in An Abandoned Mine Shaft	2006	1	6	4.99	59	13.99	R
172	Coneheads Smoochy	A Touching Story of a Womanizer And a Composer who must Pursue a Husband in Nigeria	2006	1	7	4.99	112	12.99	NC-17
173	Confessions Maguire	A Insightful Story of a Car And a Boy who must Battle a Technical Writer in A Baloon	2006	1	7	4.99	65	25.99	PG-13
174	Confidential Interview	A Stunning Reflection of a Cat And a Woman who must Find a Astronaut in Ancient Japan	2006	1	6	4.99	180	13.99	NC-17
175	Confused Candles	A Stunning Epistle of a Cat And a Forensic Psychologist who must Confront a Pioneer in A Baloon	2006	1	3	2.99	122	27.99	PG-13
176	Congeniality Quest	A Touching Documentary of a Cat And a Pastry Chef who must Find a Lumberjack in A Baloon	2006	1	6	0.99	87	21.99	PG-13
177	Connecticut Tramp	A Unbelieveable Drama of a Crocodile And a Mad Cow who must Reach a Dentist in A Shark Tank	2006	1	4	4.99	172	20.99	R
178	Connection Microcosmos	A Fateful Documentary of a Crocodile And a Husband who must Face a Husband in The First Manned Space Station	2006	1	6	0.99	115	25.99	G
179	Conquerer Nuts	A Taut Drama of a Mad Scientist And a Man who must Escape a Pioneer in An Abandoned Mine Shaft	2006	1	4	4.99	173	14.99	G
180	Conspiracy Spirit	A Awe-Inspiring Story of a Student And a Frisbee who must Conquer a Crocodile in An Abandoned Mine Shaft	2006	1	4	2.99	184	27.99	PG-13
181	Contact Anonymous	A Insightful Display of a A Shark And a Monkey who must Face a Database Administrator in Ancient India	2006	1	7	2.99	166	10.99	PG-13
182	Control Anthem	A Fateful Documentary of a Robot And a Student who must Battle a Cat in A Monastery	2006	1	7	4.99	185	9.99	G
183	Conversation Downhill	A Taut Character Study of a Husband And a Waitress who must Sink a Squirrel in A MySQL Convention	2006	1	4	4.99	112	14.99	R
185	Cowboy Doom	A Astounding Drama of a Boy And a Lumberjack who must Fight a Butler in A Baloon	2006	1	3	2.99	146	10.99	PG
186	Craft Outfield	A Lacklusture Display of a Explorer And a Hunter who must Succumb a Database Administrator in A Baloon Factory	2006	1	6	0.99	64	17.99	NC-17
187	Cranes Reservoir	A Fanciful Documentary of a Teacher And a Dog who must Outgun a Forensic Psychologist in A Baloon Factory	2006	1	5	2.99	57	12.99	NC-17
188	Crazy Home	A Fanciful Panorama of a Boy And a Woman who must Vanquish a Database Administrator in The Outback	2006	1	7	2.99	136	24.99	PG
189	Creatures Shakespeare	A Emotional Drama of a Womanizer And a Squirrel who must Vanquish a Crocodile in Ancient India	2006	1	3	0.99	139	23.99	NC-17
190	Creepers Kane	A Awe-Inspiring Reflection of a Squirrel And a Boat who must Outrace a Car in A Jet Boat	2006	1	5	4.99	172	23.99	NC-17
191	Crooked Frogmen	A Unbelieveable Drama of a Hunter And a Database Administrator who must Battle a Crocodile in An Abandoned Amusement Park	2006	1	6	0.99	143	27.99	PG-13
192	Crossing Divorce	A Beautiful Documentary of a Dog And a Robot who must Redeem a Womanizer in Berlin	2006	1	4	4.99	50	19.99	R
193	Crossroads Casualties	A Intrepid Documentary of a Sumo Wrestler And a Astronaut who must Battle a Composer in The Outback	2006	1	5	2.99	153	20.99	G
194	Crow Grease	A Awe-Inspiring Documentary of a Woman And a Husband who must Sink a Database Administrator in The First Manned Space Station	2006	1	6	0.99	104	22.99	PG
195	Crowds Telemark	A Intrepid Documentary of a Astronaut And a Forensic Psychologist who must Find a Frisbee in An Abandoned Fun House	2006	1	3	4.99	112	16.99	R
196	Cruelty Unforgiven	A Brilliant Tale of a Car And a Moose who must Battle a Dentist in Nigeria	2006	1	7	0.99	69	29.99	G
197	Crusade Honey	A Fast-Paced Reflection of a Explorer And a Butler who must Battle a Madman in An Abandoned Amusement Park	2006	1	4	2.99	112	27.99	R
198	Crystal Breaking	A Fast-Paced Character Study of a Feminist And a Explorer who must Face a Pastry Chef in Ancient Japan	2006	1	6	2.99	184	22.99	NC-17
199	Cupboard Sinners	A Emotional Reflection of a Frisbee And a Boat who must Reach a Pastry Chef in An Abandoned Amusement Park	2006	1	4	2.99	56	29.99	R
200	Curtain Videotape	A Boring Reflection of a Dentist And a Mad Cow who must Chase a Secret Agent in A Shark Tank	2006	1	7	0.99	133	27.99	PG-13
201	Cyclone Family	A Lacklusture Drama of a Student And a Monkey who must Sink a Womanizer in A MySQL Convention	2006	1	7	2.99	176	18.99	PG
202	Daddy Pittsburgh	A Epic Story of a A Shark And a Student who must Confront a Explorer in The Gulf of Mexico	2006	1	5	4.99	161	26.99	G
203	Daisy Menagerie	A Fast-Paced Saga of a Pastry Chef And a Monkey who must Sink a Composer in Ancient India	2006	1	5	4.99	84	9.99	G
204	Dalmations Sweden	A Emotional Epistle of a Moose And a Hunter who must Overcome a Robot in A Manhattan Penthouse	2006	1	4	0.99	106	25.99	PG
205	Dances None	A Insightful Reflection of a A Shark And a Dog who must Kill a Butler in An Abandoned Amusement Park	2006	1	3	0.99	58	22.99	NC-17
206	Dancing Fever	A Stunning Story of a Explorer And a Forensic Psychologist who must Face a Crocodile in A Shark Tank	2006	1	6	0.99	144	25.99	G
207	Dangerous Uptown	A Unbelieveable Story of a Mad Scientist And a Woman who must Overcome a Dog in California	2006	1	7	4.99	121	26.99	PG
208	Dares Pluto	A Fateful Story of a Robot And a Dentist who must Defeat a Astronaut in New Orleans	2006	1	7	2.99	89	16.99	PG-13
209	Darkness War	A Touching Documentary of a Husband And a Hunter who must Escape a Boy in The Sahara Desert	2006	1	6	2.99	99	24.99	NC-17
210	Darko Dorado	A Stunning Reflection of a Frisbee And a Husband who must Redeem a Dog in New Orleans	2006	1	3	4.99	130	13.99	NC-17
211	Darling Breaking	A Brilliant Documentary of a Astronaut And a Squirrel who must Succumb a Student in The Gulf of Mexico	2006	1	7	4.99	165	20.99	PG-13
212	Darn Forrester	A Fateful Story of a A Shark And a Explorer who must Succumb a Technical Writer in A Jet Boat	2006	1	7	4.99	185	14.99	G
214	Daughter Madigan	A Beautiful Tale of a Hunter And a Mad Scientist who must Confront a Squirrel in The First Manned Space Station	2006	1	3	4.99	59	13.99	PG-13
215	Dawn Pond	A Thoughtful Documentary of a Dentist And a Forensic Psychologist who must Defeat a Waitress in Berlin	2006	1	4	4.99	57	27.99	PG
216	Day Unfaithful	A Stunning Documentary of a Composer And a Mad Scientist who must Find a Technical Writer in A U-Boat	2006	1	3	4.99	113	16.99	G
217	Dazed Punk	A Action-Packed Story of a Pioneer And a Technical Writer who must Discover a Forensic Psychologist in An Abandoned Amusement Park	2006	1	6	4.99	120	20.99	G
218	Deceiver Betrayed	A Taut Story of a Moose And a Squirrel who must Build a Husband in Ancient India	2006	1	7	0.99	122	22.99	NC-17
219	Deep Crusade	A Amazing Tale of a Crocodile And a Squirrel who must Discover a Composer in Australia	2006	1	6	4.99	51	20.99	PG-13
220	Deer Virginian	A Thoughtful Story of a Mad Cow And a Womanizer who must Overcome a Mad Scientist in Soviet Georgia	2006	1	7	2.99	106	13.99	NC-17
221	Deliverance Mulholland	A Astounding Saga of a Monkey And a Moose who must Conquer a Butler in A Shark Tank	2006	1	4	0.99	100	9.99	R
240	Dolls Rage	A Thrilling Display of a Pioneer And a Frisbee who must Escape a Teacher in The Outback	2006	1	7	2.99	120	10.99	PG-13
222	Desert Poseidon	A Brilliant Documentary of a Butler And a Frisbee who must Build a Astronaut in New Orleans	2006	1	4	4.99	64	27.99	R
242	Doom Dancing	A Astounding Panorama of a Car And a Mad Scientist who must Battle a Lumberjack in A MySQL Convention	2006	1	4	0.99	68	13.99	R
223	Desire Alien	A Fast-Paced Tale of a Dog And a Forensic Psychologist who must Meet a Astronaut in The First Manned Space Station	2006	1	7	2.99	76	24.99	NC-17
224	Desperate Trainspotting	A Epic Yarn of a Forensic Psychologist And a Teacher who must Face a Lumberjack in California	2006	1	7	4.99	81	29.99	G
225	Destination Jerk	A Beautiful Yarn of a Teacher And a Cat who must Build a Car in A U-Boat	2006	1	3	0.99	76	19.99	PG-13
226	Destiny Saturday	A Touching Drama of a Crocodile And a Crocodile who must Conquer a Explorer in Soviet Georgia	2006	1	4	4.99	56	20.99	G
227	Details Packer	A Epic Saga of a Waitress And a Composer who must Face a Boat in A U-Boat	2006	1	4	4.99	88	17.99	R
228	Detective Vision	A Fanciful Documentary of a Pioneer And a Woman who must Redeem a Hunter in Ancient Japan	2006	1	4	0.99	143	16.99	PG-13
229	Devil Desire	A Beautiful Reflection of a Monkey And a Dentist who must Face a Database Administrator in Ancient Japan	2006	1	6	4.99	87	12.99	R
230	Diary Panic	A Thoughtful Character Study of a Frisbee And a Mad Cow who must Outgun a Man in Ancient India	2006	1	7	2.99	107	20.99	G
231	Dinosaur Secretary	A Action-Packed Drama of a Feminist And a Girl who must Reach a Robot in The Canadian Rockies	2006	1	7	2.99	63	27.99	R
232	Dirty Ace	A Action-Packed Character Study of a Forensic Psychologist And a Girl who must Build a Dentist in The Outback	2006	1	7	2.99	147	29.99	NC-17
233	Disciple Mother	A Touching Reflection of a Mad Scientist And a Boat who must Face a Moose in A Shark Tank	2006	1	3	0.99	141	17.99	PG
234	Disturbing Scarface	A Lacklusture Display of a Crocodile And a Butler who must Overcome a Monkey in A U-Boat	2006	1	6	2.99	94	27.99	R
235	Divide Monster	A Intrepid Saga of a Man And a Forensic Psychologist who must Reach a Squirrel in A Monastery	2006	1	6	2.99	68	13.99	PG-13
236	Divine Resurrection	A Boring Character Study of a Man And a Womanizer who must Succumb a Teacher in An Abandoned Amusement Park	2006	1	4	2.99	100	19.99	R
237	Divorce Shining	A Unbelieveable Saga of a Crocodile And a Student who must Discover a Cat in Ancient India	2006	1	3	2.99	47	21.99	G
238	Doctor Grail	A Insightful Drama of a Womanizer And a Waitress who must Reach a Forensic Psychologist in The Outback	2006	1	4	2.99	57	29.99	G
239	Dogma Family	A Brilliant Character Study of a Database Administrator And a Monkey who must Succumb a Astronaut in New Orleans	2006	1	5	4.99	122	16.99	G
241	Donnie Alley	A Awe-Inspiring Tale of a Butler And a Frisbee who must Vanquish a Teacher in Ancient Japan	2006	1	4	0.99	125	20.99	NC-17
243	Doors President	A Awe-Inspiring Display of a Squirrel And a Woman who must Overcome a Boy in The Gulf of Mexico	2006	1	3	4.99	49	22.99	NC-17
244	Dorado Notting	A Action-Packed Tale of a Sumo Wrestler And a A Shark who must Meet a Frisbee in California	2006	1	5	4.99	139	26.99	NC-17
245	Double Wrath	A Thoughtful Yarn of a Womanizer And a Dog who must Challenge a Madman in The Gulf of Mexico	2006	1	4	0.99	177	28.99	R
246	Doubtfire Labyrinth	A Intrepid Panorama of a Butler And a Composer who must Meet a Mad Cow in The Sahara Desert	2006	1	5	4.99	154	16.99	R
247	Downhill Enough	A Emotional Tale of a Pastry Chef And a Forensic Psychologist who must Succumb a Monkey in The Sahara Desert	2006	1	3	0.99	47	19.99	G
248	Dozen Lion	A Taut Drama of a Cat And a Girl who must Defeat a Frisbee in The Canadian Rockies	2006	1	6	4.99	177	20.99	NC-17
249	Dracula Crystal	A Thrilling Reflection of a Feminist And a Cat who must Find a Frisbee in An Abandoned Fun House	2006	1	7	0.99	176	26.99	G
250	Dragon Squad	A Taut Reflection of a Boy And a Waitress who must Outgun a Teacher in Ancient China	2006	1	4	0.99	170	26.99	NC-17
251	Dragonfly Strangers	A Boring Documentary of a Pioneer And a Man who must Vanquish a Man in Nigeria	2006	1	6	4.99	133	19.99	NC-17
252	Dream Pickup	A Epic Display of a Car And a Composer who must Overcome a Forensic Psychologist in The Gulf of Mexico	2006	1	6	2.99	135	18.99	PG
253	Drifter Commandments	A Epic Reflection of a Womanizer And a Squirrel who must Discover a Husband in A Jet Boat	2006	1	5	4.99	61	18.99	PG-13
254	Driver Annie	A Lacklusture Character Study of a Butler And a Car who must Redeem a Boat in An Abandoned Fun House	2006	1	4	2.99	159	11.99	PG-13
255	Driving Polish	A Action-Packed Yarn of a Feminist And a Technical Writer who must Sink a Boat in An Abandoned Mine Shaft	2006	1	6	4.99	175	21.99	NC-17
256	Drop Waterfront	A Fanciful Documentary of a Husband And a Explorer who must Reach a Madman in Ancient China	2006	1	6	4.99	178	20.99	R
257	Drumline Cyclone	A Insightful Panorama of a Monkey And a Sumo Wrestler who must Outrace a Mad Scientist in The Canadian Rockies	2006	1	3	0.99	110	14.99	G
258	Drums Dynamite	A Epic Display of a Crocodile And a Crocodile who must Confront a Dog in An Abandoned Amusement Park	2006	1	6	0.99	96	11.99	PG
259	Duck Racer	A Lacklusture Yarn of a Teacher And a Squirrel who must Overcome a Dog in A Shark Tank	2006	1	4	2.99	116	15.99	NC-17
260	Dude Blindness	A Stunning Reflection of a Husband And a Lumberjack who must Face a Frisbee in An Abandoned Fun House	2006	1	3	4.99	132	9.99	G
261	Duffel Apocalypse	A Emotional Display of a Boat And a Explorer who must Challenge a Madman in A MySQL Convention	2006	1	5	0.99	171	13.99	G
262	Dumbo Lust	A Touching Display of a Feminist And a Dentist who must Conquer a Husband in The Gulf of Mexico	2006	1	5	0.99	119	17.99	NC-17
263	Durham Panky	A Brilliant Panorama of a Girl And a Boy who must Face a Mad Scientist in An Abandoned Mine Shaft	2006	1	6	4.99	154	14.99	R
264	Dwarfs Alter	A Emotional Yarn of a Girl And a Dog who must Challenge a Composer in Ancient Japan	2006	1	6	2.99	101	13.99	G
266	Dynamite Tarzan	A Intrepid Documentary of a Forensic Psychologist And a Mad Scientist who must Face a Explorer in A U-Boat	2006	1	4	0.99	141	27.99	PG-13
267	Eagles Panky	A Thoughtful Story of a Car And a Boy who must Find a A Shark in The Sahara Desert	2006	1	4	4.99	140	14.99	NC-17
268	Early Home	A Amazing Panorama of a Mad Scientist And a Husband who must Meet a Woman in The Outback	2006	1	6	4.99	96	27.99	NC-17
269	Earring Instinct	A Stunning Character Study of a Dentist And a Mad Cow who must Find a Teacher in Nigeria	2006	1	3	0.99	98	22.99	R
270	Earth Vision	A Stunning Drama of a Butler And a Madman who must Outrace a Womanizer in Ancient India	2006	1	7	0.99	85	29.99	NC-17
271	Easy Gladiator	A Fateful Story of a Monkey And a Girl who must Overcome a Pastry Chef in Ancient India	2006	1	5	4.99	148	12.99	G
272	Edge Kissing	A Beautiful Yarn of a Composer And a Mad Cow who must Redeem a Mad Scientist in A Jet Boat	2006	1	5	4.99	153	9.99	NC-17
273	Effect Gladiator	A Beautiful Display of a Pastry Chef And a Pastry Chef who must Outgun a Forensic Psychologist in A Manhattan Penthouse	2006	1	6	0.99	107	14.99	PG
274	Egg Igby	A Beautiful Documentary of a Boat And a Sumo Wrestler who must Succumb a Database Administrator in The First Manned Space Station	2006	1	4	2.99	67	20.99	PG
275	Egypt Tenenbaums	A Intrepid Story of a Madman And a Secret Agent who must Outrace a Astronaut in An Abandoned Amusement Park	2006	1	3	0.99	85	11.99	PG
276	Element Freddy	A Awe-Inspiring Reflection of a Waitress And a Squirrel who must Kill a Mad Cow in A Jet Boat	2006	1	6	4.99	115	28.99	NC-17
277	Elephant Trojan	A Beautiful Panorama of a Lumberjack And a Forensic Psychologist who must Overcome a Frisbee in A Baloon	2006	1	4	4.99	126	24.99	PG-13
278	Elf Murder	A Action-Packed Story of a Frisbee And a Woman who must Reach a Girl in An Abandoned Mine Shaft	2006	1	4	4.99	155	19.99	NC-17
279	Elizabeth Shane	A Lacklusture Display of a Womanizer And a Dog who must Face a Sumo Wrestler in Ancient Japan	2006	1	7	4.99	152	11.99	NC-17
280	Empire Malkovich	A Amazing Story of a Feminist And a Cat who must Face a Car in An Abandoned Fun House	2006	1	7	0.99	177	26.99	G
281	Encino Elf	A Astounding Drama of a Feminist And a Teacher who must Confront a Husband in A Baloon	2006	1	6	0.99	143	9.99	G
282	Encounters Curtain	A Insightful Epistle of a Pastry Chef And a Womanizer who must Build a Boat in New Orleans	2006	1	5	0.99	92	20.99	NC-17
283	Ending Crowds	A Unbelieveable Display of a Dentist And a Madman who must Vanquish a Squirrel in Berlin	2006	1	6	0.99	85	10.99	NC-17
284	Enemy Odds	A Fanciful Panorama of a Mad Scientist And a Woman who must Pursue a Astronaut in Ancient India	2006	1	5	4.99	77	23.99	NC-17
285	English Bulworth	A Intrepid Epistle of a Pastry Chef And a Pastry Chef who must Pursue a Crocodile in Ancient China	2006	1	3	0.99	51	18.99	PG-13
286	Enough Raging	A Astounding Character Study of a Boat And a Secret Agent who must Find a Mad Cow in The Sahara Desert	2006	1	7	2.99	158	16.99	NC-17
287	Entrapment Satisfaction	A Thoughtful Panorama of a Hunter And a Teacher who must Reach a Mad Cow in A U-Boat	2006	1	5	0.99	176	19.99	R
288	Escape Metropolis	A Taut Yarn of a Astronaut And a Technical Writer who must Outgun a Boat in New Orleans	2006	1	7	2.99	167	20.99	R
289	Eve Resurrection	A Awe-Inspiring Yarn of a Pastry Chef And a Database Administrator who must Challenge a Teacher in A Baloon	2006	1	5	4.99	66	25.99	G
290	Everyone Craft	A Fateful Display of a Waitress And a Dentist who must Reach a Butler in Nigeria	2006	1	4	0.99	163	29.99	PG
291	Evolution Alter	A Fanciful Character Study of a Feminist And a Madman who must Find a Explorer in A Baloon Factory	2006	1	5	0.99	174	10.99	PG-13
292	Excitement Eve	A Brilliant Documentary of a Monkey And a Car who must Conquer a Crocodile in A Shark Tank	2006	1	3	0.99	51	20.99	G
293	Exorcist Sting	A Touching Drama of a Dog And a Sumo Wrestler who must Conquer a Mad Scientist in Berlin	2006	1	6	2.99	167	17.99	G
294	Expecations Natural	A Amazing Drama of a Butler And a Husband who must Reach a A Shark in A U-Boat	2006	1	5	4.99	138	26.99	PG-13
295	Expendable Stallion	A Amazing Character Study of a Mad Cow And a Squirrel who must Discover a Hunter in A U-Boat	2006	1	3	0.99	97	14.99	PG
296	Express Lonely	A Boring Drama of a Astronaut And a Boat who must Face a Boat in California	2006	1	5	2.99	178	23.99	R
297	Extraordinary Conquerer	A Stunning Story of a Dog And a Feminist who must Face a Forensic Psychologist in Berlin	2006	1	6	2.99	122	29.99	G
298	Eyes Driving	A Thrilling Story of a Cat And a Waitress who must Fight a Explorer in The Outback	2006	1	4	2.99	172	13.99	PG-13
356	Giant Troopers	A Fateful Display of a Feminist And a Monkey who must Vanquish a Monkey in The Canadian Rockies	2006	1	5	2.99	102	10.99	R
299	Factory Dragon	A Action-Packed Saga of a Teacher And a Frisbee who must Escape a Lumberjack in The Sahara Desert	2006	1	4	0.99	144	9.99	PG-13
300	Falcon Volume	A Fateful Saga of a Sumo Wrestler And a Hunter who must Redeem a A Shark in New Orleans	2006	1	5	4.99	102	21.99	PG-13
301	Family Sweet	A Epic Documentary of a Teacher And a Boy who must Escape a Woman in Berlin	2006	1	4	0.99	155	24.99	R
302	Fantasia Park	A Thoughtful Documentary of a Mad Scientist And a A Shark who must Outrace a Feminist in Australia	2006	1	5	2.99	131	29.99	G
303	Fantasy Troopers	A Touching Saga of a Teacher And a Monkey who must Overcome a Secret Agent in A MySQL Convention	2006	1	6	0.99	58	27.99	PG-13
304	Fargo Gandhi	A Thrilling Reflection of a Pastry Chef And a Crocodile who must Reach a Teacher in The Outback	2006	1	3	2.99	130	28.99	G
305	Fatal Haunted	A Beautiful Drama of a Student And a Secret Agent who must Confront a Dentist in Ancient Japan	2006	1	6	2.99	91	24.99	PG
306	Feathers Metal	A Thoughtful Yarn of a Monkey And a Teacher who must Find a Dog in Australia	2006	1	3	0.99	104	12.99	PG-13
307	Fellowship Autumn	A Lacklusture Reflection of a Dentist And a Hunter who must Meet a Teacher in A Baloon	2006	1	6	4.99	77	9.99	NC-17
308	Ferris Mother	A Touching Display of a Frisbee And a Frisbee who must Kill a Girl in The Gulf of Mexico	2006	1	3	2.99	142	13.99	PG
309	Feud Frogmen	A Brilliant Reflection of a Database Administrator And a Mad Cow who must Chase a Woman in The Canadian Rockies	2006	1	6	0.99	98	29.99	R
310	Fever Empire	A Insightful Panorama of a Cat And a Boat who must Defeat a Boat in The Gulf of Mexico	2006	1	5	4.99	158	20.99	R
311	Fiction Christmas	A Emotional Yarn of a A Shark And a Student who must Battle a Robot in An Abandoned Mine Shaft	2006	1	4	0.99	72	14.99	PG
312	Fiddler Lost	A Boring Tale of a Squirrel And a Dog who must Challenge a Madman in The Gulf of Mexico	2006	1	4	4.99	75	20.99	R
313	Fidelity Devil	A Awe-Inspiring Drama of a Technical Writer And a Composer who must Reach a Pastry Chef in A U-Boat	2006	1	5	4.99	118	11.99	G
314	Fight Jawbreaker	A Intrepid Panorama of a Womanizer And a Girl who must Escape a Girl in A Manhattan Penthouse	2006	1	3	0.99	91	13.99	R
315	Finding Anaconda	A Fateful Tale of a Database Administrator And a Girl who must Battle a Squirrel in New Orleans	2006	1	4	0.99	156	10.99	R
316	Fire Wolves	A Intrepid Documentary of a Frisbee And a Dog who must Outrace a Lumberjack in Nigeria	2006	1	5	4.99	173	18.99	R
317	Fireball Philadelphia	A Amazing Yarn of a Dentist And a A Shark who must Vanquish a Madman in An Abandoned Mine Shaft	2006	1	4	0.99	148	25.99	PG
318	Firehouse Vietnam	A Awe-Inspiring Character Study of a Boat And a Boy who must Kill a Pastry Chef in The Sahara Desert	2006	1	7	0.99	103	14.99	G
319	Fish Opus	A Touching Display of a Feminist And a Girl who must Confront a Astronaut in Australia	2006	1	4	2.99	125	22.99	R
320	Flamingos Connecticut	A Fast-Paced Reflection of a Composer And a Composer who must Meet a Cat in The Sahara Desert	2006	1	4	4.99	80	28.99	PG-13
321	Flash Wars	A Astounding Saga of a Moose And a Pastry Chef who must Chase a Student in The Gulf of Mexico	2006	1	3	4.99	123	21.99	NC-17
322	Flatliners Killer	A Taut Display of a Secret Agent And a Waitress who must Sink a Robot in An Abandoned Mine Shaft	2006	1	5	2.99	100	29.99	G
323	Flight Lies	A Stunning Character Study of a Crocodile And a Pioneer who must Pursue a Teacher in New Orleans	2006	1	7	4.99	179	22.99	R
324	Flintstones Happiness	A Fateful Story of a Husband And a Moose who must Vanquish a Boy in California	2006	1	3	4.99	148	11.99	PG-13
325	Floats Garden	A Action-Packed Epistle of a Robot And a Car who must Chase a Boat in Ancient Japan	2006	1	6	2.99	145	29.99	PG-13
326	Flying Hook	A Thrilling Display of a Mad Cow And a Dog who must Challenge a Frisbee in Nigeria	2006	1	6	2.99	69	18.99	NC-17
327	Fool Mockingbird	A Lacklusture Tale of a Crocodile And a Composer who must Defeat a Madman in A U-Boat	2006	1	3	4.99	158	24.99	PG
328	Forever Candidate	A Unbelieveable Panorama of a Technical Writer And a Man who must Pursue a Frisbee in A U-Boat	2006	1	7	2.99	131	28.99	NC-17
329	Forrest Sons	A Thrilling Documentary of a Forensic Psychologist And a Butler who must Defeat a Explorer in A Jet Boat	2006	1	4	2.99	63	15.99	R
330	Forrester Comancheros	A Fateful Tale of a Squirrel And a Forensic Psychologist who must Redeem a Man in Nigeria	2006	1	7	4.99	112	22.99	NC-17
331	Forward Temple	A Astounding Display of a Forensic Psychologist And a Mad Scientist who must Challenge a Girl in New Orleans	2006	1	6	2.99	90	25.99	NC-17
332	Frankenstein Stranger	A Insightful Character Study of a Feminist And a Pioneer who must Pursue a Pastry Chef in Nigeria	2006	1	7	0.99	159	16.99	NC-17
333	Freaky Pocus	A Fast-Paced Documentary of a Pastry Chef And a Crocodile who must Chase a Squirrel in The Gulf of Mexico	2006	1	7	2.99	126	16.99	R
334	Freddy Storm	A Intrepid Saga of a Man And a Lumberjack who must Vanquish a Husband in The Outback	2006	1	6	4.99	65	21.99	NC-17
335	Freedom Cleopatra	A Emotional Reflection of a Dentist And a Mad Cow who must Face a Squirrel in A Baloon	2006	1	5	0.99	133	23.99	PG-13
336	French Holiday	A Thrilling Epistle of a Dog And a Feminist who must Kill a Madman in Berlin	2006	1	5	4.99	99	22.99	PG
337	Frida Slipper	A Fateful Story of a Lumberjack And a Car who must Escape a Boat in An Abandoned Mine Shaft	2006	1	6	2.99	73	11.99	R
338	Frisco Forrest	A Beautiful Documentary of a Woman And a Pioneer who must Pursue a Mad Scientist in A Shark Tank	2006	1	6	4.99	51	23.99	PG
339	Frogmen Breaking	A Unbelieveable Yarn of a Mad Scientist And a Cat who must Chase a Lumberjack in Australia	2006	1	5	0.99	111	17.99	R
340	Frontier Cabin	A Emotional Story of a Madman And a Waitress who must Battle a Teacher in An Abandoned Fun House	2006	1	6	4.99	183	14.99	PG-13
341	Frost Head	A Amazing Reflection of a Lumberjack And a Cat who must Discover a Husband in A MySQL Convention	2006	1	5	0.99	82	13.99	PG
342	Fugitive Maguire	A Taut Epistle of a Feminist And a Sumo Wrestler who must Battle a Crocodile in Australia	2006	1	7	4.99	83	28.99	R
343	Full Flatliners	A Beautiful Documentary of a Astronaut And a Moose who must Pursue a Monkey in A Shark Tank	2006	1	6	2.99	94	14.99	PG
344	Fury Murder	A Lacklusture Reflection of a Boat And a Forensic Psychologist who must Fight a Waitress in A Monastery	2006	1	3	0.99	178	28.99	PG-13
345	Gables Metropolis	A Fateful Display of a Cat And a Pioneer who must Challenge a Pastry Chef in A Baloon Factory	2006	1	3	0.99	161	17.99	PG
346	Galaxy Sweethearts	A Emotional Reflection of a Womanizer And a Pioneer who must Face a Squirrel in Berlin	2006	1	4	4.99	128	13.99	R
347	Games Bowfinger	A Astounding Documentary of a Butler And a Explorer who must Challenge a Butler in A Monastery	2006	1	7	4.99	119	17.99	PG-13
348	Gandhi Kwai	A Thoughtful Display of a Mad Scientist And a Secret Agent who must Chase a Boat in Berlin	2006	1	7	0.99	86	9.99	PG-13
349	Gangs Pride	A Taut Character Study of a Woman And a A Shark who must Confront a Frisbee in Berlin	2006	1	4	2.99	185	27.99	PG-13
350	Garden Island	A Unbelieveable Character Study of a Womanizer And a Madman who must Reach a Man in The Outback	2006	1	3	4.99	80	21.99	G
351	Gaslight Crusade	A Amazing Epistle of a Boy And a Astronaut who must Redeem a Man in The Gulf of Mexico	2006	1	4	2.99	106	10.99	PG
352	Gathering Calendar	A Intrepid Tale of a Pioneer And a Moose who must Conquer a Frisbee in A MySQL Convention	2006	1	4	0.99	176	22.99	PG-13
353	Gentlemen Stage	A Awe-Inspiring Reflection of a Monkey And a Student who must Overcome a Dentist in The First Manned Space Station	2006	1	6	2.99	125	22.99	NC-17
354	Ghost Groundhog	A Brilliant Panorama of a Madman And a Composer who must Succumb a Car in Ancient India	2006	1	6	4.99	85	18.99	G
355	Ghostbusters Elf	A Thoughtful Epistle of a Dog And a Feminist who must Chase a Composer in Berlin	2006	1	7	0.99	101	18.99	R
357	Gilbert Pelican	A Fateful Tale of a Man And a Feminist who must Conquer a Crocodile in A Manhattan Penthouse	2006	1	7	0.99	114	13.99	G
358	Gilmore Boiled	A Unbelieveable Documentary of a Boat And a Husband who must Succumb a Student in A U-Boat	2006	1	5	0.99	163	29.99	R
359	Gladiator Westward	A Astounding Reflection of a Squirrel And a Sumo Wrestler who must Sink a Dentist in Ancient Japan	2006	1	6	4.99	173	20.99	PG
360	Glass Dying	A Astounding Drama of a Frisbee And a Astronaut who must Fight a Dog in Ancient Japan	2006	1	4	0.99	103	24.99	G
361	Gleaming Jawbreaker	A Amazing Display of a Composer And a Forensic Psychologist who must Discover a Car in The Canadian Rockies	2006	1	5	2.99	89	25.99	NC-17
362	Glory Tracy	A Amazing Saga of a Woman And a Womanizer who must Discover a Cat in The First Manned Space Station	2006	1	7	2.99	115	13.99	PG-13
363	Go Purple	A Fast-Paced Display of a Car And a Database Administrator who must Battle a Woman in A Baloon	2006	1	3	0.99	54	12.99	R
364	Godfather Diary	A Stunning Saga of a Lumberjack And a Squirrel who must Chase a Car in The Outback	2006	1	3	2.99	73	14.99	NC-17
365	Gold River	A Taut Documentary of a Database Administrator And a Waitress who must Reach a Mad Scientist in A Baloon Factory	2006	1	4	4.99	154	21.99	R
366	Goldfinger Sensibility	A Insightful Drama of a Mad Scientist And a Hunter who must Defeat a Pastry Chef in New Orleans	2006	1	3	0.99	93	29.99	G
367	Goldmine Tycoon	A Brilliant Epistle of a Composer And a Frisbee who must Conquer a Husband in The Outback	2006	1	6	0.99	153	20.99	R
368	Gone Trouble	A Insightful Character Study of a Mad Cow And a Forensic Psychologist who must Conquer a A Shark in A Manhattan Penthouse	2006	1	7	2.99	84	20.99	R
369	Goodfellas Salute	A Unbelieveable Tale of a Dog And a Explorer who must Sink a Mad Cow in A Baloon Factory	2006	1	4	4.99	56	22.99	PG
370	Gorgeous Bingo	A Action-Packed Display of a Sumo Wrestler And a Car who must Overcome a Waitress in A Baloon Factory	2006	1	4	2.99	108	26.99	R
371	Gosford Donnie	A Epic Panorama of a Mad Scientist And a Monkey who must Redeem a Secret Agent in Berlin	2006	1	5	4.99	129	17.99	G
372	Graceland Dynamite	A Taut Display of a Cat And a Girl who must Overcome a Database Administrator in New Orleans	2006	1	5	4.99	140	26.99	R
373	Graduate Lord	A Lacklusture Epistle of a Girl And a A Shark who must Meet a Mad Scientist in Ancient China	2006	1	7	2.99	156	14.99	G
374	Graffiti Love	A Unbelieveable Epistle of a Sumo Wrestler And a Hunter who must Build a Composer in Berlin	2006	1	3	0.99	117	29.99	PG
375	Grail Frankenstein	A Unbelieveable Saga of a Teacher And a Monkey who must Fight a Girl in An Abandoned Mine Shaft	2006	1	4	2.99	85	17.99	NC-17
376	Grapes Fury	A Boring Yarn of a Mad Cow And a Sumo Wrestler who must Meet a Robot in Australia	2006	1	4	0.99	155	20.99	G
377	Grease Youth	A Emotional Panorama of a Secret Agent And a Waitress who must Escape a Composer in Soviet Georgia	2006	1	7	0.99	135	20.99	G
378	Greatest North	A Astounding Character Study of a Secret Agent And a Robot who must Build a A Shark in Berlin	2006	1	5	2.99	93	24.99	NC-17
379	Greedy Roots	A Amazing Reflection of a A Shark And a Butler who must Chase a Hunter in The Canadian Rockies	2006	1	7	0.99	166	14.99	R
380	Greek Everyone	A Stunning Display of a Butler And a Teacher who must Confront a A Shark in The First Manned Space Station	2006	1	7	2.99	176	11.99	PG
381	Grinch Massage	A Intrepid Display of a Madman And a Feminist who must Pursue a Pioneer in The First Manned Space Station	2006	1	7	4.99	150	25.99	R
382	Grit Clockwork	A Thoughtful Display of a Dentist And a Squirrel who must Confront a Lumberjack in A Shark Tank	2006	1	3	0.99	137	21.99	PG
383	Groove Fiction	A Unbelieveable Reflection of a Moose And a A Shark who must Defeat a Lumberjack in An Abandoned Mine Shaft	2006	1	6	0.99	111	13.99	NC-17
385	Groundhog Uncut	A Brilliant Panorama of a Astronaut And a Technical Writer who must Discover a Butler in A Manhattan Penthouse	2006	1	6	4.99	139	26.99	PG-13
386	Gump Date	A Intrepid Yarn of a Explorer And a Student who must Kill a Husband in An Abandoned Mine Shaft	2006	1	3	4.99	53	12.99	NC-17
387	Gun Bonnie	A Boring Display of a Sumo Wrestler And a Husband who must Build a Waitress in The Gulf of Mexico	2006	1	7	0.99	100	27.99	G
388	Gunfight Moon	A Epic Reflection of a Pastry Chef And a Explorer who must Reach a Dentist in The Sahara Desert	2006	1	5	0.99	70	16.99	NC-17
389	Gunfighter Mussolini	A Touching Saga of a Robot And a Boy who must Kill a Man in Ancient Japan	2006	1	3	2.99	127	9.99	PG-13
390	Guys Falcon	A Boring Story of a Woman And a Feminist who must Redeem a Squirrel in A U-Boat	2006	1	4	4.99	84	20.99	R
391	Half Outfield	A Epic Epistle of a Database Administrator And a Crocodile who must Face a Madman in A Jet Boat	2006	1	6	2.99	146	25.99	PG-13
392	Hall Cassidy	A Beautiful Panorama of a Pastry Chef And a A Shark who must Battle a Pioneer in Soviet Georgia	2006	1	5	4.99	51	13.99	NC-17
393	Halloween Nuts	A Amazing Panorama of a Forensic Psychologist And a Technical Writer who must Fight a Dentist in A U-Boat	2006	1	6	2.99	47	19.99	PG-13
394	Hamlet Wisdom	A Touching Reflection of a Man And a Man who must Sink a Robot in The Outback	2006	1	7	2.99	146	21.99	R
449	Identity Lover	A Boring Tale of a Composer And a Mad Cow who must Defeat a Car in The Outback	2006	1	4	2.99	119	12.99	PG-13
395	Handicap Boondock	A Beautiful Display of a Pioneer And a Squirrel who must Vanquish a Sumo Wrestler in Soviet Georgia	2006	1	4	0.99	108	28.99	R
396	Hanging Deep	A Action-Packed Yarn of a Boat And a Crocodile who must Build a Monkey in Berlin	2006	1	5	4.99	62	18.99	G
397	Hanky October	A Boring Epistle of a Database Administrator And a Explorer who must Pursue a Madman in Soviet Georgia	2006	1	5	2.99	107	26.99	NC-17
398	Hanover Galaxy	A Stunning Reflection of a Girl And a Secret Agent who must Succumb a Boy in A MySQL Convention	2006	1	5	4.99	47	21.99	NC-17
399	Happiness United	A Action-Packed Panorama of a Husband And a Feminist who must Meet a Forensic Psychologist in Ancient Japan	2006	1	6	2.99	100	23.99	G
400	Hardly Robbers	A Emotional Character Study of a Hunter And a Car who must Kill a Woman in Berlin	2006	1	7	2.99	72	15.99	R
401	Harold French	A Stunning Saga of a Sumo Wrestler And a Student who must Outrace a Moose in The Sahara Desert	2006	1	6	0.99	168	10.99	NC-17
402	Harper Dying	A Awe-Inspiring Reflection of a Woman And a Cat who must Confront a Feminist in The Sahara Desert	2006	1	3	0.99	52	15.99	G
403	Harry Idaho	A Taut Yarn of a Technical Writer And a Feminist who must Outrace a Dog in California	2006	1	5	4.99	121	18.99	PG-13
404	Hate Handicap	A Intrepid Reflection of a Mad Scientist And a Pioneer who must Overcome a Hunter in The First Manned Space Station	2006	1	4	0.99	107	26.99	PG
405	Haunted Antitrust	A Amazing Saga of a Man And a Dentist who must Reach a Technical Writer in Ancient India	2006	1	6	4.99	76	13.99	NC-17
406	Haunting Pianist	A Fast-Paced Story of a Database Administrator And a Composer who must Defeat a Squirrel in An Abandoned Amusement Park	2006	1	5	0.99	181	22.99	R
407	Hawk Chill	A Action-Packed Drama of a Mad Scientist And a Composer who must Outgun a Car in Australia	2006	1	5	0.99	47	12.99	PG-13
408	Head Stranger	A Thoughtful Saga of a Hunter And a Crocodile who must Confront a Dog in The Gulf of Mexico	2006	1	4	4.99	69	28.99	R
409	Heartbreakers Bright	A Awe-Inspiring Documentary of a A Shark And a Dentist who must Outrace a Pastry Chef in The Canadian Rockies	2006	1	3	4.99	59	9.99	G
410	Heaven Freedom	A Intrepid Story of a Butler And a Car who must Vanquish a Man in New Orleans	2006	1	7	2.99	48	19.99	PG
411	Heavenly Gun	A Beautiful Yarn of a Forensic Psychologist And a Frisbee who must Battle a Moose in A Jet Boat	2006	1	5	4.99	49	13.99	NC-17
412	Heavyweights Beast	A Unbelieveable Story of a Composer And a Dog who must Overcome a Womanizer in An Abandoned Amusement Park	2006	1	6	4.99	102	25.99	G
451	Igby Maker	A Epic Documentary of a Hunter And a Dog who must Outgun a Dog in A Baloon Factory	2006	1	7	4.99	160	12.99	NC-17
413	Hedwig Alter	A Action-Packed Yarn of a Womanizer And a Lumberjack who must Chase a Sumo Wrestler in A Monastery	2006	1	7	2.99	169	16.99	NC-17
414	Hellfighters Sierra	A Taut Reflection of a A Shark And a Dentist who must Battle a Boat in Soviet Georgia	2006	1	3	2.99	75	23.99	PG
415	High Encino	A Fateful Saga of a Waitress And a Hunter who must Outrace a Sumo Wrestler in Australia	2006	1	3	2.99	84	23.99	R
416	Highball Potter	A Action-Packed Saga of a Husband And a Dog who must Redeem a Database Administrator in The Sahara Desert	2006	1	6	0.99	110	10.99	R
417	Hills Neighbors	A Epic Display of a Hunter And a Feminist who must Sink a Car in A U-Boat	2006	1	5	0.99	93	29.99	G
418	Hobbit Alien	A Emotional Drama of a Husband And a Girl who must Outgun a Composer in The First Manned Space Station	2006	1	5	0.99	157	27.99	PG-13
419	Hocus Frida	A Awe-Inspiring Tale of a Girl And a Madman who must Outgun a Student in A Shark Tank	2006	1	4	2.99	141	19.99	G
420	Holes Brannigan	A Fast-Paced Reflection of a Technical Writer And a Student who must Fight a Boy in The Canadian Rockies	2006	1	7	4.99	128	27.99	PG
421	Holiday Games	A Insightful Reflection of a Waitress And a Madman who must Pursue a Boy in Ancient Japan	2006	1	7	4.99	78	10.99	PG-13
422	Hollow Jeopardy	A Beautiful Character Study of a Robot And a Astronaut who must Overcome a Boat in A Monastery	2006	1	7	4.99	136	25.99	NC-17
423	Hollywood Anonymous	A Fast-Paced Epistle of a Boy And a Explorer who must Escape a Dog in A U-Boat	2006	1	7	0.99	69	29.99	PG
424	Holocaust Highball	A Awe-Inspiring Yarn of a Composer And a Man who must Find a Robot in Soviet Georgia	2006	1	6	0.99	149	12.99	R
425	Holy Tadpole	A Action-Packed Display of a Feminist And a Pioneer who must Pursue a Dog in A Baloon Factory	2006	1	6	0.99	88	20.99	R
426	Home Pity	A Touching Panorama of a Man And a Secret Agent who must Challenge a Teacher in A MySQL Convention	2006	1	7	4.99	185	15.99	R
427	Homeward Cider	A Taut Reflection of a Astronaut And a Squirrel who must Fight a Squirrel in A Manhattan Penthouse	2006	1	5	0.99	103	19.99	R
428	Homicide Peach	A Astounding Documentary of a Hunter And a Boy who must Confront a Boy in A MySQL Convention	2006	1	6	2.99	141	21.99	PG-13
429	Honey Ties	A Taut Story of a Waitress And a Crocodile who must Outrace a Lumberjack in A Shark Tank	2006	1	3	0.99	84	29.99	R
430	Hook Chariots	A Insightful Story of a Boy And a Dog who must Redeem a Boy in Australia	2006	1	7	0.99	49	23.99	G
450	Idols Snatchers	A Insightful Drama of a Car And a Composer who must Fight a Man in A Monastery	2006	1	5	2.99	84	29.99	NC-17
431	Hoosiers Birdcage	A Astounding Display of a Explorer And a Boat who must Vanquish a Car in The First Manned Space Station	2006	1	3	2.99	176	12.99	G
432	Hope Tootsie	A Amazing Documentary of a Student And a Sumo Wrestler who must Outgun a A Shark in A Shark Tank	2006	1	4	2.99	139	22.99	NC-17
433	Horn Working	A Stunning Display of a Mad Scientist And a Technical Writer who must Succumb a Monkey in A Shark Tank	2006	1	4	2.99	95	23.99	PG
434	Horror Reign	A Touching Documentary of a A Shark And a Car who must Build a Husband in Nigeria	2006	1	3	0.99	139	25.99	R
435	Hotel Happiness	A Thrilling Yarn of a Pastry Chef And a A Shark who must Challenge a Mad Scientist in The Outback	2006	1	6	4.99	181	28.99	PG-13
436	Hours Rage	A Fateful Story of a Explorer And a Feminist who must Meet a Technical Writer in Soviet Georgia	2006	1	4	0.99	122	14.99	NC-17
437	House Dynamite	A Taut Story of a Pioneer And a Squirrel who must Battle a Student in Soviet Georgia	2006	1	7	2.99	109	13.99	R
438	Human Graffiti	A Beautiful Reflection of a Womanizer And a Sumo Wrestler who must Chase a Database Administrator in The Gulf of Mexico	2006	1	3	2.99	68	22.99	NC-17
439	Hunchback Impossible	A Touching Yarn of a Frisbee And a Dentist who must Fight a Composer in Ancient Japan	2006	1	4	4.99	151	28.99	PG-13
440	Hunger Roof	A Unbelieveable Yarn of a Student And a Database Administrator who must Outgun a Husband in An Abandoned Mine Shaft	2006	1	6	0.99	105	21.99	G
441	Hunter Alter	A Emotional Drama of a Mad Cow And a Boat who must Redeem a Secret Agent in A Shark Tank	2006	1	5	2.99	125	21.99	PG-13
442	Hunting Musketeers	A Thrilling Reflection of a Pioneer And a Dentist who must Outrace a Womanizer in An Abandoned Mine Shaft	2006	1	6	2.99	65	24.99	NC-17
443	Hurricane Affair	A Lacklusture Epistle of a Database Administrator And a Woman who must Meet a Hunter in An Abandoned Mine Shaft	2006	1	6	2.99	49	11.99	PG
444	Hustler Party	A Emotional Reflection of a Sumo Wrestler And a Monkey who must Conquer a Robot in The Sahara Desert	2006	1	3	4.99	83	22.99	NC-17
445	Hyde Doctor	A Fanciful Documentary of a Boy And a Woman who must Redeem a Womanizer in A Jet Boat	2006	1	5	2.99	100	11.99	G
446	Hysterical Grail	A Amazing Saga of a Madman And a Dentist who must Build a Car in A Manhattan Penthouse	2006	1	5	4.99	150	19.99	PG
447	Ice Crossing	A Fast-Paced Tale of a Butler And a Moose who must Overcome a Pioneer in A Manhattan Penthouse	2006	1	5	2.99	131	28.99	R
448	Idaho Love	A Fast-Paced Drama of a Student And a Crocodile who must Meet a Database Administrator in The Outback	2006	1	3	2.99	172	25.99	PG-13
452	Illusion Amelie	A Emotional Epistle of a Boat And a Mad Scientist who must Outrace a Robot in An Abandoned Mine Shaft	2006	1	4	0.99	122	15.99	R
545	Madness Attacks	A Fanciful Tale of a Squirrel And a Boat who must Defeat a Crocodile in The Gulf of Mexico	2006	1	4	0.99	178	14.99	PG-13
453	Image Princess	A Lacklusture Panorama of a Secret Agent And a Crocodile who must Discover a Madman in The Canadian Rockies	2006	1	3	2.99	178	17.99	PG-13
454	Impact Aladdin	A Epic Character Study of a Frisbee And a Moose who must Outgun a Technical Writer in A Shark Tank	2006	1	6	0.99	180	20.99	PG-13
455	Impossible Prejudice	A Awe-Inspiring Yarn of a Monkey And a Hunter who must Chase a Teacher in Ancient China	2006	1	7	4.99	103	11.99	NC-17
456	Inch Jet	A Fateful Saga of a Womanizer And a Student who must Defeat a Butler in A Monastery	2006	1	6	4.99	167	18.99	NC-17
457	Independence Hotel	A Thrilling Tale of a Technical Writer And a Boy who must Face a Pioneer in A Monastery	2006	1	5	0.99	157	21.99	NC-17
458	Indian Love	A Insightful Saga of a Mad Scientist And a Mad Scientist who must Kill a Astronaut in An Abandoned Fun House	2006	1	4	0.99	135	26.99	NC-17
459	Informer Double	A Action-Packed Display of a Woman And a Dentist who must Redeem a Forensic Psychologist in The Canadian Rockies	2006	1	4	4.99	74	23.99	NC-17
460	Innocent Usual	A Beautiful Drama of a Pioneer And a Crocodile who must Challenge a Student in The Outback	2006	1	3	4.99	178	26.99	PG-13
461	Insects Stone	A Epic Display of a Butler And a Dog who must Vanquish a Crocodile in A Manhattan Penthouse	2006	1	3	0.99	123	14.99	NC-17
462	Insider Arizona	A Astounding Saga of a Mad Scientist And a Hunter who must Pursue a Robot in A Baloon Factory	2006	1	5	2.99	78	17.99	NC-17
463	Instinct Airport	A Touching Documentary of a Mad Cow And a Explorer who must Confront a Butler in A Manhattan Penthouse	2006	1	4	2.99	116	21.99	PG
464	Intentions Empire	A Astounding Epistle of a Cat And a Cat who must Conquer a Mad Cow in A U-Boat	2006	1	3	2.99	107	13.99	PG-13
465	Interview Liaisons	A Action-Packed Reflection of a Student And a Butler who must Discover a Database Administrator in A Manhattan Penthouse	2006	1	4	4.99	59	17.99	R
466	Intolerable Intentions	A Awe-Inspiring Story of a Monkey And a Pastry Chef who must Succumb a Womanizer in A MySQL Convention	2006	1	6	4.99	63	20.99	PG-13
467	Intrigue Worst	A Fanciful Character Study of a Explorer And a Mad Scientist who must Vanquish a Squirrel in A Jet Boat	2006	1	6	0.99	181	10.99	G
468	Invasion Cyclone	A Lacklusture Character Study of a Mad Scientist And a Womanizer who must Outrace a Explorer in A Monastery	2006	1	5	2.99	97	12.99	PG
469	Iron Moon	A Fast-Paced Documentary of a Mad Cow And a Boy who must Pursue a Dentist in A Baloon	2006	1	7	4.99	46	27.99	PG
470	Ishtar Rocketeer	A Astounding Saga of a Dog And a Squirrel who must Conquer a Dog in An Abandoned Fun House	2006	1	4	4.99	79	24.99	R
471	Island Exorcist	A Fanciful Panorama of a Technical Writer And a Boy who must Find a Dentist in An Abandoned Fun House	2006	1	7	2.99	84	23.99	NC-17
472	Italian African	A Astounding Character Study of a Monkey And a Moose who must Outgun a Cat in A U-Boat	2006	1	3	4.99	174	24.99	G
473	Jacket Frisco	A Insightful Reflection of a Womanizer And a Husband who must Conquer a Pastry Chef in A Baloon	2006	1	5	2.99	181	16.99	PG-13
474	Jade Bunch	A Insightful Panorama of a Squirrel And a Mad Cow who must Confront a Student in The First Manned Space Station	2006	1	6	2.99	174	21.99	NC-17
475	Japanese Run	A Awe-Inspiring Epistle of a Feminist And a Girl who must Sink a Girl in The Outback	2006	1	6	0.99	135	29.99	G
476	Jason Trap	A Thoughtful Tale of a Woman And a A Shark who must Conquer a Dog in A Monastery	2006	1	5	2.99	130	9.99	NC-17
477	Jawbreaker Brooklyn	A Stunning Reflection of a Boat And a Pastry Chef who must Succumb a A Shark in A Jet Boat	2006	1	5	0.99	118	15.99	PG
478	Jaws Harry	A Thrilling Display of a Database Administrator And a Monkey who must Overcome a Dog in An Abandoned Fun House	2006	1	4	2.99	112	10.99	G
479	Jedi Beneath	A Astounding Reflection of a Explorer And a Dentist who must Pursue a Student in Nigeria	2006	1	7	0.99	128	12.99	PG
480	Jeepers Wedding	A Astounding Display of a Composer And a Dog who must Kill a Pastry Chef in Soviet Georgia	2006	1	3	2.99	84	29.99	R
481	Jekyll Frogmen	A Fanciful Epistle of a Student And a Astronaut who must Kill a Waitress in A Shark Tank	2006	1	4	2.99	58	22.99	PG
482	Jeopardy Encino	A Boring Panorama of a Man And a Mad Cow who must Face a Explorer in Ancient India	2006	1	3	0.99	102	12.99	R
483	Jericho Mulan	A Amazing Yarn of a Hunter And a Butler who must Defeat a Boy in A Jet Boat	2006	1	3	2.99	171	29.99	NC-17
484	Jerk Paycheck	A Touching Character Study of a Pastry Chef And a Database Administrator who must Reach a A Shark in Ancient Japan	2006	1	3	2.99	172	13.99	NC-17
485	Jersey Sassy	A Lacklusture Documentary of a Madman And a Mad Cow who must Find a Feminist in Ancient Japan	2006	1	6	4.99	60	16.99	PG
486	Jet Neighbors	A Amazing Display of a Lumberjack And a Teacher who must Outrace a Woman in A U-Boat	2006	1	7	4.99	59	14.99	R
487	Jingle Sagebrush	A Epic Character Study of a Feminist And a Student who must Meet a Woman in A Baloon	2006	1	6	4.99	124	29.99	PG-13
488	Joon Northwest	A Thrilling Panorama of a Technical Writer And a Car who must Discover a Forensic Psychologist in A Shark Tank	2006	1	3	0.99	105	23.99	NC-17
489	Juggler Hardly	A Epic Story of a Mad Cow And a Astronaut who must Challenge a Car in California	2006	1	4	0.99	54	14.99	PG-13
490	Jumanji Blade	A Intrepid Yarn of a Husband And a Womanizer who must Pursue a Mad Scientist in New Orleans	2006	1	4	2.99	121	13.99	G
491	Jumping Wrath	A Touching Epistle of a Monkey And a Feminist who must Discover a Boat in Berlin	2006	1	4	0.99	74	18.99	NC-17
492	Jungle Closer	A Boring Character Study of a Boy And a Woman who must Battle a Astronaut in Australia	2006	1	6	0.99	134	11.99	NC-17
493	Kane Exorcist	A Epic Documentary of a Composer And a Robot who must Overcome a Car in Berlin	2006	1	5	0.99	92	18.99	R
494	Karate Moon	A Astounding Yarn of a Womanizer And a Dog who must Reach a Waitress in A MySQL Convention	2006	1	4	0.99	120	21.99	PG-13
495	Kentuckian Giant	A Stunning Yarn of a Woman And a Frisbee who must Escape a Waitress in A U-Boat	2006	1	5	2.99	169	10.99	PG
496	Kick Savannah	A Emotional Drama of a Monkey And a Robot who must Defeat a Monkey in New Orleans	2006	1	3	0.99	179	10.99	PG-13
497	Kill Brotherhood	A Touching Display of a Hunter And a Secret Agent who must Redeem a Husband in The Outback	2006	1	4	0.99	54	15.99	G
498	Killer Innocent	A Fanciful Character Study of a Student And a Explorer who must Succumb a Composer in An Abandoned Mine Shaft	2006	1	7	2.99	161	11.99	R
499	King Evolution	A Action-Packed Tale of a Boy And a Lumberjack who must Chase a Madman in A Baloon	2006	1	3	4.99	184	24.99	NC-17
500	Kiss Glory	A Lacklusture Reflection of a Girl And a Husband who must Find a Robot in The Canadian Rockies	2006	1	5	4.99	163	11.99	PG-13
501	Kissing Dolls	A Insightful Reflection of a Pioneer And a Teacher who must Build a Composer in The First Manned Space Station	2006	1	3	4.99	141	9.99	R
502	Knock Warlock	A Unbelieveable Story of a Teacher And a Boat who must Confront a Moose in A Baloon	2006	1	4	2.99	71	21.99	PG-13
503	Kramer Chocolate	A Amazing Yarn of a Robot And a Pastry Chef who must Redeem a Mad Scientist in The Outback	2006	1	3	2.99	171	24.99	R
504	Kwai Homeward	A Amazing Drama of a Car And a Squirrel who must Pursue a Car in Soviet Georgia	2006	1	5	0.99	46	25.99	PG-13
505	Labyrinth League	A Awe-Inspiring Saga of a Composer And a Frisbee who must Succumb a Pioneer in The Sahara Desert	2006	1	6	2.99	46	24.99	PG-13
753	Rush Goodfellas	A Emotional Display of a Man And a Dentist who must Challenge a Squirrel in Australia	2006	1	3	0.99	48	20.99	PG
506	Lady Stage	A Beautiful Character Study of a Woman And a Man who must Pursue a Explorer in A U-Boat	2006	1	4	4.99	67	14.99	PG
507	Ladybugs Armageddon	A Fateful Reflection of a Dog And a Mad Scientist who must Meet a Mad Scientist in New Orleans	2006	1	4	0.99	113	13.99	NC-17
508	Lambs Cincinatti	A Insightful Story of a Man And a Feminist who must Fight a Composer in Australia	2006	1	6	4.99	144	18.99	PG-13
509	Language Cowboy	A Epic Yarn of a Cat And a Madman who must Vanquish a Dentist in An Abandoned Amusement Park	2006	1	5	0.99	78	26.99	NC-17
510	Lawless Vision	A Insightful Yarn of a Boy And a Sumo Wrestler who must Outgun a Car in The Outback	2006	1	6	4.99	181	29.99	G
511	Lawrence Love	A Fanciful Yarn of a Database Administrator And a Mad Cow who must Pursue a Womanizer in Berlin	2006	1	7	0.99	175	23.99	NC-17
512	League Hellfighters	A Thoughtful Saga of a A Shark And a Monkey who must Outgun a Student in Ancient China	2006	1	5	4.99	110	25.99	PG-13
513	Leathernecks Dwarfs	A Fateful Reflection of a Dog And a Mad Cow who must Outrace a Teacher in An Abandoned Mine Shaft	2006	1	6	2.99	153	21.99	PG-13
514	Lebowski Soldiers	A Beautiful Epistle of a Secret Agent And a Pioneer who must Chase a Astronaut in Ancient China	2006	1	6	2.99	69	17.99	PG-13
515	Legally Secretary	A Astounding Tale of a A Shark And a Moose who must Meet a Womanizer in The Sahara Desert	2006	1	7	4.99	113	14.99	PG
516	Legend Jedi	A Awe-Inspiring Epistle of a Pioneer And a Student who must Outgun a Crocodile in The Outback	2006	1	7	0.99	59	18.99	PG
517	Lesson Cleopatra	A Emotional Display of a Man And a Explorer who must Build a Boy in A Manhattan Penthouse	2006	1	3	0.99	167	28.99	NC-17
518	Liaisons Sweet	A Boring Drama of a A Shark And a Explorer who must Redeem a Waitress in The Canadian Rockies	2006	1	5	4.99	140	15.99	PG
519	Liberty Magnificent	A Boring Drama of a Student And a Cat who must Sink a Technical Writer in A Baloon	2006	1	3	2.99	138	27.99	G
520	License Weekend	A Insightful Story of a Man And a Husband who must Overcome a Madman in A Monastery	2006	1	7	2.99	91	28.99	NC-17
521	Lies Treatment	A Fast-Paced Character Study of a Dentist And a Moose who must Defeat a Composer in The First Manned Space Station	2006	1	7	4.99	147	28.99	NC-17
522	Life Twisted	A Thrilling Reflection of a Teacher And a Composer who must Find a Man in The First Manned Space Station	2006	1	4	2.99	137	9.99	NC-17
523	Lights Deer	A Unbelieveable Epistle of a Dog And a Woman who must Confront a Moose in The Gulf of Mexico	2006	1	7	0.99	174	21.99	R
560	Mars Roman	A Boring Drama of a Car And a Dog who must Succumb a Madman in Soviet Georgia	2006	1	6	0.99	62	21.99	NC-17
524	Lion Uncut	A Intrepid Display of a Pastry Chef And a Cat who must Kill a A Shark in Ancient China	2006	1	6	0.99	50	13.99	PG
525	Loathing Legally	A Boring Epistle of a Pioneer And a Mad Scientist who must Escape a Frisbee in The Gulf of Mexico	2006	1	4	0.99	140	29.99	R
526	Lock Rear	A Thoughtful Character Study of a Squirrel And a Technical Writer who must Outrace a Student in Ancient Japan	2006	1	7	2.99	120	10.99	R
527	Lola Agent	A Astounding Tale of a Mad Scientist And a Husband who must Redeem a Database Administrator in Ancient Japan	2006	1	4	4.99	85	24.99	PG
528	Lolita World	A Thrilling Drama of a Girl And a Robot who must Redeem a Waitress in An Abandoned Mine Shaft	2006	1	4	2.99	155	25.99	NC-17
529	Lonely Elephant	A Intrepid Story of a Student And a Dog who must Challenge a Explorer in Soviet Georgia	2006	1	3	2.99	67	12.99	G
530	Lord Arizona	A Action-Packed Display of a Frisbee And a Pastry Chef who must Pursue a Crocodile in A Jet Boat	2006	1	5	2.99	108	27.99	PG-13
531	Lose Inch	A Stunning Reflection of a Student And a Technical Writer who must Battle a Butler in The First Manned Space Station	2006	1	3	0.99	137	18.99	R
532	Loser Hustler	A Stunning Drama of a Robot And a Feminist who must Outgun a Butler in Nigeria	2006	1	5	4.99	80	28.99	PG
533	Lost Bird	A Emotional Character Study of a Robot And a A Shark who must Defeat a Technical Writer in A Manhattan Penthouse	2006	1	4	2.99	98	21.99	PG-13
534	Louisiana Harry	A Lacklusture Drama of a Girl And a Technical Writer who must Redeem a Monkey in A Shark Tank	2006	1	5	0.99	70	18.99	PG-13
535	Love Suicides	A Brilliant Panorama of a Hunter And a Explorer who must Pursue a Dentist in An Abandoned Fun House	2006	1	6	0.99	181	21.99	R
536	Lovely Jingle	A Fanciful Yarn of a Crocodile And a Forensic Psychologist who must Discover a Crocodile in The Outback	2006	1	3	2.99	65	18.99	PG
537	Lover Truman	A Emotional Yarn of a Robot And a Boy who must Outgun a Technical Writer in A U-Boat	2006	1	3	2.99	75	29.99	G
538	Loverboy Attacks	A Boring Story of a Car And a Butler who must Build a Girl in Soviet Georgia	2006	1	7	0.99	162	19.99	PG-13
539	Luck Opus	A Boring Display of a Moose And a Squirrel who must Outrace a Teacher in A Shark Tank	2006	1	7	2.99	152	21.99	NC-17
540	Lucky Flying	A Lacklusture Character Study of a A Shark And a Man who must Find a Forensic Psychologist in A U-Boat	2006	1	7	2.99	97	10.99	PG-13
541	Luke Mummy	A Taut Character Study of a Boy And a Robot who must Redeem a Mad Scientist in Ancient India	2006	1	5	2.99	74	21.99	NC-17
561	Mask Peach	A Boring Character Study of a Student And a Robot who must Meet a Woman in California	2006	1	6	2.99	123	26.99	NC-17
542	Lust Lock	A Fanciful Panorama of a Hunter And a Dentist who must Meet a Secret Agent in The Sahara Desert	2006	1	3	2.99	52	28.99	G
543	Madigan Dorado	A Astounding Character Study of a A Shark And a A Shark who must Discover a Crocodile in The Outback	2006	1	5	4.99	116	20.99	R
544	Madison Trap	A Awe-Inspiring Reflection of a Monkey And a Dentist who must Overcome a Pioneer in A U-Boat	2006	1	4	2.99	147	11.99	R
546	Madre Gables	A Intrepid Panorama of a Sumo Wrestler And a Forensic Psychologist who must Discover a Moose in The First Manned Space Station	2006	1	7	2.99	98	27.99	PG-13
547	Magic Mallrats	A Touching Documentary of a Pastry Chef And a Pastry Chef who must Build a Mad Scientist in California	2006	1	3	0.99	117	19.99	PG
548	Magnificent Chitty	A Insightful Story of a Teacher And a Hunter who must Face a Mad Cow in California	2006	1	3	2.99	53	27.99	R
549	Magnolia Forrester	A Thoughtful Documentary of a Composer And a Explorer who must Conquer a Dentist in New Orleans	2006	1	4	0.99	171	28.99	PG-13
550	Maguire Apache	A Fast-Paced Reflection of a Waitress And a Hunter who must Defeat a Forensic Psychologist in A Baloon	2006	1	6	2.99	74	22.99	NC-17
551	Maiden Home	A Lacklusture Saga of a Moose And a Teacher who must Kill a Forensic Psychologist in A MySQL Convention	2006	1	3	4.99	138	9.99	PG
552	Majestic Floats	A Thrilling Character Study of a Moose And a Student who must Escape a Butler in The First Manned Space Station	2006	1	5	0.99	130	15.99	PG
553	Maker Gables	A Stunning Display of a Moose And a Database Administrator who must Pursue a Composer in A Jet Boat	2006	1	4	0.99	136	12.99	PG-13
554	Malkovich Pet	A Intrepid Reflection of a Waitress And a A Shark who must Kill a Squirrel in The Outback	2006	1	6	2.99	159	22.99	G
555	Mallrats United	A Thrilling Yarn of a Waitress And a Dentist who must Find a Hunter in A Monastery	2006	1	4	0.99	133	25.99	PG
556	Maltese Hope	A Fast-Paced Documentary of a Crocodile And a Sumo Wrestler who must Conquer a Explorer in California	2006	1	6	4.99	127	26.99	PG-13
557	Manchurian Curtain	A Stunning Tale of a Mad Cow And a Boy who must Battle a Boy in Berlin	2006	1	5	2.99	177	27.99	PG
558	Mannequin Worst	A Astounding Saga of a Mad Cow And a Pastry Chef who must Discover a Husband in Ancient India	2006	1	3	2.99	71	18.99	PG-13
559	Married Go	A Fanciful Story of a Womanizer And a Dog who must Face a Forensic Psychologist in The Sahara Desert	2006	1	7	2.99	114	22.99	G
562	Masked Bubble	A Fanciful Documentary of a Pioneer And a Boat who must Pursue a Pioneer in An Abandoned Mine Shaft	2006	1	6	0.99	151	12.99	PG-13
563	Massacre Usual	A Fateful Reflection of a Waitress And a Crocodile who must Challenge a Forensic Psychologist in California	2006	1	6	4.99	165	16.99	R
564	Massage Image	A Fateful Drama of a Frisbee And a Crocodile who must Vanquish a Dog in The First Manned Space Station	2006	1	4	2.99	161	11.99	PG
565	Matrix Snowman	A Action-Packed Saga of a Womanizer And a Woman who must Overcome a Student in California	2006	1	6	4.99	56	9.99	PG-13
566	Maude Mod	A Beautiful Documentary of a Forensic Psychologist And a Cat who must Reach a Astronaut in Nigeria	2006	1	6	0.99	72	20.99	R
568	Memento Zoolander	A Touching Epistle of a Squirrel And a Explorer who must Redeem a Pastry Chef in The Sahara Desert	2006	1	4	4.99	77	11.99	NC-17
569	Menagerie Rushmore	A Unbelieveable Panorama of a Composer And a Butler who must Overcome a Database Administrator in The First Manned Space Station	2006	1	7	2.99	147	18.99	G
570	Mermaid Insects	A Lacklusture Drama of a Waitress And a Husband who must Fight a Husband in California	2006	1	5	4.99	104	20.99	NC-17
571	Metal Armageddon	A Thrilling Display of a Lumberjack And a Crocodile who must Meet a Monkey in A Baloon Factory	2006	1	6	2.99	161	26.99	PG-13
572	Metropolis Coma	A Emotional Saga of a Database Administrator And a Pastry Chef who must Confront a Teacher in A Baloon Factory	2006	1	4	2.99	64	9.99	PG-13
573	Microcosmos Paradise	A Touching Character Study of a Boat And a Student who must Sink a A Shark in Nigeria	2006	1	6	2.99	105	22.99	PG-13
574	Midnight Westward	A Taut Reflection of a Husband And a A Shark who must Redeem a Pastry Chef in A Monastery	2006	1	3	0.99	86	19.99	G
575	Midsummer Groundhog	A Fateful Panorama of a Moose And a Dog who must Chase a Crocodile in Ancient Japan	2006	1	3	4.99	48	27.99	G
576	Mighty Luck	A Astounding Epistle of a Mad Scientist And a Pioneer who must Escape a Database Administrator in A MySQL Convention	2006	1	7	2.99	122	13.99	PG
577	Mile Mulan	A Lacklusture Epistle of a Cat And a Husband who must Confront a Boy in A MySQL Convention	2006	1	4	0.99	64	10.99	PG
578	Million Ace	A Brilliant Documentary of a Womanizer And a Squirrel who must Find a Technical Writer in The Sahara Desert	2006	1	4	4.99	142	16.99	PG-13
579	Minds Truman	A Taut Yarn of a Mad Scientist And a Crocodile who must Outgun a Database Administrator in A Monastery	2006	1	3	4.99	149	22.99	PG-13
580	Mine Titans	A Amazing Yarn of a Robot And a Womanizer who must Discover a Forensic Psychologist in Berlin	2006	1	3	4.99	166	12.99	PG-13
581	Minority Kiss	A Insightful Display of a Lumberjack And a Sumo Wrestler who must Meet a Man in The Outback	2006	1	4	0.99	59	16.99	G
582	Miracle Virtual	A Touching Epistle of a Butler And a Boy who must Find a Mad Scientist in The Sahara Desert	2006	1	3	2.99	162	19.99	PG-13
583	Mission Zoolander	A Intrepid Story of a Sumo Wrestler And a Teacher who must Meet a A Shark in An Abandoned Fun House	2006	1	3	4.99	164	26.99	PG-13
584	Mixed Doors	A Taut Drama of a Womanizer And a Lumberjack who must Succumb a Pioneer in Ancient India	2006	1	6	2.99	180	26.99	PG-13
585	Mob Duffel	A Unbelieveable Documentary of a Frisbee And a Boat who must Meet a Boy in The Canadian Rockies	2006	1	4	0.99	105	25.99	G
586	Mockingbird Hollywood	A Thoughtful Panorama of a Man And a Car who must Sink a Composer in Berlin	2006	1	4	0.99	60	27.99	PG
587	Mod Secretary	A Boring Documentary of a Mad Cow And a Cat who must Build a Lumberjack in New Orleans	2006	1	6	4.99	77	20.99	NC-17
588	Model Fish	A Beautiful Panorama of a Boat And a Crocodile who must Outrace a Dog in Australia	2006	1	4	4.99	175	11.99	NC-17
589	Modern Dorado	A Awe-Inspiring Story of a Butler And a Sumo Wrestler who must Redeem a Boy in New Orleans	2006	1	3	0.99	74	20.99	PG
590	Money Harold	A Touching Tale of a Explorer And a Boat who must Defeat a Robot in Australia	2006	1	3	2.99	135	17.99	PG
591	Monsoon Cause	A Astounding Tale of a Crocodile And a Car who must Outrace a Squirrel in A U-Boat	2006	1	6	4.99	182	20.99	PG
592	Monster Spartacus	A Fast-Paced Story of a Waitress And a Cat who must Fight a Girl in Australia	2006	1	6	2.99	107	28.99	PG
593	Monterey Labyrinth	A Awe-Inspiring Drama of a Monkey And a Composer who must Escape a Feminist in A U-Boat	2006	1	6	0.99	158	13.99	G
594	Montezuma Command	A Thrilling Reflection of a Waitress And a Butler who must Battle a Butler in A Jet Boat	2006	1	6	0.99	126	22.99	NC-17
595	Moon Bunch	A Beautiful Tale of a Astronaut And a Mad Cow who must Challenge a Cat in A Baloon Factory	2006	1	7	0.99	83	20.99	PG
596	Moonshine Cabin	A Thoughtful Display of a Astronaut And a Feminist who must Chase a Frisbee in A Jet Boat	2006	1	4	4.99	171	25.99	PG-13
597	Moonwalker Fool	A Epic Drama of a Feminist And a Pioneer who must Sink a Composer in New Orleans	2006	1	5	4.99	184	12.99	G
598	Mosquito Armageddon	A Thoughtful Character Study of a Waitress And a Feminist who must Build a Teacher in Ancient Japan	2006	1	6	0.99	57	22.99	G
599	Mother Oleander	A Boring Tale of a Husband And a Boy who must Fight a Squirrel in Ancient China	2006	1	3	0.99	103	20.99	R
600	Motions Details	A Awe-Inspiring Reflection of a Dog And a Student who must Kill a Car in An Abandoned Fun House	2006	1	5	0.99	166	16.99	PG
601	Moulin Wake	A Astounding Story of a Forensic Psychologist And a Cat who must Battle a Teacher in An Abandoned Mine Shaft	2006	1	4	0.99	79	20.99	PG-13
602	Mourning Purple	A Lacklusture Display of a Waitress And a Lumberjack who must Chase a Pioneer in New Orleans	2006	1	5	0.99	146	14.99	PG
736	Robbery Bright	A Taut Reflection of a Robot And a Squirrel who must Fight a Boat in Ancient Japan	2006	1	4	0.99	134	21.99	R
603	Movie Shakespeare	A Insightful Display of a Database Administrator And a Student who must Build a Hunter in Berlin	2006	1	6	4.99	53	27.99	PG
604	Mulan Moon	A Emotional Saga of a Womanizer And a Pioneer who must Overcome a Dentist in A Baloon	2006	1	4	0.99	160	10.99	G
605	Mulholland Beast	A Awe-Inspiring Display of a Husband And a Squirrel who must Battle a Sumo Wrestler in A Jet Boat	2006	1	7	2.99	157	13.99	PG
606	Mummy Creatures	A Fateful Character Study of a Crocodile And a Monkey who must Meet a Dentist in Australia	2006	1	3	0.99	160	15.99	NC-17
607	Muppet Mile	A Lacklusture Story of a Madman And a Teacher who must Kill a Frisbee in The Gulf of Mexico	2006	1	5	4.99	50	18.99	PG
608	Murder Antitrust	A Brilliant Yarn of a Car And a Database Administrator who must Escape a Boy in A MySQL Convention	2006	1	6	2.99	166	11.99	PG
609	Muscle Bright	A Stunning Panorama of a Sumo Wrestler And a Husband who must Redeem a Madman in Ancient India	2006	1	7	2.99	185	23.99	G
610	Music Boondock	A Thrilling Tale of a Butler And a Astronaut who must Battle a Explorer in The First Manned Space Station	2006	1	7	0.99	129	17.99	R
611	Musketeers Wait	A Touching Yarn of a Student And a Moose who must Fight a Mad Cow in Australia	2006	1	7	4.99	73	17.99	PG
612	Mussolini Spoilers	A Thrilling Display of a Boat And a Monkey who must Meet a Composer in Ancient China	2006	1	6	2.99	180	10.99	G
613	Mystic Truman	A Epic Yarn of a Teacher And a Hunter who must Outgun a Explorer in Soviet Georgia	2006	1	5	0.99	92	19.99	NC-17
614	Name Detective	A Touching Saga of a Sumo Wrestler And a Cat who must Pursue a Mad Scientist in Nigeria	2006	1	5	4.99	178	11.99	PG-13
615	Nash Chocolat	A Epic Reflection of a Monkey And a Mad Cow who must Kill a Forensic Psychologist in An Abandoned Mine Shaft	2006	1	6	2.99	180	21.99	PG-13
616	National Story	A Taut Epistle of a Mad Scientist And a Girl who must Escape a Monkey in California	2006	1	4	2.99	92	19.99	NC-17
617	Natural Stock	A Fast-Paced Story of a Sumo Wrestler And a Girl who must Defeat a Car in A Baloon Factory	2006	1	4	0.99	50	24.99	PG-13
618	Necklace Outbreak	A Astounding Epistle of a Database Administrator And a Mad Scientist who must Pursue a Cat in California	2006	1	3	0.99	132	21.99	PG
619	Neighbors Charade	A Fanciful Reflection of a Crocodile And a Astronaut who must Outrace a Feminist in An Abandoned Amusement Park	2006	1	3	0.99	161	20.99	R
620	Nemo Campus	A Lacklusture Reflection of a Monkey And a Squirrel who must Outrace a Womanizer in A Manhattan Penthouse	2006	1	5	2.99	131	23.99	NC-17
621	Network Peak	A Unbelieveable Reflection of a Butler And a Boat who must Outgun a Mad Scientist in California	2006	1	5	2.99	75	23.99	PG-13
622	Newsies Story	A Action-Packed Character Study of a Dog And a Lumberjack who must Outrace a Moose in The Gulf of Mexico	2006	1	4	0.99	159	25.99	G
642	Order Betrayed	A Amazing Saga of a Dog And a A Shark who must Challenge a Cat in The Sahara Desert	2006	1	7	2.99	120	13.99	PG-13
623	Newton Labyrinth	A Intrepid Character Study of a Moose And a Waitress who must Find a A Shark in Ancient India	2006	1	4	0.99	75	9.99	PG
624	Nightmare Chill	A Brilliant Display of a Robot And a Butler who must Fight a Waitress in An Abandoned Mine Shaft	2006	1	3	4.99	149	25.99	PG
625	None Spiking	A Boring Reflection of a Secret Agent And a Astronaut who must Face a Composer in A Manhattan Penthouse	2006	1	3	0.99	83	18.99	NC-17
626	Noon Papi	A Unbelieveable Character Study of a Mad Scientist And a Astronaut who must Find a Pioneer in A Manhattan Penthouse	2006	1	5	2.99	57	12.99	G
627	North Tequila	A Beautiful Character Study of a Mad Cow And a Robot who must Reach a Womanizer in New Orleans	2006	1	4	4.99	67	9.99	NC-17
628	Northwest Polish	A Boring Character Study of a Boy And a A Shark who must Outrace a Womanizer in The Outback	2006	1	5	2.99	172	24.99	PG
629	Notorious Reunion	A Amazing Epistle of a Woman And a Squirrel who must Fight a Hunter in A Baloon	2006	1	7	0.99	128	9.99	NC-17
630	Notting Speakeasy	A Thoughtful Display of a Butler And a Womanizer who must Find a Waitress in The Canadian Rockies	2006	1	7	0.99	48	19.99	PG-13
631	Novocaine Flight	A Fanciful Display of a Student And a Teacher who must Outgun a Crocodile in Nigeria	2006	1	4	0.99	64	11.99	G
632	Nuts Ties	A Thoughtful Drama of a Explorer And a Womanizer who must Meet a Teacher in California	2006	1	5	4.99	145	10.99	NC-17
633	October Submarine	A Taut Epistle of a Monkey And a Boy who must Confront a Husband in A Jet Boat	2006	1	6	4.99	54	10.99	PG-13
634	Odds Boogie	A Thrilling Yarn of a Feminist And a Madman who must Battle a Hunter in Berlin	2006	1	6	0.99	48	14.99	NC-17
635	Oklahoma Jumanji	A Thoughtful Drama of a Dentist And a Womanizer who must Meet a Husband in The Sahara Desert	2006	1	7	0.99	58	15.99	PG
636	Oleander Clue	A Boring Story of a Teacher And a Monkey who must Succumb a Forensic Psychologist in A Jet Boat	2006	1	5	0.99	161	12.99	PG
637	Open African	A Lacklusture Drama of a Secret Agent And a Explorer who must Discover a Car in A U-Boat	2006	1	7	4.99	131	16.99	PG
638	Operation Operation	A Intrepid Character Study of a Man And a Frisbee who must Overcome a Madman in Ancient China	2006	1	7	2.99	156	23.99	G
639	Opposite Necklace	A Fateful Epistle of a Crocodile And a Moose who must Kill a Explorer in Nigeria	2006	1	7	4.99	92	9.99	PG
640	Opus Ice	A Fast-Paced Drama of a Hunter And a Boy who must Discover a Feminist in The Sahara Desert	2006	1	5	4.99	102	21.99	R
641	Orange Grapes	A Astounding Documentary of a Butler And a Womanizer who must Face a Dog in A U-Boat	2006	1	4	0.99	76	21.99	PG-13
643	Orient Closer	A Astounding Epistle of a Technical Writer And a Teacher who must Fight a Squirrel in The Sahara Desert	2006	1	3	2.99	118	22.99	R
644	Oscar Gold	A Insightful Tale of a Database Administrator And a Dog who must Face a Madman in Soviet Georgia	2006	1	7	2.99	115	29.99	PG
645	Others Soup	A Lacklusture Documentary of a Mad Cow And a Madman who must Sink a Moose in The Gulf of Mexico	2006	1	7	2.99	118	18.99	PG
646	Outbreak Divine	A Unbelieveable Yarn of a Database Administrator And a Woman who must Succumb a A Shark in A U-Boat	2006	1	6	0.99	169	12.99	NC-17
647	Outfield Massacre	A Thoughtful Drama of a Husband And a Secret Agent who must Pursue a Database Administrator in Ancient India	2006	1	4	0.99	129	18.99	NC-17
648	Outlaw Hanky	A Thoughtful Story of a Astronaut And a Composer who must Conquer a Dog in The Sahara Desert	2006	1	7	4.99	148	17.99	PG-13
649	Oz Liaisons	A Epic Yarn of a Mad Scientist And a Cat who must Confront a Womanizer in A Baloon Factory	2006	1	4	2.99	85	14.99	R
650	Pacific Amistad	A Thrilling Yarn of a Dog And a Moose who must Kill a Pastry Chef in A Manhattan Penthouse	2006	1	3	0.99	144	27.99	G
651	Packer Madigan	A Epic Display of a Sumo Wrestler And a Forensic Psychologist who must Build a Woman in An Abandoned Amusement Park	2006	1	3	0.99	84	20.99	PG-13
652	Pajama Jawbreaker	A Emotional Drama of a Boy And a Technical Writer who must Redeem a Sumo Wrestler in California	2006	1	3	0.99	126	14.99	R
653	Panic Club	A Fanciful Display of a Teacher And a Crocodile who must Succumb a Girl in A Baloon	2006	1	3	4.99	102	15.99	G
654	Panky Submarine	A Touching Documentary of a Dentist And a Sumo Wrestler who must Overcome a Boy in The Gulf of Mexico	2006	1	4	4.99	93	19.99	G
655	Panther Reds	A Brilliant Panorama of a Moose And a Man who must Reach a Teacher in The Gulf of Mexico	2006	1	5	4.99	109	22.99	NC-17
656	Papi Necklace	A Fanciful Display of a Car And a Monkey who must Escape a Squirrel in Ancient Japan	2006	1	3	0.99	128	9.99	PG
657	Paradise Sabrina	A Intrepid Yarn of a Car And a Moose who must Outrace a Crocodile in A Manhattan Penthouse	2006	1	5	2.99	48	12.99	PG-13
658	Paris Weekend	A Intrepid Story of a Squirrel And a Crocodile who must Defeat a Monkey in The Outback	2006	1	7	2.99	121	19.99	PG-13
659	Park Citizen	A Taut Epistle of a Sumo Wrestler And a Girl who must Face a Husband in Ancient Japan	2006	1	3	4.99	109	14.99	PG-13
660	Party Knock	A Fateful Display of a Technical Writer And a Butler who must Battle a Sumo Wrestler in An Abandoned Mine Shaft	2006	1	7	2.99	107	11.99	PG
661	Past Suicides	A Intrepid Tale of a Madman And a Astronaut who must Challenge a Hunter in A Monastery	2006	1	5	4.99	157	17.99	PG-13
662	Paths Control	A Astounding Documentary of a Butler And a Cat who must Find a Frisbee in Ancient China	2006	1	3	4.99	118	9.99	PG
663	Patient Sister	A Emotional Epistle of a Squirrel And a Robot who must Confront a Lumberjack in Soviet Georgia	2006	1	7	0.99	99	29.99	NC-17
664	Patriot Roman	A Taut Saga of a Robot And a Database Administrator who must Challenge a Astronaut in California	2006	1	6	2.99	65	12.99	PG
665	Patton Interview	A Thrilling Documentary of a Composer And a Secret Agent who must Succumb a Cat in Berlin	2006	1	4	2.99	175	22.99	PG
666	Paycheck Wait	A Awe-Inspiring Reflection of a Boy And a Man who must Discover a Moose in The Sahara Desert	2006	1	4	4.99	145	27.99	PG-13
667	Peach Innocent	A Action-Packed Drama of a Monkey And a Dentist who must Chase a Butler in Berlin	2006	1	3	2.99	160	20.99	PG-13
668	Peak Forever	A Insightful Reflection of a Boat And a Secret Agent who must Vanquish a Astronaut in An Abandoned Mine Shaft	2006	1	7	4.99	80	25.99	PG
669	Pearl Destiny	A Lacklusture Yarn of a Astronaut And a Pastry Chef who must Sink a Dog in A U-Boat	2006	1	3	2.99	74	10.99	NC-17
670	Pelican Comforts	A Epic Documentary of a Boy And a Monkey who must Pursue a Astronaut in Berlin	2006	1	4	4.99	48	17.99	PG
671	Perdition Fargo	A Fast-Paced Story of a Car And a Cat who must Outgun a Hunter in Berlin	2006	1	7	4.99	99	27.99	NC-17
672	Perfect Groove	A Thrilling Yarn of a Dog And a Dog who must Build a Husband in A Baloon	2006	1	7	2.99	82	17.99	PG-13
673	Personal Ladybugs	A Epic Saga of a Hunter And a Technical Writer who must Conquer a Cat in Ancient Japan	2006	1	3	0.99	118	19.99	PG-13
674	Pet Haunting	A Unbelieveable Reflection of a Explorer And a Boat who must Conquer a Woman in California	2006	1	3	0.99	99	11.99	PG
675	Phantom Glory	A Beautiful Documentary of a Astronaut And a Crocodile who must Discover a Madman in A Monastery	2006	1	6	2.99	60	17.99	NC-17
676	Philadelphia Wife	A Taut Yarn of a Hunter And a Astronaut who must Conquer a Database Administrator in The Sahara Desert	2006	1	7	4.99	137	16.99	PG-13
677	Pianist Outfield	A Intrepid Story of a Boy And a Technical Writer who must Pursue a Lumberjack in A Monastery	2006	1	6	0.99	136	25.99	NC-17
678	Pickup Driving	A Touching Documentary of a Husband And a Boat who must Meet a Pastry Chef in A Baloon Factory	2006	1	3	2.99	77	23.99	G
679	Pilot Hoosiers	A Awe-Inspiring Reflection of a Crocodile And a Sumo Wrestler who must Meet a Forensic Psychologist in An Abandoned Mine Shaft	2006	1	6	2.99	50	17.99	PG
680	Pinocchio Simon	A Action-Packed Reflection of a Mad Scientist And a A Shark who must Find a Feminist in California	2006	1	4	4.99	103	21.99	PG
681	Pirates Roxanne	A Stunning Drama of a Woman And a Lumberjack who must Overcome a A Shark in The Canadian Rockies	2006	1	4	0.99	100	20.99	PG
682	Pittsburgh Hunchback	A Thrilling Epistle of a Boy And a Boat who must Find a Student in Soviet Georgia	2006	1	4	4.99	134	17.99	PG-13
683	Pity Bound	A Boring Panorama of a Feminist And a Moose who must Defeat a Database Administrator in Nigeria	2006	1	5	4.99	60	19.99	NC-17
684	Pizza Jumanji	A Epic Saga of a Cat And a Squirrel who must Outgun a Robot in A U-Boat	2006	1	4	2.99	173	11.99	NC-17
685	Platoon Instinct	A Thrilling Panorama of a Man And a Woman who must Reach a Woman in Australia	2006	1	6	4.99	132	10.99	PG-13
686	Pluto Oleander	A Action-Packed Reflection of a Car And a Moose who must Outgun a Car in A Shark Tank	2006	1	5	4.99	84	9.99	R
687	Pocus Pulp	A Intrepid Yarn of a Frisbee And a Dog who must Build a Astronaut in A Baloon Factory	2006	1	6	0.99	138	15.99	NC-17
688	Polish Brooklyn	A Boring Character Study of a Database Administrator And a Lumberjack who must Reach a Madman in The Outback	2006	1	6	0.99	61	12.99	PG
689	Pollock Deliverance	A Intrepid Story of a Madman And a Frisbee who must Outgun a Boat in The Sahara Desert	2006	1	5	2.99	137	14.99	PG
690	Pond Seattle	A Stunning Drama of a Teacher And a Boat who must Battle a Feminist in Ancient China	2006	1	7	2.99	185	25.99	PG-13
691	Poseidon Forever	A Thoughtful Epistle of a Womanizer And a Monkey who must Vanquish a Dentist in A Monastery	2006	1	6	4.99	159	29.99	PG-13
692	Potluck Mixed	A Beautiful Story of a Dog And a Technical Writer who must Outgun a Student in A Baloon	2006	1	3	2.99	179	10.99	G
693	Potter Connecticut	A Thrilling Epistle of a Frisbee And a Cat who must Fight a Technical Writer in Berlin	2006	1	5	2.99	115	16.99	PG
694	Prejudice Oleander	A Epic Saga of a Boy And a Dentist who must Outrace a Madman in A U-Boat	2006	1	6	4.99	98	15.99	PG-13
695	President Bang	A Fateful Panorama of a Technical Writer And a Moose who must Battle a Robot in Soviet Georgia	2006	1	6	4.99	144	12.99	PG
696	Pride Alamo	A Thoughtful Drama of a A Shark And a Forensic Psychologist who must Vanquish a Student in Ancient India	2006	1	6	0.99	114	20.99	NC-17
697	Primary Glass	A Fateful Documentary of a Pastry Chef And a Butler who must Build a Dog in The Canadian Rockies	2006	1	7	0.99	53	16.99	G
698	Princess Giant	A Thrilling Yarn of a Pastry Chef And a Monkey who must Battle a Monkey in A Shark Tank	2006	1	3	2.99	71	29.99	NC-17
699	Private Drop	A Stunning Story of a Technical Writer And a Hunter who must Succumb a Secret Agent in A Baloon	2006	1	7	4.99	106	26.99	PG
700	Prix Undefeated	A Stunning Saga of a Mad Scientist And a Boat who must Overcome a Dentist in Ancient China	2006	1	4	2.99	115	13.99	R
701	Psycho Shrunk	A Amazing Panorama of a Crocodile And a Explorer who must Fight a Husband in Nigeria	2006	1	5	2.99	155	11.99	PG-13
702	Pulp Beverly	A Unbelieveable Display of a Dog And a Crocodile who must Outrace a Man in Nigeria	2006	1	4	2.99	89	12.99	G
703	Punk Divorce	A Fast-Paced Tale of a Pastry Chef And a Boat who must Face a Frisbee in The Canadian Rockies	2006	1	6	4.99	100	18.99	PG
704	Pure Runner	A Thoughtful Documentary of a Student And a Madman who must Challenge a Squirrel in A Manhattan Penthouse	2006	1	3	2.99	121	25.99	NC-17
705	Purple Movie	A Boring Display of a Pastry Chef And a Sumo Wrestler who must Discover a Frisbee in An Abandoned Amusement Park	2006	1	4	2.99	88	9.99	R
706	Queen Luke	A Astounding Story of a Girl And a Boy who must Challenge a Composer in New Orleans	2006	1	5	4.99	163	22.99	PG
707	Quest Mussolini	A Fateful Drama of a Husband And a Sumo Wrestler who must Battle a Pastry Chef in A Baloon Factory	2006	1	5	2.99	177	29.99	R
708	Quills Bull	A Thoughtful Story of a Pioneer And a Woman who must Reach a Moose in Australia	2006	1	4	4.99	112	19.99	R
709	Racer Egg	A Emotional Display of a Monkey And a Waitress who must Reach a Secret Agent in California	2006	1	7	2.99	147	19.99	NC-17
710	Rage Games	A Fast-Paced Saga of a Astronaut And a Secret Agent who must Escape a Hunter in An Abandoned Amusement Park	2006	1	4	4.99	120	18.99	R
711	Raging Airplane	A Astounding Display of a Secret Agent And a Technical Writer who must Escape a Mad Scientist in A Jet Boat	2006	1	4	4.99	154	18.99	R
712	Raiders Antitrust	A Amazing Drama of a Teacher And a Feminist who must Meet a Woman in The First Manned Space Station	2006	1	4	0.99	82	11.99	PG-13
713	Rainbow Shock	A Action-Packed Story of a Hunter And a Boy who must Discover a Lumberjack in Ancient India	2006	1	3	4.99	74	14.99	PG
714	Random Go	A Fateful Drama of a Frisbee And a Student who must Confront a Cat in A Shark Tank	2006	1	6	2.99	73	29.99	NC-17
715	Range Moonwalker	A Insightful Documentary of a Hunter And a Dentist who must Confront a Crocodile in A Baloon	2006	1	3	4.99	147	25.99	PG
716	Reap Unfaithful	A Thrilling Epistle of a Composer And a Sumo Wrestler who must Challenge a Mad Cow in A MySQL Convention	2006	1	6	2.99	136	26.99	PG-13
717	Rear Trading	A Awe-Inspiring Reflection of a Forensic Psychologist And a Secret Agent who must Succumb a Pastry Chef in Soviet Georgia	2006	1	6	0.99	97	23.99	NC-17
718	Rebel Airport	A Intrepid Yarn of a Database Administrator And a Boat who must Outrace a Husband in Ancient India	2006	1	7	0.99	73	24.99	G
719	Records Zorro	A Amazing Drama of a Mad Scientist And a Composer who must Build a Husband in The Outback	2006	1	7	4.99	182	11.99	PG
720	Redemption Comforts	A Emotional Documentary of a Dentist And a Woman who must Battle a Mad Scientist in Ancient China	2006	1	3	2.99	179	20.99	NC-17
721	Reds Pocus	A Lacklusture Yarn of a Sumo Wrestler And a Squirrel who must Redeem a Monkey in Soviet Georgia	2006	1	7	4.99	182	23.99	PG-13
722	Reef Salute	A Action-Packed Saga of a Teacher And a Lumberjack who must Battle a Dentist in A Baloon	2006	1	5	0.99	123	26.99	NC-17
723	Reign Gentlemen	A Emotional Yarn of a Composer And a Man who must Escape a Butler in The Gulf of Mexico	2006	1	3	2.99	82	29.99	PG-13
724	Remember Diary	A Insightful Tale of a Technical Writer And a Waitress who must Conquer a Monkey in Ancient India	2006	1	5	2.99	110	15.99	R
725	Requiem Tycoon	A Unbelieveable Character Study of a Cat And a Database Administrator who must Pursue a Teacher in A Monastery	2006	1	6	4.99	167	25.99	R
726	Reservoir Adaptation	A Intrepid Drama of a Teacher And a Moose who must Kill a Car in California	2006	1	7	2.99	61	29.99	PG-13
727	Resurrection Silverado	A Epic Yarn of a Robot And a Explorer who must Challenge a Girl in A MySQL Convention	2006	1	6	0.99	117	12.99	PG
728	Reunion Witches	A Unbelieveable Documentary of a Database Administrator And a Frisbee who must Redeem a Mad Scientist in A Baloon Factory	2006	1	3	0.99	63	26.99	R
729	Rider Caddyshack	A Taut Reflection of a Monkey And a Womanizer who must Chase a Moose in Nigeria	2006	1	5	2.99	177	28.99	PG
730	Ridgemont Submarine	A Unbelieveable Drama of a Waitress And a Composer who must Sink a Mad Cow in Ancient Japan	2006	1	3	0.99	46	28.99	PG-13
731	Right Cranes	A Fateful Character Study of a Boat And a Cat who must Find a Database Administrator in A Jet Boat	2006	1	7	4.99	153	29.99	PG-13
732	Rings Heartbreakers	A Amazing Yarn of a Sumo Wrestler And a Boat who must Conquer a Waitress in New Orleans	2006	1	5	0.99	58	17.99	G
733	River Outlaw	A Thrilling Character Study of a Squirrel And a Lumberjack who must Face a Hunter in A MySQL Convention	2006	1	4	0.99	149	29.99	PG-13
734	Road Roxanne	A Boring Character Study of a Waitress And a Astronaut who must Fight a Crocodile in Ancient Japan	2006	1	4	4.99	158	12.99	R
735	Robbers Joon	A Thoughtful Story of a Mad Scientist And a Waitress who must Confront a Forensic Psychologist in Soviet Georgia	2006	1	7	2.99	102	26.99	PG-13
737	Rock Instinct	A Astounding Character Study of a Robot And a Moose who must Overcome a Astronaut in Ancient India	2006	1	4	0.99	102	28.99	G
738	Rocketeer Mother	A Awe-Inspiring Character Study of a Robot And a Sumo Wrestler who must Discover a Womanizer in A Shark Tank	2006	1	3	0.99	178	27.99	PG-13
927	Uprising Uptown	A Fanciful Reflection of a Boy And a Butler who must Pursue a Woman in Berlin	2006	1	6	2.99	174	16.99	NC-17
739	Rocky War	A Fast-Paced Display of a Squirrel And a Explorer who must Outgun a Mad Scientist in Nigeria	2006	1	4	4.99	145	17.99	PG-13
740	Rollercoaster Bringing	A Beautiful Drama of a Robot And a Lumberjack who must Discover a Technical Writer in A Shark Tank	2006	1	5	2.99	153	13.99	PG-13
741	Roman Punk	A Thoughtful Panorama of a Mad Cow And a Student who must Battle a Forensic Psychologist in Berlin	2006	1	7	0.99	81	28.99	NC-17
742	Roof Champion	A Lacklusture Reflection of a Car And a Explorer who must Find a Monkey in A Baloon	2006	1	7	0.99	101	25.99	R
743	Room Roman	A Awe-Inspiring Panorama of a Composer And a Secret Agent who must Sink a Composer in A Shark Tank	2006	1	7	0.99	60	27.99	PG
744	Roots Remember	A Brilliant Drama of a Mad Cow And a Hunter who must Escape a Hunter in Berlin	2006	1	4	0.99	89	23.99	PG-13
745	Roses Treasure	A Astounding Panorama of a Monkey And a Secret Agent who must Defeat a Woman in The First Manned Space Station	2006	1	5	4.99	162	23.99	PG-13
746	Rouge Squad	A Awe-Inspiring Drama of a Astronaut And a Frisbee who must Conquer a Mad Scientist in Australia	2006	1	3	0.99	118	10.99	NC-17
747	Roxanne Rebel	A Astounding Story of a Pastry Chef And a Database Administrator who must Fight a Man in The Outback	2006	1	5	0.99	171	9.99	R
748	Rugrats Shakespeare	A Touching Saga of a Crocodile And a Crocodile who must Discover a Technical Writer in Nigeria	2006	1	4	0.99	109	16.99	PG-13
749	Rules Human	A Beautiful Epistle of a Astronaut And a Student who must Confront a Monkey in An Abandoned Fun House	2006	1	6	4.99	153	19.99	R
750	Run Pacific	A Touching Tale of a Cat And a Pastry Chef who must Conquer a Pastry Chef in A MySQL Convention	2006	1	3	0.99	145	25.99	R
751	Runaway Tenenbaums	A Thoughtful Documentary of a Boat And a Man who must Meet a Boat in An Abandoned Fun House	2006	1	6	0.99	181	17.99	NC-17
752	Runner Madigan	A Thoughtful Documentary of a Crocodile And a Robot who must Outrace a Womanizer in The Outback	2006	1	6	0.99	101	27.99	NC-17
754	Rushmore Mermaid	A Boring Story of a Woman And a Moose who must Reach a Husband in A Shark Tank	2006	1	6	2.99	150	17.99	PG-13
755	Sabrina Midnight	A Emotional Story of a Squirrel And a Crocodile who must Succumb a Husband in The Sahara Desert	2006	1	5	4.99	99	11.99	PG
756	Saddle Antitrust	A Stunning Epistle of a Feminist And a A Shark who must Battle a Woman in An Abandoned Fun House	2006	1	7	2.99	80	10.99	PG-13
757	Sagebrush Clueless	A Insightful Story of a Lumberjack And a Hunter who must Kill a Boy in Ancient Japan	2006	1	4	2.99	106	28.99	G
758	Saints Bride	A Fateful Tale of a Technical Writer And a Composer who must Pursue a Explorer in The Gulf of Mexico	2006	1	5	2.99	125	11.99	G
759	Salute Apollo	A Awe-Inspiring Character Study of a Boy And a Feminist who must Sink a Crocodile in Ancient China	2006	1	4	2.99	73	29.99	R
760	Samurai Lion	A Fast-Paced Story of a Pioneer And a Astronaut who must Reach a Boat in A Baloon	2006	1	5	2.99	110	21.99	G
761	Santa Paris	A Emotional Documentary of a Moose And a Car who must Redeem a Mad Cow in A Baloon Factory	2006	1	7	2.99	154	23.99	PG
762	Sassy Packer	A Fast-Paced Documentary of a Dog And a Teacher who must Find a Moose in A Manhattan Penthouse	2006	1	6	0.99	154	29.99	G
763	Satisfaction Confidential	A Lacklusture Yarn of a Dentist And a Butler who must Meet a Secret Agent in Ancient China	2006	1	3	4.99	75	26.99	G
764	Saturday Lambs	A Thoughtful Reflection of a Mad Scientist And a Moose who must Kill a Husband in A Baloon	2006	1	3	4.99	150	28.99	G
765	Saturn Name	A Fateful Epistle of a Butler And a Boy who must Redeem a Teacher in Berlin	2006	1	7	4.99	182	18.99	R
766	Savannah Town	A Awe-Inspiring Tale of a Astronaut And a Database Administrator who must Chase a Secret Agent in The Gulf of Mexico	2006	1	5	0.99	84	25.99	PG-13
767	Scalawag Duck	A Fateful Reflection of a Car And a Teacher who must Confront a Waitress in A Monastery	2006	1	6	4.99	183	13.99	NC-17
768	Scarface Bang	A Emotional Yarn of a Teacher And a Girl who must Find a Teacher in A Baloon Factory	2006	1	3	4.99	102	11.99	PG-13
769	School Jacket	A Intrepid Yarn of a Monkey And a Boy who must Fight a Composer in A Manhattan Penthouse	2006	1	5	4.99	151	21.99	PG-13
770	Scissorhands Slums	A Awe-Inspiring Drama of a Girl And a Technical Writer who must Meet a Feminist in The Canadian Rockies	2006	1	5	2.99	147	13.99	G
788	Ship Wonderland	A Thrilling Saga of a Monkey And a Frisbee who must Escape a Explorer in The Outback	2006	1	5	2.99	104	15.99	R
771	Scorpion Apollo	A Awe-Inspiring Documentary of a Technical Writer And a Husband who must Meet a Monkey in An Abandoned Fun House	2006	1	3	4.99	137	23.99	NC-17
772	Sea Virgin	A Fast-Paced Documentary of a Technical Writer And a Pastry Chef who must Escape a Moose in A U-Boat	2006	1	4	2.99	80	24.99	PG
773	Seabiscuit Punk	A Insightful Saga of a Man And a Forensic Psychologist who must Discover a Mad Cow in A MySQL Convention	2006	1	6	2.99	112	28.99	NC-17
774	Searchers Wait	A Fast-Paced Tale of a Car And a Mad Scientist who must Kill a Womanizer in Ancient Japan	2006	1	3	2.99	182	22.99	NC-17
775	Seattle Expecations	A Insightful Reflection of a Crocodile And a Sumo Wrestler who must Meet a Technical Writer in The Sahara Desert	2006	1	4	4.99	110	18.99	PG-13
776	Secret Groundhog	A Astounding Story of a Cat And a Database Administrator who must Build a Technical Writer in New Orleans	2006	1	6	4.99	90	11.99	PG
777	Secretary Rouge	A Action-Packed Panorama of a Mad Cow And a Composer who must Discover a Robot in A Baloon Factory	2006	1	5	4.99	158	10.99	PG
778	Secrets Paradise	A Fateful Saga of a Cat And a Frisbee who must Kill a Girl in A Manhattan Penthouse	2006	1	3	4.99	109	24.99	G
779	Sense Greek	A Taut Saga of a Lumberjack And a Pastry Chef who must Escape a Sumo Wrestler in An Abandoned Fun House	2006	1	4	4.99	54	23.99	R
780	Sensibility Rear	A Emotional Tale of a Robot And a Sumo Wrestler who must Redeem a Pastry Chef in A Baloon Factory	2006	1	7	4.99	98	15.99	PG
781	Seven Swarm	A Unbelieveable Character Study of a Dog And a Mad Cow who must Kill a Monkey in Berlin	2006	1	4	4.99	127	15.99	R
782	Shakespeare Saddle	A Fast-Paced Panorama of a Lumberjack And a Database Administrator who must Defeat a Madman in A MySQL Convention	2006	1	6	2.99	60	26.99	PG-13
783	Shane Darkness	A Action-Packed Saga of a Moose And a Lumberjack who must Find a Woman in Berlin	2006	1	5	2.99	93	22.99	PG
784	Shanghai Tycoon	A Fast-Paced Character Study of a Crocodile And a Lumberjack who must Build a Husband in An Abandoned Fun House	2006	1	7	2.99	47	20.99	PG
785	Shawshank Bubble	A Lacklusture Story of a Moose And a Monkey who must Confront a Butler in An Abandoned Amusement Park	2006	1	6	4.99	80	20.99	PG
786	Shepherd Midsummer	A Thoughtful Drama of a Robot And a Womanizer who must Kill a Lumberjack in A Baloon	2006	1	7	0.99	113	14.99	R
787	Shining Roses	A Awe-Inspiring Character Study of a Astronaut And a Forensic Psychologist who must Challenge a Madman in Ancient India	2006	1	4	0.99	125	12.99	G
789	Shock Cabin	A Fateful Tale of a Mad Cow And a Crocodile who must Meet a Husband in New Orleans	2006	1	7	2.99	79	15.99	PG-13
790	Shootist Superfly	A Fast-Paced Story of a Crocodile And a A Shark who must Sink a Pioneer in Berlin	2006	1	6	0.99	67	22.99	PG-13
791	Show Lord	A Fanciful Saga of a Student And a Girl who must Find a Butler in Ancient Japan	2006	1	3	4.99	167	24.99	PG-13
792	Shrek License	A Fateful Yarn of a Secret Agent And a Feminist who must Find a Feminist in A Jet Boat	2006	1	7	2.99	154	15.99	PG-13
793	Shrunk Divine	A Fateful Character Study of a Waitress And a Technical Writer who must Battle a Hunter in A Baloon	2006	1	6	2.99	139	14.99	R
794	Side Ark	A Stunning Panorama of a Crocodile And a Womanizer who must Meet a Feminist in The Canadian Rockies	2006	1	5	0.99	52	28.99	G
795	Siege Madre	A Boring Tale of a Frisbee And a Crocodile who must Vanquish a Moose in An Abandoned Mine Shaft	2006	1	7	0.99	111	23.99	R
796	Sierra Divide	A Emotional Character Study of a Frisbee And a Mad Scientist who must Build a Madman in California	2006	1	3	0.99	135	12.99	NC-17
797	Silence Kane	A Emotional Drama of a Sumo Wrestler And a Dentist who must Confront a Sumo Wrestler in A Baloon	2006	1	7	0.99	67	23.99	R
798	Silverado Goldfinger	A Stunning Epistle of a Sumo Wrestler And a Man who must Challenge a Waitress in Ancient India	2006	1	4	4.99	74	11.99	PG
799	Simon North	A Thrilling Documentary of a Technical Writer And a A Shark who must Face a Pioneer in A Shark Tank	2006	1	3	0.99	51	26.99	NC-17
800	Sinners Atlantis	A Epic Display of a Dog And a Boat who must Succumb a Mad Scientist in An Abandoned Mine Shaft	2006	1	7	2.99	126	19.99	PG-13
801	Sister Freddy	A Stunning Saga of a Butler And a Woman who must Pursue a Explorer in Australia	2006	1	5	4.99	152	19.99	PG-13
802	Sky Miracle	A Epic Drama of a Mad Scientist And a Explorer who must Succumb a Waitress in An Abandoned Fun House	2006	1	7	2.99	132	15.99	PG
803	Slacker Liaisons	A Fast-Paced Tale of a A Shark And a Student who must Meet a Crocodile in Ancient China	2006	1	7	4.99	179	29.99	R
804	Sleeping Suspects	A Stunning Reflection of a Sumo Wrestler And a Explorer who must Sink a Frisbee in A MySQL Convention	2006	1	7	4.99	129	13.99	PG-13
805	Sleepless Monsoon	A Amazing Saga of a Moose And a Pastry Chef who must Escape a Butler in Australia	2006	1	5	4.99	64	12.99	G
806	Sleepy Japanese	A Emotional Epistle of a Moose And a Composer who must Fight a Technical Writer in The Outback	2006	1	4	2.99	137	25.99	PG
807	Sleuth Orient	A Fateful Character Study of a Husband And a Dog who must Find a Feminist in Ancient India	2006	1	4	0.99	87	25.99	NC-17
808	Sling Luke	A Intrepid Character Study of a Robot And a Monkey who must Reach a Secret Agent in An Abandoned Amusement Park	2006	1	5	0.99	84	10.99	R
809	Slipper Fidelity	A Taut Reflection of a Secret Agent And a Man who must Redeem a Explorer in A MySQL Convention	2006	1	5	0.99	156	14.99	PG-13
810	Slums Duck	A Amazing Character Study of a Teacher And a Database Administrator who must Defeat a Waitress in A Jet Boat	2006	1	5	0.99	147	21.99	PG
811	Smile Earring	A Intrepid Drama of a Teacher And a Butler who must Build a Pastry Chef in Berlin	2006	1	4	2.99	60	29.99	G
812	Smoking Barbarella	A Lacklusture Saga of a Mad Cow And a Mad Scientist who must Sink a Cat in A MySQL Convention	2006	1	7	0.99	50	13.99	PG-13
813	Smoochy Control	A Thrilling Documentary of a Husband And a Feminist who must Face a Mad Scientist in Ancient China	2006	1	7	0.99	184	18.99	R
814	Snatch Slipper	A Insightful Panorama of a Woman And a Feminist who must Defeat a Forensic Psychologist in Berlin	2006	1	6	4.99	110	15.99	PG
815	Snatchers Montezuma	A Boring Epistle of a Sumo Wrestler And a Woman who must Escape a Man in The Canadian Rockies	2006	1	4	2.99	74	14.99	PG-13
816	Snowman Rollercoaster	A Fateful Display of a Lumberjack And a Girl who must Succumb a Mad Cow in A Manhattan Penthouse	2006	1	3	0.99	62	27.99	G
817	Soldiers Evolution	A Lacklusture Panorama of a A Shark And a Pioneer who must Confront a Student in The First Manned Space Station	2006	1	7	4.99	185	27.99	R
818	Something Duck	A Boring Character Study of a Car And a Husband who must Outgun a Frisbee in The First Manned Space Station	2006	1	4	4.99	180	17.99	NC-17
819	Song Hedwig	A Amazing Documentary of a Man And a Husband who must Confront a Squirrel in A MySQL Convention	2006	1	3	0.99	165	29.99	PG-13
820	Sons Interview	A Taut Character Study of a Explorer And a Mad Cow who must Battle a Hunter in Ancient China	2006	1	3	2.99	184	11.99	NC-17
821	Sorority Queen	A Fast-Paced Display of a Squirrel And a Composer who must Fight a Forensic Psychologist in A Jet Boat	2006	1	6	0.99	184	17.99	NC-17
822	Soup Wisdom	A Fast-Paced Display of a Robot And a Butler who must Defeat a Butler in A MySQL Convention	2006	1	6	0.99	169	12.99	R
823	South Wait	A Amazing Documentary of a Car And a Robot who must Escape a Lumberjack in An Abandoned Amusement Park	2006	1	4	2.99	143	21.99	R
824	Spartacus Cheaper	A Thrilling Panorama of a Pastry Chef And a Secret Agent who must Overcome a Student in A Manhattan Penthouse	2006	1	4	4.99	52	19.99	NC-17
825	Speakeasy Date	A Lacklusture Drama of a Forensic Psychologist And a Car who must Redeem a Man in A Manhattan Penthouse	2006	1	6	2.99	165	22.99	PG-13
826	Speed Suit	A Brilliant Display of a Frisbee And a Mad Scientist who must Succumb a Robot in Ancient China	2006	1	7	4.99	124	19.99	PG-13
827	Spice Sorority	A Fateful Display of a Pioneer And a Hunter who must Defeat a Husband in An Abandoned Mine Shaft	2006	1	5	4.99	141	22.99	NC-17
828	Spiking Element	A Lacklusture Epistle of a Dentist And a Technical Writer who must Find a Dog in A Monastery	2006	1	7	2.99	79	12.99	G
829	Spinal Rocky	A Lacklusture Epistle of a Sumo Wrestler And a Squirrel who must Defeat a Explorer in California	2006	1	7	2.99	138	12.99	PG-13
830	Spirit Flintstones	A Brilliant Yarn of a Cat And a Car who must Confront a Explorer in Ancient Japan	2006	1	7	0.99	149	23.99	R
831	Spirited Casualties	A Taut Story of a Waitress And a Man who must Face a Car in A Baloon Factory	2006	1	5	0.99	138	20.99	PG-13
832	Splash Gump	A Taut Saga of a Crocodile And a Boat who must Conquer a Hunter in A Shark Tank	2006	1	5	0.99	175	16.99	PG
833	Splendor Patton	A Taut Story of a Dog And a Explorer who must Find a Astronaut in Berlin	2006	1	5	0.99	134	20.99	R
834	Spoilers Hellfighters	A Fanciful Story of a Technical Writer And a Squirrel who must Defeat a Dog in The Gulf of Mexico	2006	1	4	0.99	151	26.99	G
835	Spy Mile	A Thrilling Documentary of a Feminist And a Feminist who must Confront a Feminist in A Baloon	2006	1	6	2.99	112	13.99	PG-13
836	Squad Fish	A Fast-Paced Display of a Pastry Chef And a Dog who must Kill a Teacher in Berlin	2006	1	3	2.99	136	14.99	PG
837	Stage World	A Lacklusture Panorama of a Woman And a Frisbee who must Chase a Crocodile in A Jet Boat	2006	1	4	2.99	85	19.99	PG
838	Stagecoach Armageddon	A Touching Display of a Pioneer And a Butler who must Chase a Car in California	2006	1	5	4.99	112	25.99	R
839	Stallion Sundance	A Fast-Paced Tale of a Car And a Dog who must Outgun a A Shark in Australia	2006	1	5	0.99	130	23.99	PG-13
840	Stampede Disturbing	A Unbelieveable Tale of a Woman And a Lumberjack who must Fight a Frisbee in A U-Boat	2006	1	5	0.99	75	26.99	R
841	Star Operation	A Insightful Character Study of a Girl And a Car who must Pursue a Mad Cow in A Shark Tank	2006	1	5	2.99	181	9.99	PG
842	State Wasteland	A Beautiful Display of a Cat And a Pastry Chef who must Outrace a Mad Cow in A Jet Boat	2006	1	4	2.99	113	13.99	NC-17
843	Steel Santa	A Fast-Paced Yarn of a Composer And a Frisbee who must Face a Moose in Nigeria	2006	1	4	4.99	143	15.99	NC-17
844	Steers Armageddon	A Stunning Character Study of a Car And a Girl who must Succumb a Car in A MySQL Convention	2006	1	6	4.99	140	16.99	PG
845	Stepmom Dream	A Touching Epistle of a Crocodile And a Teacher who must Build a Forensic Psychologist in A MySQL Convention	2006	1	7	4.99	48	9.99	NC-17
846	Sting Personal	A Fanciful Drama of a Frisbee And a Dog who must Fight a Madman in A Jet Boat	2006	1	3	4.99	93	9.99	NC-17
847	Stock Glass	A Boring Epistle of a Crocodile And a Lumberjack who must Outgun a Moose in Ancient China	2006	1	7	2.99	160	10.99	PG
848	Stone Fire	A Intrepid Drama of a Astronaut And a Crocodile who must Find a Boat in Soviet Georgia	2006	1	3	0.99	94	19.99	G
849	Storm Happiness	A Insightful Drama of a Feminist And a A Shark who must Vanquish a Boat in A Shark Tank	2006	1	6	0.99	57	28.99	NC-17
850	Story Side	A Lacklusture Saga of a Boy And a Cat who must Sink a Dentist in An Abandoned Mine Shaft	2006	1	7	0.99	163	27.99	R
851	Straight Hours	A Boring Panorama of a Secret Agent And a Girl who must Sink a Waitress in The Outback	2006	1	3	0.99	151	19.99	R
852	Strangelove Desire	A Awe-Inspiring Panorama of a Lumberjack And a Waitress who must Defeat a Crocodile in An Abandoned Amusement Park	2006	1	4	0.99	103	27.99	NC-17
853	Stranger Strangers	A Awe-Inspiring Yarn of a Womanizer And a Explorer who must Fight a Woman in The First Manned Space Station	2006	1	3	4.99	139	12.99	G
890	Tights Dawn	A Thrilling Epistle of a Boat And a Secret Agent who must Face a Boy in A Baloon	2006	1	5	0.99	172	14.99	R
854	Strangers Graffiti	A Brilliant Character Study of a Secret Agent And a Man who must Find a Cat in The Gulf of Mexico	2006	1	4	4.99	119	22.99	R
855	Streak Ridgemont	A Astounding Character Study of a Hunter And a Waitress who must Sink a Man in New Orleans	2006	1	7	0.99	132	28.99	PG-13
856	Streetcar Intentions	A Insightful Character Study of a Waitress And a Crocodile who must Sink a Waitress in The Gulf of Mexico	2006	1	5	4.99	73	11.99	R
857	Strictly Scarface	A Touching Reflection of a Crocodile And a Dog who must Chase a Hunter in An Abandoned Fun House	2006	1	3	2.99	144	24.99	PG-13
858	Submarine Bed	A Amazing Display of a Car And a Monkey who must Fight a Teacher in Soviet Georgia	2006	1	5	4.99	127	21.99	R
859	Sugar Wonka	A Touching Story of a Dentist And a Database Administrator who must Conquer a Astronaut in An Abandoned Amusement Park	2006	1	3	4.99	114	20.99	PG
860	Suicides Silence	A Emotional Character Study of a Car And a Girl who must Face a Composer in A U-Boat	2006	1	4	4.99	93	13.99	G
861	Suit Walls	A Touching Panorama of a Lumberjack And a Frisbee who must Build a Dog in Australia	2006	1	3	4.99	111	12.99	R
862	Summer Scarface	A Emotional Panorama of a Lumberjack And a Hunter who must Meet a Girl in A Shark Tank	2006	1	5	0.99	53	25.99	G
863	Sun Confessions	A Beautiful Display of a Mad Cow And a Dog who must Redeem a Waitress in An Abandoned Amusement Park	2006	1	5	0.99	141	9.99	R
864	Sundance Invasion	A Epic Drama of a Lumberjack And a Explorer who must Confront a Hunter in A Baloon Factory	2006	1	5	0.99	92	21.99	NC-17
865	Sunrise League	A Beautiful Epistle of a Madman And a Butler who must Face a Crocodile in A Manhattan Penthouse	2006	1	3	4.99	135	19.99	PG-13
866	Sunset Racer	A Awe-Inspiring Reflection of a Astronaut And a A Shark who must Defeat a Forensic Psychologist in California	2006	1	6	0.99	48	28.99	NC-17
867	Super Wyoming	A Action-Packed Saga of a Pastry Chef And a Explorer who must Discover a A Shark in The Outback	2006	1	5	4.99	58	10.99	PG
868	Superfly Trip	A Beautiful Saga of a Lumberjack And a Teacher who must Build a Technical Writer in An Abandoned Fun House	2006	1	5	0.99	114	27.99	PG
869	Suspects Quills	A Emotional Epistle of a Pioneer And a Crocodile who must Battle a Man in A Manhattan Penthouse	2006	1	4	2.99	47	22.99	PG
870	Swarm Gold	A Insightful Panorama of a Crocodile And a Boat who must Conquer a Sumo Wrestler in A MySQL Convention	2006	1	4	0.99	123	12.99	PG-13
871	Sweden Shining	A Taut Documentary of a Car And a Robot who must Conquer a Boy in The Canadian Rockies	2006	1	6	4.99	176	19.99	PG
891	Timberland Sky	A Boring Display of a Man And a Dog who must Redeem a Girl in A U-Boat	2006	1	3	0.99	69	13.99	G
872	Sweet Brotherhood	A Unbelieveable Epistle of a Sumo Wrestler And a Hunter who must Chase a Forensic Psychologist in A Baloon	2006	1	3	2.99	185	27.99	R
873	Sweethearts Suspects	A Brilliant Character Study of a Frisbee And a Sumo Wrestler who must Confront a Woman in The Gulf of Mexico	2006	1	3	0.99	108	13.99	G
874	Tadpole Park	A Beautiful Tale of a Frisbee And a Moose who must Vanquish a Dog in An Abandoned Amusement Park	2006	1	6	2.99	155	13.99	PG
875	Talented Homicide	A Lacklusture Panorama of a Dentist And a Forensic Psychologist who must Outrace a Pioneer in A U-Boat	2006	1	6	0.99	173	9.99	PG
876	Tarzan Videotape	A Fast-Paced Display of a Lumberjack And a Mad Scientist who must Succumb a Sumo Wrestler in The Sahara Desert	2006	1	3	2.99	91	11.99	PG-13
877	Taxi Kick	A Amazing Epistle of a Girl And a Woman who must Outrace a Waitress in Soviet Georgia	2006	1	4	0.99	64	23.99	PG-13
878	Teen Apollo	A Awe-Inspiring Drama of a Dog And a Man who must Escape a Robot in A Shark Tank	2006	1	3	4.99	74	25.99	G
879	Telegraph Voyage	A Fateful Yarn of a Husband And a Dog who must Battle a Waitress in A Jet Boat	2006	1	3	4.99	148	20.99	PG
880	Telemark Heartbreakers	A Action-Packed Panorama of a Technical Writer And a Man who must Build a Forensic Psychologist in A Manhattan Penthouse	2006	1	6	2.99	152	9.99	PG-13
881	Temple Attraction	A Action-Packed Saga of a Forensic Psychologist And a Woman who must Battle a Womanizer in Soviet Georgia	2006	1	5	4.99	71	13.99	PG
882	Tenenbaums Command	A Taut Display of a Pioneer And a Man who must Reach a Girl in The Gulf of Mexico	2006	1	4	0.99	99	24.99	PG-13
883	Tequila Past	A Action-Packed Panorama of a Mad Scientist And a Robot who must Challenge a Student in Nigeria	2006	1	6	4.99	53	17.99	PG
884	Terminator Club	A Touching Story of a Crocodile And a Girl who must Sink a Man in The Gulf of Mexico	2006	1	5	4.99	88	11.99	R
885	Texas Watch	A Awe-Inspiring Yarn of a Student And a Teacher who must Fight a Teacher in An Abandoned Amusement Park	2006	1	7	0.99	179	22.99	NC-17
886	Theory Mermaid	A Fateful Yarn of a Composer And a Monkey who must Vanquish a Womanizer in The First Manned Space Station	2006	1	5	0.99	184	9.99	PG-13
965	Watership Frontier	A Emotional Yarn of a Boat And a Crocodile who must Meet a Moose in Soviet Georgia	2006	1	6	0.99	112	28.99	G
887	Thief Pelican	A Touching Documentary of a Madman And a Mad Scientist who must Outrace a Feminist in An Abandoned Mine Shaft	2006	1	5	4.99	135	28.99	PG-13
888	Thin Sagebrush	A Emotional Drama of a Husband And a Lumberjack who must Build a Cat in Ancient India	2006	1	5	4.99	53	9.99	PG-13
889	Ties Hunger	A Insightful Saga of a Astronaut And a Explorer who must Pursue a Mad Scientist in A U-Boat	2006	1	3	4.99	111	28.99	R
892	Titanic Boondock	A Brilliant Reflection of a Feminist And a Dog who must Fight a Boy in A Baloon Factory	2006	1	3	4.99	104	18.99	R
893	Titans Jerk	A Unbelieveable Panorama of a Feminist And a Sumo Wrestler who must Challenge a Technical Writer in Ancient China	2006	1	4	4.99	91	11.99	PG
894	Tomatoes Hellfighters	A Thoughtful Epistle of a Madman And a Astronaut who must Overcome a Monkey in A Shark Tank	2006	1	6	0.99	68	23.99	PG
895	Tomorrow Hustler	A Thoughtful Story of a Moose And a Husband who must Face a Secret Agent in The Sahara Desert	2006	1	3	2.99	142	21.99	R
896	Tootsie Pilot	A Awe-Inspiring Documentary of a Womanizer And a Pastry Chef who must Kill a Lumberjack in Berlin	2006	1	3	0.99	157	10.99	PG
897	Torque Bound	A Emotional Display of a Crocodile And a Husband who must Reach a Man in Ancient Japan	2006	1	3	4.99	179	27.99	G
898	Tourist Pelican	A Boring Story of a Butler And a Astronaut who must Outrace a Pioneer in Australia	2006	1	4	4.99	152	18.99	PG-13
899	Towers Hurricane	A Fateful Display of a Monkey And a Car who must Sink a Husband in A MySQL Convention	2006	1	7	0.99	144	14.99	NC-17
900	Town Ark	A Awe-Inspiring Documentary of a Moose And a Madman who must Meet a Dog in An Abandoned Mine Shaft	2006	1	6	2.99	136	17.99	R
901	Tracy Cider	A Touching Reflection of a Database Administrator And a Madman who must Build a Lumberjack in Nigeria	2006	1	3	0.99	142	29.99	G
902	Trading Pinocchio	A Emotional Character Study of a Student And a Explorer who must Discover a Frisbee in The First Manned Space Station	2006	1	6	4.99	170	22.99	PG
903	Traffic Hobbit	A Amazing Epistle of a Squirrel And a Lumberjack who must Succumb a Database Administrator in A U-Boat	2006	1	5	4.99	139	13.99	G
904	Train Bunch	A Thrilling Character Study of a Robot And a Squirrel who must Face a Dog in Ancient India	2006	1	3	4.99	71	26.99	R
905	Trainspotting Strangers	A Fast-Paced Drama of a Pioneer And a Mad Cow who must Challenge a Madman in Ancient Japan	2006	1	7	4.99	132	10.99	PG-13
906	Tramp Others	A Brilliant Display of a Composer And a Cat who must Succumb a A Shark in Ancient India	2006	1	4	0.99	171	27.99	PG
907	Translation Summer	A Touching Reflection of a Man And a Monkey who must Pursue a Womanizer in A MySQL Convention	2006	1	4	0.99	168	10.99	PG-13
908	Trap Guys	A Unbelieveable Story of a Boy And a Mad Cow who must Challenge a Database Administrator in The Sahara Desert	2006	1	3	4.99	110	11.99	G
909	Treasure Command	A Emotional Saga of a Car And a Madman who must Discover a Pioneer in California	2006	1	3	0.99	102	28.99	PG-13
910	Treatment Jekyll	A Boring Story of a Teacher And a Student who must Outgun a Cat in An Abandoned Mine Shaft	2006	1	3	0.99	87	19.99	PG
911	Trip Newton	A Fanciful Character Study of a Lumberjack And a Car who must Discover a Cat in An Abandoned Amusement Park	2006	1	7	4.99	64	14.99	PG-13
912	Trojan Tomorrow	A Astounding Panorama of a Husband And a Sumo Wrestler who must Pursue a Boat in Ancient India	2006	1	3	2.99	52	9.99	PG
913	Troopers Metal	A Fanciful Drama of a Monkey And a Feminist who must Sink a Man in Berlin	2006	1	3	0.99	115	20.99	R
914	Trouble Date	A Lacklusture Panorama of a Forensic Psychologist And a Woman who must Kill a Explorer in Ancient Japan	2006	1	6	2.99	61	13.99	PG
915	Truman Crazy	A Thrilling Epistle of a Moose And a Boy who must Meet a Database Administrator in A Monastery	2006	1	7	4.99	92	9.99	G
916	Turn Star	A Stunning Tale of a Man And a Monkey who must Chase a Student in New Orleans	2006	1	3	2.99	80	10.99	G
917	Tuxedo Mile	A Boring Drama of a Man And a Forensic Psychologist who must Face a Frisbee in Ancient India	2006	1	3	2.99	152	24.99	R
918	Twisted Pirates	A Touching Display of a Frisbee And a Boat who must Kill a Girl in A MySQL Convention	2006	1	4	4.99	152	23.99	PG
919	Tycoon Gathering	A Emotional Display of a Husband And a A Shark who must Succumb a Madman in A Manhattan Penthouse	2006	1	3	4.99	82	17.99	G
920	Unbreakable Karate	A Amazing Character Study of a Robot And a Student who must Chase a Robot in Australia	2006	1	3	0.99	62	16.99	G
921	Uncut Suicides	A Intrepid Yarn of a Explorer And a Pastry Chef who must Pursue a Mad Cow in A U-Boat	2006	1	7	2.99	172	29.99	PG-13
922	Undefeated Dalmations	A Unbelieveable Display of a Crocodile And a Feminist who must Overcome a Moose in An Abandoned Amusement Park	2006	1	7	4.99	107	22.99	PG-13
923	Unfaithful Kill	A Taut Documentary of a Waitress And a Mad Scientist who must Battle a Technical Writer in New Orleans	2006	1	7	2.99	78	12.99	R
924	Unforgiven Zoolander	A Taut Epistle of a Monkey And a Sumo Wrestler who must Vanquish a A Shark in A Baloon Factory	2006	1	7	0.99	129	15.99	PG
925	United Pilot	A Fast-Paced Reflection of a Cat And a Mad Cow who must Fight a Car in The Sahara Desert	2006	1	3	0.99	164	27.99	R
926	Untouchables Sunrise	A Amazing Documentary of a Woman And a Astronaut who must Outrace a Teacher in An Abandoned Fun House	2006	1	5	2.99	120	11.99	NC-17
928	Uptown Young	A Fateful Documentary of a Dog And a Hunter who must Pursue a Teacher in An Abandoned Amusement Park	2006	1	5	2.99	84	16.99	PG
929	Usual Untouchables	A Touching Display of a Explorer And a Lumberjack who must Fight a Forensic Psychologist in A Shark Tank	2006	1	5	4.99	128	21.99	PG-13
930	Vacation Boondock	A Fanciful Character Study of a Secret Agent And a Mad Scientist who must Reach a Teacher in Australia	2006	1	4	2.99	145	23.99	R
931	Valentine Vanishing	A Thrilling Display of a Husband And a Butler who must Reach a Pastry Chef in California	2006	1	7	0.99	48	9.99	PG-13
932	Valley Packer	A Astounding Documentary of a Astronaut And a Boy who must Outrace a Sumo Wrestler in Berlin	2006	1	3	0.99	73	21.99	G
933	Vampire Whale	A Epic Story of a Lumberjack And a Monkey who must Confront a Pioneer in A MySQL Convention	2006	1	4	4.99	126	11.99	NC-17
934	Vanilla Day	A Fast-Paced Saga of a Girl And a Forensic Psychologist who must Redeem a Girl in Nigeria	2006	1	7	4.99	122	20.99	NC-17
935	Vanished Garden	A Intrepid Character Study of a Squirrel And a A Shark who must Kill a Lumberjack in California	2006	1	5	0.99	142	17.99	R
936	Vanishing Rocky	A Brilliant Reflection of a Man And a Woman who must Conquer a Pioneer in A MySQL Convention	2006	1	3	2.99	123	21.99	NC-17
937	Varsity Trip	A Action-Packed Character Study of a Astronaut And a Explorer who must Reach a Monkey in A MySQL Convention	2006	1	7	2.99	85	14.99	NC-17
938	Velvet Terminator	A Lacklusture Tale of a Pastry Chef And a Technical Writer who must Confront a Crocodile in An Abandoned Amusement Park	2006	1	3	4.99	173	14.99	R
939	Vertigo Northwest	A Unbelieveable Display of a Mad Scientist And a Mad Scientist who must Outgun a Mad Cow in Ancient Japan	2006	1	4	2.99	90	17.99	R
940	Victory Academy	A Insightful Epistle of a Mad Scientist And a Explorer who must Challenge a Cat in The Sahara Desert	2006	1	6	0.99	64	19.99	PG-13
941	Videotape Arsenic	A Lacklusture Display of a Girl And a Astronaut who must Succumb a Student in Australia	2006	1	4	4.99	145	10.99	NC-17
942	Vietnam Smoochy	A Lacklusture Display of a Butler And a Man who must Sink a Explorer in Soviet Georgia	2006	1	7	0.99	174	27.99	PG-13
943	Villain Desperate	A Boring Yarn of a Pioneer And a Feminist who must Redeem a Cat in An Abandoned Amusement Park	2006	1	4	4.99	76	27.99	PG-13
944	Virgin Daisy	A Awe-Inspiring Documentary of a Robot And a Mad Scientist who must Reach a Database Administrator in A Shark Tank	2006	1	6	4.99	179	29.99	PG-13
945	Virginian Pluto	A Emotional Panorama of a Dentist And a Crocodile who must Meet a Boy in Berlin	2006	1	5	0.99	164	22.99	R
946	Virtual Spoilers	A Fateful Tale of a Database Administrator And a Squirrel who must Discover a Student in Soviet Georgia	2006	1	3	4.99	144	14.99	NC-17
947	Vision Torque	A Thoughtful Documentary of a Dog And a Man who must Sink a Man in A Shark Tank	2006	1	5	0.99	59	16.99	PG-13
948	Voice Peach	A Amazing Panorama of a Pioneer And a Student who must Overcome a Mad Scientist in A Manhattan Penthouse	2006	1	6	0.99	139	22.99	PG-13
949	Volcano Texas	A Awe-Inspiring Yarn of a Hunter And a Feminist who must Challenge a Dentist in The Outback	2006	1	6	0.99	157	27.99	NC-17
950	Volume House	A Boring Tale of a Dog And a Woman who must Meet a Dentist in California	2006	1	7	4.99	132	12.99	PG
951	Voyage Legally	A Epic Tale of a Squirrel And a Hunter who must Conquer a Boy in An Abandoned Mine Shaft	2006	1	6	0.99	78	28.99	PG-13
952	Wagon Jaws	A Intrepid Drama of a Moose And a Boat who must Kill a Explorer in A Manhattan Penthouse	2006	1	7	2.99	152	17.99	PG
953	Wait Cider	A Intrepid Epistle of a Woman And a Forensic Psychologist who must Succumb a Astronaut in A Manhattan Penthouse	2006	1	3	0.99	112	9.99	PG-13
954	Wake Jaws	A Beautiful Saga of a Feminist And a Composer who must Challenge a Moose in Berlin	2006	1	7	4.99	73	18.99	G
955	Walls Artist	A Insightful Panorama of a Teacher And a Teacher who must Overcome a Mad Cow in An Abandoned Fun House	2006	1	7	4.99	135	19.99	PG
956	Wanda Chamber	A Insightful Drama of a A Shark And a Pioneer who must Find a Womanizer in The Outback	2006	1	7	4.99	107	23.99	PG-13
957	War Notting	A Boring Drama of a Teacher And a Sumo Wrestler who must Challenge a Secret Agent in The Canadian Rockies	2006	1	7	4.99	80	26.99	G
958	Wardrobe Phantom	A Action-Packed Display of a Mad Cow And a Astronaut who must Kill a Car in Ancient India	2006	1	6	2.99	178	19.99	G
959	Warlock Werewolf	A Astounding Yarn of a Pioneer And a Crocodile who must Defeat a A Shark in The Outback	2006	1	6	2.99	83	10.99	G
960	Wars Pluto	A Taut Reflection of a Teacher And a Database Administrator who must Chase a Madman in The Sahara Desert	2006	1	5	2.99	128	15.99	G
961	Wash Heavenly	A Awe-Inspiring Reflection of a Cat And a Pioneer who must Escape a Hunter in Ancient China	2006	1	7	4.99	161	22.99	R
962	Wasteland Divine	A Fanciful Story of a Database Administrator And a Womanizer who must Fight a Database Administrator in Ancient China	2006	1	7	2.99	85	18.99	PG
963	Watch Tracy	A Fast-Paced Yarn of a Dog And a Frisbee who must Conquer a Hunter in Nigeria	2006	1	5	0.99	78	12.99	PG
964	Waterfront Deliverance	A Unbelieveable Documentary of a Dentist And a Technical Writer who must Build a Womanizer in Nigeria	2006	1	4	4.99	61	17.99	G
966	Wedding Apollo	A Action-Packed Tale of a Student And a Waitress who must Conquer a Lumberjack in An Abandoned Mine Shaft	2006	1	3	0.99	70	14.99	PG
967	Weekend Personal	A Fast-Paced Documentary of a Car And a Butler who must Find a Frisbee in A Jet Boat	2006	1	5	2.99	134	26.99	R
968	Werewolf Lola	A Fanciful Story of a Man And a Sumo Wrestler who must Outrace a Student in A Monastery	2006	1	6	4.99	79	19.99	G
969	West Lion	A Intrepid Drama of a Butler And a Lumberjack who must Challenge a Database Administrator in A Manhattan Penthouse	2006	1	4	4.99	159	29.99	G
970	Westward Seabiscuit	A Lacklusture Tale of a Butler And a Husband who must Face a Boy in Ancient China	2006	1	7	0.99	52	11.99	NC-17
971	Whale Bikini	A Intrepid Story of a Pastry Chef And a Database Administrator who must Kill a Feminist in A MySQL Convention	2006	1	4	4.99	109	11.99	PG-13
972	Whisperer Giant	A Intrepid Story of a Dentist And a Hunter who must Confront a Monkey in Ancient Japan	2006	1	4	4.99	59	24.99	PG-13
973	Wife Turn	A Awe-Inspiring Epistle of a Teacher And a Feminist who must Confront a Pioneer in Ancient Japan	2006	1	3	4.99	183	27.99	NC-17
974	Wild Apollo	A Beautiful Story of a Monkey And a Sumo Wrestler who must Conquer a A Shark in A MySQL Convention	2006	1	4	0.99	181	24.99	R
975	Willow Tracy	A Brilliant Panorama of a Boat And a Astronaut who must Challenge a Teacher in A Manhattan Penthouse	2006	1	6	2.99	137	22.99	R
976	Wind Phantom	A Touching Saga of a Madman And a Forensic Psychologist who must Build a Sumo Wrestler in An Abandoned Mine Shaft	2006	1	6	0.99	111	12.99	R
977	Window Side	A Astounding Character Study of a Womanizer And a Hunter who must Escape a Robot in A Monastery	2006	1	3	2.99	85	25.99	R
978	Wisdom Worker	A Unbelieveable Saga of a Forensic Psychologist And a Student who must Face a Squirrel in The First Manned Space Station	2006	1	3	0.99	98	12.99	R
979	Witches Panic	A Awe-Inspiring Drama of a Secret Agent And a Hunter who must Fight a Moose in Nigeria	2006	1	6	4.99	100	10.99	NC-17
980	Wizard Coldblooded	A Lacklusture Display of a Robot And a Girl who must Defeat a Sumo Wrestler in A MySQL Convention	2006	1	4	4.99	75	12.99	PG
981	Wolves Desire	A Fast-Paced Drama of a Squirrel And a Robot who must Succumb a Technical Writer in A Manhattan Penthouse	2006	1	7	0.99	55	13.99	NC-17
982	Women Dorado	A Insightful Documentary of a Waitress And a Butler who must Vanquish a Composer in Australia	2006	1	4	0.99	126	23.99	R
983	Won Dares	A Unbelieveable Documentary of a Teacher And a Monkey who must Defeat a Explorer in A U-Boat	2006	1	7	2.99	105	18.99	PG
984	Wonderful Drop	A Boring Panorama of a Woman And a Madman who must Overcome a Butler in A U-Boat	2006	1	3	2.99	126	20.99	NC-17
985	Wonderland Christmas	A Awe-Inspiring Character Study of a Waitress And a Car who must Pursue a Mad Scientist in The First Manned Space Station	2006	1	4	4.99	111	19.99	PG
986	Wonka Sea	A Brilliant Saga of a Boat And a Mad Scientist who must Meet a Moose in Ancient India	2006	1	6	2.99	85	24.99	NC-17
987	Words Hunter	A Action-Packed Reflection of a Composer And a Mad Scientist who must Face a Pioneer in A MySQL Convention	2006	1	3	2.99	116	13.99	PG
988	Worker Tarzan	A Action-Packed Yarn of a Secret Agent And a Technical Writer who must Battle a Sumo Wrestler in The First Manned Space Station	2006	1	7	2.99	139	26.99	R
989	Working Microcosmos	A Stunning Epistle of a Dentist And a Dog who must Kill a Madman in Ancient China	2006	1	4	4.99	74	22.99	R
990	World Leathernecks	A Unbelieveable Tale of a Pioneer And a Astronaut who must Overcome a Robot in An Abandoned Amusement Park	2006	1	3	0.99	171	13.99	PG-13
991	Worst Banger	A Thrilling Drama of a Madman And a Dentist who must Conquer a Boy in The Outback	2006	1	4	2.99	185	26.99	PG
992	Wrath Mile	A Intrepid Reflection of a Technical Writer And a Hunter who must Defeat a Sumo Wrestler in A Monastery	2006	1	5	0.99	176	17.99	NC-17
993	Wrong Behavior	A Emotional Saga of a Crocodile And a Sumo Wrestler who must Discover a Mad Cow in New Orleans	2006	1	6	2.99	178	10.99	PG-13
994	Wyoming Storm	A Awe-Inspiring Panorama of a Robot And a Boat who must Overcome a Feminist in A U-Boat	2006	1	6	4.99	100	29.99	PG-13
995	Yentl Idaho	A Amazing Display of a Robot And a Astronaut who must Fight a Womanizer in Berlin	2006	1	5	4.99	86	11.99	R
996	Young Language	A Unbelieveable Yarn of a Boat And a Database Administrator who must Meet a Boy in The First Manned Space Station	2006	1	6	0.99	183	9.99	G
997	Youth Kick	A Touching Drama of a Teacher And a Cat who must Challenge a Technical Writer in A U-Boat	2006	1	4	0.99	179	14.99	NC-17
998	Zhivago Core	A Fateful Yarn of a Composer And a Man who must Face a Boy in The Canadian Rockies	2006	1	6	0.99	105	10.99	NC-17
999	Zoolander Fiction	A Fateful Reflection of a Waitress And a Boat who must Discover a Sumo Wrestler in Ancient China	2006	1	5	2.99	101	28.99	R
1000	Zorro Ark	A Intrepid Panorama of a Mad Scientist And a Boy who must Redeem a Boy in A Monastery	2006	1	3	4.99	50	18.99	NC-17
16	Alley Evolution	A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans	2006	2	6	2.99	180	23.99	NC-17
17	Alone Trip	A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House	2006	2	3	0.99	82	14.99	R
18	Alter Victory	A Thoughtful Drama of a Composer And a Feminist who must Meet a Secret Agent in The Canadian Rockies	2006	2	6	0.99	57	27.99	PG-13
19	Amadeus Holy	A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon	2006	2	6	0.99	113	20.99	PG
20	Amelie Hellfighters	A Boring Drama of a Woman And a Squirrel who must Conquer a Student in A Baloon	2006	2	4	4.99	79	23.99	R
21	American Circus	A Insightful Drama of a Girl And a Astronaut who must Face a Database Administrator in A Shark Tank	2006	2	3	4.99	129	17.99	R
22	Amistad Midsummer	A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California	2006	2	6	2.99	85	10.99	G
23	Anaconda Confessions	A Lacklusture Display of a Dentist And a Dentist who must Fight a Girl in Australia	2006	2	3	0.99	92	9.99	R
24	Analyze Hoosiers	A Thoughtful Display of a Explorer And a Pastry Chef who must Overcome a Feminist in The Sahara Desert	2006	2	6	2.99	181	19.99	R
25	Angels Life	A Thoughtful Display of a Woman And a Astronaut who must Battle a Robot in Berlin	2006	2	3	2.99	74	15.99	G
26	Annie Identity	A Amazing Panorama of a Pastry Chef And a Boat who must Escape a Woman in An Abandoned Amusement Park	2006	2	3	0.99	86	15.99	G
27	Anonymous Human	A Amazing Reflection of a Database Administrator And a Astronaut who must Outrace a Database Administrator in A Shark Tank	2006	2	7	0.99	179	12.99	NC-17
28	Anthem Luke	A Touching Panorama of a Waitress And a Woman who must Outrace a Dog in An Abandoned Amusement Park	2006	2	5	4.99	91	16.99	PG-13
29	Antitrust Tomatoes	A Fateful Yarn of a Womanizer And a Feminist who must Succumb a Database Administrator in Ancient India	2006	2	5	2.99	168	11.99	NC-17
30	Anything Savannah	A Epic Story of a Pastry Chef And a Woman who must Chase a Feminist in An Abandoned Fun House	2006	2	4	2.99	82	27.99	R
34	Arabia Dogma	A Touching Epistle of a Madman And a Mad Cow who must Defeat a Student in Nigeria	2006	3	6	0.99	62	29.99	NC-17
35	Arachnophobia Rollercoaster	A Action-Packed Reflection of a Pastry Chef And a Composer who must Discover a Mad Scientist in The First Manned Space Station	2006	3	4	2.99	147	24.99	PG-13
36	Argonauts Town	A Emotional Epistle of a Forensic Psychologist And a Butler who must Challenge a Waitress in An Abandoned Mine Shaft	2006	3	7	0.99	127	12.99	PG-13
37	Arizona Bang	A Brilliant Panorama of a Mad Scientist And a Mad Cow who must Meet a Pioneer in A Monastery	2006	3	3	2.99	121	28.99	PG
38	Ark Ridgemont	A Beautiful Yarn of a Pioneer And a Monkey who must Pursue a Explorer in The Sahara Desert	2006	3	6	0.99	68	25.99	NC-17
39	Armageddon Lost	A Fast-Paced Tale of a Boat And a Teacher who must Succumb a Composer in An Abandoned Mine Shaft	2006	3	5	0.99	99	10.99	G
40	Army Flintstones	A Boring Saga of a Database Administrator And a Womanizer who must Battle a Waitress in Nigeria	2006	3	4	0.99	148	22.99	R
41	Arsenic Independence	A Fanciful Documentary of a Mad Cow And a Womanizer who must Find a Dentist in Berlin	2006	3	4	0.99	137	17.99	PG
42	Artist Coldblooded	A Stunning Reflection of a Robot And a Moose who must Challenge a Woman in California	2006	3	5	2.99	170	10.99	NC-17
43	Atlantis Cause	A Thrilling Yarn of a Feminist And a Hunter who must Fight a Technical Writer in A Shark Tank	2006	3	6	2.99	170	15.99	G
44	Attacks Hate	A Fast-Paced Panorama of a Technical Writer And a Mad Scientist who must Find a Feminist in An Abandoned Mine Shaft	2006	3	5	4.99	113	21.99	PG-13
45	Attraction Newton	A Astounding Panorama of a Composer And a Frisbee who must Reach a Husband in Ancient Japan	2006	3	5	4.99	83	14.99	PG-13
51	Balloon Homeward	A Insightful Panorama of a Forensic Psychologist And a Mad Cow who must Build a Mad Scientist in The First Manned Space Station	2006	4	5	2.99	75	10.99	NC-17
52	Ballroom Mockingbird	A Thrilling Documentary of a Composer And a Monkey who must Find a Feminist in California	2006	4	6	0.99	173	29.99	G
53	Bang Kwai	A Epic Drama of a Madman And a Cat who must Face a A Shark in An Abandoned Amusement Park	2006	4	5	2.99	87	25.99	NC-17
54	Banger Pinocchio	A Awe-Inspiring Drama of a Car And a Pastry Chef who must Chase a Crocodile in The First Manned Space Station	2006	4	5	0.99	113	15.99	R
55	Barbarella Streetcar	A Awe-Inspiring Story of a Feminist And a Cat who must Conquer a Dog in A Monastery	2006	4	6	2.99	65	27.99	G
56	Barefoot Manchurian	A Intrepid Story of a Cat And a Student who must Vanquish a Girl in An Abandoned Amusement Park	2006	4	6	2.99	129	15.99	G
57	Basic Easy	A Stunning Epistle of a Man And a Husband who must Reach a Mad Scientist in A Jet Boat	2006	4	4	2.99	90	18.99	PG-13
58	Beach Heartbreakers	A Fateful Display of a Womanizer And a Mad Scientist who must Outgun a A Shark in Soviet Georgia	2006	4	6	2.99	122	16.99	G
59	Bear Graceland	A Astounding Saga of a Dog And a Boy who must Kill a Teacher in The First Manned Space Station	2006	4	4	2.99	160	20.99	R
60	Beast Hunchback	A Awe-Inspiring Epistle of a Student And a Squirrel who must Defeat a Boy in Ancient China	2006	4	3	4.99	89	22.99	R
68	Betrayed Rear	A Emotional Character Study of a Boat And a Pioneer who must Find a Explorer in A Shark Tank	2006	5	5	4.99	122	26.99	NC-17
69	Beverly Outlaw	A Fanciful Documentary of a Womanizer And a Boat who must Defeat a Madman in The First Manned Space Station	2006	5	3	2.99	85	21.99	R
70	Bikini Borrowers	A Astounding Drama of a Astronaut And a Cat who must Discover a Woman in The First Manned Space Station	2006	5	7	4.99	142	26.99	NC-17
71	Bilko Anonymous	A Emotional Reflection of a Teacher And a Man who must Meet a Cat in The First Manned Space Station	2006	5	3	4.99	100	25.99	PG-13
72	Bill Others	A Stunning Saga of a Mad Scientist And a Forensic Psychologist who must Challenge a Squirrel in A MySQL Convention	2006	5	6	2.99	93	12.99	PG
73	Bingo Talented	A Touching Tale of a Girl And a Crocodile who must Discover a Waitress in Nigeria	2006	5	5	2.99	150	22.99	PG-13
74	Birch Antitrust	A Fanciful Panorama of a Husband And a Pioneer who must Outgun a Dog in A Baloon	2006	5	4	4.99	162	18.99	PG
75	Bird Independence	A Thrilling Documentary of a Car And a Student who must Sink a Hunter in The Canadian Rockies	2006	5	6	4.99	163	14.99	G
84	Boiled Dares	A Awe-Inspiring Story of a Waitress And a Dog who must Discover a Dentist in Ancient Japan	2006	6	7	4.99	102	13.99	PG
85	Bonnie Holocaust	A Fast-Paced Story of a Crocodile And a Robot who must Find a Moose in Ancient Japan	2006	6	4	0.99	63	29.99	G
86	Boogie Amelie	A Lacklusture Character Study of a Husband And a Sumo Wrestler who must Succumb a Technical Writer in The Gulf of Mexico	2006	6	6	4.99	121	11.99	R
87	Boondock Ballroom	A Fateful Panorama of a Crocodile And a Boy who must Defeat a Monkey in The Gulf of Mexico	2006	6	7	0.99	76	14.99	NC-17
88	Born Spinal	A Touching Epistle of a Frisbee And a Husband who must Pursue a Student in Nigeria	2006	6	7	4.99	179	17.99	PG
89	Borrowers Bedazzled	A Brilliant Epistle of a Teacher And a Sumo Wrestler who must Defeat a Man in An Abandoned Fun House	2006	6	7	0.99	63	22.99	G
90	Boulevard Mob	A Fateful Epistle of a Moose And a Monkey who must Confront a Lumberjack in Ancient China	2006	6	3	0.99	63	11.99	R
96	Breaking Home	A Beautiful Display of a Secret Agent And a Monkey who must Battle a Sumo Wrestler in An Abandoned Mine Shaft	2006	6	4	2.99	169	21.99	PG-13
97	Bride Intrigue	A Epic Tale of a Robot And a Monkey who must Vanquish a Man in New Orleans	2006	6	7	0.99	56	24.99	G
98	Bright Encounters	A Fateful Yarn of a Lumberjack And a Feminist who must Conquer a Student in A Jet Boat	2006	6	4	4.99	73	12.99	PG-13
99	Bringing Hysterical	A Fateful Saga of a A Shark And a Technical Writer who must Find a Woman in A Jet Boat	2006	6	7	2.99	136	14.99	PG
100	Brooklyn Desert	A Beautiful Drama of a Dentist And a Composer who must Battle a Sumo Wrestler in The First Manned Space Station	2006	6	7	4.99	161	21.99	R
\.


--
-- TOC entry 2971 (class 0 OID 18466)
-- Dependencies: 210
-- Data for Name: film_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film_actor (actor_id, film_id) FROM stdin;
1	1
1	23
1	25
2	3
2	31
2	47
3	17
3	40
3	42
3	87
4	23
4	25
4	56
4	62
4	79
4	87
5	19
5	54
5	85
6	29
6	53
6	60
6	70
7	25
7	27
7	35
7	67
7	96
8	47
9	30
9	74
10	1
10	9
12	16
12	17
12	34
12	37
12	91
12	92
13	17
13	29
13	45
13	87
15	31
15	89
15	91
16	80
16	87
17	96
18	44
18	84
19	2
19	3
20	1
20	54
20	63
21	6
21	87
21	88
22	9
22	23
22	56
22	89
23	6
23	42
23	78
24	3
24	83
25	21
25	86
26	9
26	21
26	34
26	90
26	93
27	19
27	34
27	85
28	14
28	43
28	58
28	74
28	96
29	10
29	79
30	1
30	53
30	64
30	69
30	77
30	87
31	88
32	65
32	84
33	56
34	43
34	90
35	10
35	35
35	52
36	15
36	81
37	10
37	12
37	19
38	24
39	71
39	73
40	1
40	11
40	34
41	4
41	60
41	69
41	86
41	100
42	24
43	19
43	42
43	56
43	89
44	58
44	84
44	88
44	94
45	18
45	65
45	66
46	38
46	51
47	25
47	36
47	53
47	67
48	99
49	31
51	5
51	63
52	20
52	92
52	96
53	1
53	9
53	51
53	58
54	84
55	8
55	27
55	75
56	63
56	87
57	16
57	34
58	48
58	68
59	5
59	46
59	54
59	72
59	88
60	31
60	85
62	6
62	42
62	54
62	100
63	73
64	3
64	10
64	37
64	87
64	88
65	39
65	46
65	97
66	55
67	24
67	57
67	67
68	9
68	45
69	15
69	88
70	50
70	53
70	92
71	26
71	52
72	34
73	36
73	45
73	51
73	77
74	28
74	44
75	12
75	34
76	60
76	66
76	68
76	95
77	13
77	22
77	40
77	73
77	78
78	86
79	32
79	33
79	40
80	69
81	4
81	11
81	59
81	89
82	17
82	33
83	49
83	52
83	58
84	19
84	39
84	46
85	2
85	14
85	72
85	85
85	92
87	48
88	4
88	76
88	87
89	47
90	2
90	11
90	100
91	13
91	25
91	48
92	90
92	94
93	71
94	13
94	60
94	76
95	22
95	35
95	47
95	52
95	65
95	74
96	8
96	36
96	40
96	54
96	58
96	66
98	66
98	72
98	81
98	87
99	7
99	27
99	84
100	17
101	60
101	66
101	85
102	20
102	34
102	53
103	5
104	19
104	39
104	40
104	59
104	70
105	12
105	15
105	21
105	29
105	42
106	44
106	83
107	62
108	1
108	6
108	9
109	12
109	48
109	77
110	8
110	27
110	62
111	61
111	78
111	98
112	34
112	37
113	35
113	84
114	13
114	68
114	90
115	49
115	52
116	36
116	48
116	88
116	90
117	10
117	15
117	42
118	35
118	39
118	41
118	49
118	55
119	21
119	49
119	64
119	87
120	57
120	63
122	22
122	29
122	76
122	83
123	3
123	43
123	67
124	22
124	64
125	62
125	98
125	100
126	21
126	34
126	43
126	58
126	85
126	96
127	36
127	47
127	48
127	79
128	26
128	82
129	56
129	89
130	9
130	26
130	37
130	43
130	49
130	57
131	48
131	66
131	94
132	81
132	82
133	7
133	51
135	35
135	41
135	65
135	88
136	20
136	25
136	33
136	56
136	61
137	6
137	14
137	56
137	96
138	8
138	52
138	61
139	20
139	35
139	57
139	74
139	90
140	27
140	77
141	43
141	67
142	10
142	18
143	47
143	79
144	18
144	67
144	79
144	90
144	99
145	39
146	12
146	16
146	33
147	4
147	85
148	27
148	57
149	53
149	72
149	95
150	23
150	63
150	75
150	94
152	59
153	47
153	64
154	27
155	20
155	67
156	53
157	10
157	24
157	34
158	32
158	47
158	64
158	66
159	20
159	82
160	2
160	17
160	43
161	43
161	58
161	89
161	90
162	1
162	4
162	7
162	18
162	28
162	32
162	33
162	41
162	85
163	30
163	45
164	15
164	23
165	72
165	95
166	25
166	38
166	55
166	61
166	68
166	86
167	17
167	25
167	63
167	72
168	32
168	56
168	92
169	6
169	78
169	93
170	7
170	15
170	27
170	33
171	49
172	57
172	100
173	49
173	55
173	74
173	80
174	11
174	61
175	9
175	29
175	67
176	13
176	73
176	89
177	12
177	39
177	52
177	55
177	86
178	30
178	34
179	24
179	27
179	65
179	85
180	12
180	33
181	5
181	40
181	74
181	78
181	83
182	33
183	32
183	40
183	71
184	35
184	87
185	7
185	95
186	95
187	17
187	25
187	29
187	51
187	73
187	76
187	98
188	1
188	10
188	14
188	51
189	43
189	82
190	38
190	54
190	62
190	87
191	16
191	39
191	84
192	16
192	69
193	44
193	80
194	9
194	42
194	67
194	86
194	88
194	98
196	64
197	6
197	29
197	63
198	1
199	67
199	84
200	5
200	49
200	80
\.


--
-- TOC entry 2972 (class 0 OID 18470)
-- Dependencies: 211
-- Data for Name: film_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film_category (film_id, category_id) FROM stdin;
1	6
2	11
3	6
4	11
5	8
6	9
7	5
8	11
9	11
10	15
11	9
12	12
13	11
14	4
15	9
16	9
17	12
18	2
19	1
20	12
21	1
22	13
23	2
24	11
25	13
26	14
27	15
28	5
29	1
30	11
31	8
32	13
33	7
34	11
35	11
36	2
37	4
38	1
39	14
40	6
41	16
42	15
43	8
44	14
45	13
46	10
47	9
48	3
49	14
50	8
51	12
52	9
53	8
54	12
55	14
56	1
57	16
58	6
59	3
60	4
61	7
62	6
63	8
64	7
65	11
66	3
67	1
68	3
69	14
70	2
71	8
72	6
73	14
74	12
75	16
76	12
77	13
78	2
79	7
80	8
81	14
82	8
83	8
84	16
85	6
86	12
87	16
88	16
89	2
90	13
91	4
92	11
93	13
94	8
95	13
96	13
97	1
98	7
99	5
100	9
\.


--
-- TOC entry 2974 (class 0 OID 18476)
-- Dependencies: 213
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (inventory_id, film_id, store_id) FROM stdin;
1	1	1
2	1	1
3	1	1
4	1	1
5	1	2
6	1	2
7	1	2
8	1	2
9	2	2
10	2	2
11	2	2
12	3	2
13	3	2
14	3	2
15	3	2
16	4	1
17	4	1
18	4	1
19	4	1
20	4	2
21	4	2
22	4	2
23	5	2
24	5	2
25	5	2
26	6	1
27	6	1
28	6	1
29	6	2
30	6	2
31	6	2
32	7	1
33	7	1
34	7	2
35	7	2
36	7	2
37	8	2
38	8	2
39	8	2
40	8	2
41	9	1
42	9	1
43	9	1
44	9	2
45	9	2
46	10	1
47	10	1
48	10	1
49	10	1
50	10	2
51	10	2
52	10	2
53	11	1
54	11	1
55	11	1
56	11	1
57	11	2
58	11	2
59	11	2
60	12	1
61	12	1
62	12	1
63	12	2
64	12	2
65	12	2
66	12	2
67	13	2
68	13	2
69	13	2
70	13	2
71	15	1
72	15	1
73	15	2
74	15	2
75	15	2
76	15	2
77	16	1
78	16	1
79	16	2
80	16	2
81	17	1
82	17	1
83	17	1
84	17	2
85	17	2
86	17	2
87	18	1
88	18	1
89	18	1
90	18	2
91	18	2
92	18	2
93	19	1
94	19	1
95	19	1
96	19	1
97	19	2
98	19	2
99	20	1
100	20	1
\.


--
-- TOC entry 2976 (class 0 OID 18483)
-- Dependencies: 215
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language (language_id, name) FROM stdin;
1	English
2	Italian
3	Japanese
4	Mandarin
5	French
6	German
\.


--
-- TOC entry 2978 (class 0 OID 18490)
-- Dependencies: 217
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 18496)
-- Dependencies: 219
-- Data for Name: rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id) FROM stdin;
64	2005-05-25	79	368	2005-06-03	1
\.


--
-- TOC entry 2982 (class 0 OID 18503)
-- Dependencies: 221
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password) FROM stdin;
1	Mike	Hillyer	3	Mike.Hillyer@sakilastaff.com	1	t	Mike	8cb2237d0679ca88db6464eac60da96345513964
2	Jon	Stephens	4	Jon.Stephens@sakilastaff.com	2	t	Jon	8cb2237d0679ca88db6464eac60da96345513964
\.


--
-- TOC entry 2984 (class 0 OID 18514)
-- Dependencies: 223
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.store (store_id, manager_staff_id, address_id) FROM stdin;
1	1	1
2	2	2
\.


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 196
-- Name: actor_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_actor_id_seq', 200, true);


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 198
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_address_id_seq', 605, true);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 200
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 16, true);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 202
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_city_id_seq', 600, true);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 204
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_country_id_seq', 109, true);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 206
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 599, true);


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 208
-- Name: film_film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_film_id_seq', 1001, true);


--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 212
-- Name: inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_inventory_id_seq', 4581, true);


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 214
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_language_id_seq', 6, true);


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 216
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 32098, true);


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 218
-- Name: rental_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rental_rental_id_seq', 16049, true);


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 220
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 2, true);


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 222
-- Name: store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.store_store_id_seq', 2, true);


--
-- TOC entry 2772 (class 2606 OID 18520)
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


--
-- TOC entry 2775 (class 2606 OID 18522)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- TOC entry 2778 (class 2606 OID 18524)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 2780 (class 2606 OID 18526)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);


--
-- TOC entry 2783 (class 2606 OID 18528)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- TOC entry 2785 (class 2606 OID 18530)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2794 (class 2606 OID 41051)
-- Name: film_actor film_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_pkey PRIMARY KEY (actor_id, film_id);


--
-- TOC entry 2797 (class 2606 OID 41075)
-- Name: film_category film_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_pkey PRIMARY KEY (film_id, category_id);


--
-- TOC entry 2790 (class 2606 OID 18536)
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (film_id);


--
-- TOC entry 2800 (class 2606 OID 18538)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id);


--
-- TOC entry 2802 (class 2606 OID 18540)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- TOC entry 2807 (class 2606 OID 18542)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 2811 (class 2606 OID 18544)
-- Name: rental rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (rental_id);


--
-- TOC entry 2813 (class 2606 OID 18546)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- TOC entry 2816 (class 2606 OID 18548)
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);


--
-- TOC entry 2773 (class 1259 OID 18550)
-- Name: idx_actor_last_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_actor_last_name ON public.actor USING btree (last_name);


--
-- TOC entry 2786 (class 1259 OID 18551)
-- Name: idx_fk_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_address_id ON public.customer USING btree (address_id);


--
-- TOC entry 2776 (class 1259 OID 18552)
-- Name: idx_fk_city_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_city_id ON public.address USING btree (city_id);


--
-- TOC entry 2781 (class 1259 OID 18553)
-- Name: idx_fk_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_country_id ON public.city USING btree (country_id);


--
-- TOC entry 2803 (class 1259 OID 18554)
-- Name: idx_fk_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_customer_id ON public.payment USING btree (customer_id);


--
-- TOC entry 2795 (class 1259 OID 41052)
-- Name: idx_fk_film_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_film_id ON public.film_actor USING btree (film_id);


--
-- TOC entry 2808 (class 1259 OID 18556)
-- Name: idx_fk_inventory_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_inventory_id ON public.rental USING btree (inventory_id);


--
-- TOC entry 2791 (class 1259 OID 18557)
-- Name: idx_fk_language_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_language_id ON public.film USING btree (language_id);


--
-- TOC entry 2804 (class 1259 OID 18558)
-- Name: idx_fk_rental_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_rental_id ON public.payment USING btree (rental_id);


--
-- TOC entry 2805 (class 1259 OID 18559)
-- Name: idx_fk_staff_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_staff_id ON public.payment USING btree (staff_id);


--
-- TOC entry 2787 (class 1259 OID 18560)
-- Name: idx_fk_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fk_store_id ON public.customer USING btree (store_id);


--
-- TOC entry 2788 (class 1259 OID 18561)
-- Name: idx_last_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_last_name ON public.customer USING btree (last_name);


--
-- TOC entry 2798 (class 1259 OID 18562)
-- Name: idx_store_id_film_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_store_id_film_id ON public.inventory USING btree (store_id, film_id);


--
-- TOC entry 2792 (class 1259 OID 18563)
-- Name: idx_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_title ON public.film USING btree (title);


--
-- TOC entry 2814 (class 1259 OID 18564)
-- Name: idx_unq_manager_staff_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_unq_manager_staff_id ON public.store USING btree (manager_staff_id);


--
-- TOC entry 2809 (class 1259 OID 43257)
-- Name: idx_unq_rental_rental_date_inventory_id_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_unq_rental_rental_date_inventory_id_customer_id ON public.rental USING btree (rental_date, inventory_id, customer_id);


--
-- TOC entry 2835 (class 2620 OID 18566)
-- Name: film film_fulltext_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER film_fulltext_trigger BEFORE INSERT OR UPDATE ON public.film FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('fulltext', 'pg_catalog.english', 'title', 'description');


--
-- TOC entry 2819 (class 2606 OID 18567)
-- Name: customer customer_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2821 (class 2606 OID 41040)
-- Name: film_actor film_actor_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actor(actor_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2822 (class 2606 OID 41053)
-- Name: film_actor film_actor_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_actor
    ADD CONSTRAINT film_actor_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2824 (class 2606 OID 41076)
-- Name: film_category film_category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2823 (class 2606 OID 41065)
-- Name: film_category film_category_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_category
    ADD CONSTRAINT film_category_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2820 (class 2606 OID 18592)
-- Name: film film_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.language(language_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2817 (class 2606 OID 18597)
-- Name: address fk_address_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT fk_address_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);


--
-- TOC entry 2818 (class 2606 OID 18602)
-- Name: city fk_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk_city FOREIGN KEY (country_id) REFERENCES public.country(country_id);


--
-- TOC entry 2825 (class 2606 OID 18607)
-- Name: inventory inventory_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.film(film_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2826 (class 2606 OID 18612)
-- Name: payment payment_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2827 (class 2606 OID 18617)
-- Name: payment payment_rental_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_rental_id_fkey FOREIGN KEY (rental_id) REFERENCES public.rental(rental_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2828 (class 2606 OID 18622)
-- Name: payment payment_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2829 (class 2606 OID 18627)
-- Name: rental rental_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2830 (class 2606 OID 18632)
-- Name: rental rental_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES public.inventory(inventory_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2831 (class 2606 OID 18637)
-- Name: rental rental_staff_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rental
    ADD CONSTRAINT rental_staff_id_key FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);


--
-- TOC entry 2832 (class 2606 OID 18642)
-- Name: staff staff_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2833 (class 2606 OID 18647)
-- Name: store store_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2834 (class 2606 OID 18652)
-- Name: store store_manager_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_manager_staff_id_fkey FOREIGN KEY (manager_staff_id) REFERENCES public.staff(staff_id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2021-01-15 16:40:41

--
-- PostgreSQL database dump complete
--

