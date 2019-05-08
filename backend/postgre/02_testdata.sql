--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Debian 11.2-1.pgdg90+1)
-- Dumped by pg_dump version 11.2 (Debian 11.2-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: academicdegrees; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.academicdegrees (id, identification, name_en, name_fi, name_swe, description_en, description_fi, description_swe, url, credits, nqf, school, fieldofstudy, created_at, updated_at, nqf_level, competencedegreelink) FROM stdin;
\.


--
-- Data for Name: academies; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.academies (id, name, description, url, created_at, updated_at) FROM stdin;
1	Haaga-Helia	Haaga-Helia ammattikorkeakoulu kouluttaa liike-elämän ja palveluelinkeinojen asiantuntijoita sekä tutkii ja kehittää näihin aloihin liittyvää osaamista ja toimintaa. Koulutusalamme ovat liiketalous, tietotekniikka, hotelli-, ravintola- ja matkailuala, johdon assistenttityö, toimittajakoulutus, liikunta-ala sekä ammatillinen opettajankoulutus. Meille on tärkeää, että opiskelijoillamme on heti valmistuttuaan vahvat siteet työelämään. Panostamme toiminnassamme yrittäjyyteen, yhteistyöhön, innovatiivisuuteen ja kansainvälisyyteen.	https://www.haaga-helia.fi/fi/etusivu	2019-04-30 08:28:12.391+00	2019-04-30 08:28:12.413+00
2	Metropolia	Metropolia University of Applied Sciences is the largest University of Applied Sciences in Finland situated in Helsinki metropolitan area. The university has four fields of study: culture, business, health care and social services, and technology. Teaching is also provided in English.	https://www.metropolia.fi/	2019-04-30 08:28:33.528+00	2019-04-30 08:28:33.544+00
\.


--
-- Data for Name: competence; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.competence (id, name_en, description_en, credits, nqf, url, name_fi, name_swe, description_fi, description_swe, created_at, updated_at, organization, identification, nqf_level, competencedegreelink) FROM stdin;
\.


--
-- Data for Name: competencedegreelinks; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.competencedegreelinks (id, competencename_fi, competencename_en, competencename_swe, academicdegree_fi, academicdegree_en, academicdegree_swe, url, description_fi, description_en, description_swe, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: core_store; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.core_store (id, key, value, type, environment, tag) FROM stdin;
8	core_application	{"name":"Default Application","description":"This API is going to be awesome!"}	object		
9	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"comments","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-official","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","redirect_uri":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"}}	object		
10	plugin_email_provider	{"provider":"sendmail","name":"Sendmail","auth":{"sendmail_default_from":{"label":"Sendmail Default From","type":"text"},"sendmail_default_replyto":{"label":"Sendmail Default Reply-To","type":"text"}}}	object	development	
11	plugin_upload_provider	{"provider":"local","name":"Local server","enabled":true,"sizeLimit":1000000}	object	development	
12	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"refresh","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"­Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square-o","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object		
13	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_confirmation_redirection":"http://localhost:1337/admin","default_role":"authenticated"}	object		
17	db_model_examinations	{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"type":"integer"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
15	db_model_organizationeducations	{"name_en":{"type":"string"},"description_en":{"type":"text"},"credits":{"type":"integer"},"nqf":{"type":"integer"},"url":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
16	db_model_academies	{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
2	db_model_core_store	{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}	object	\N	\N
21	db_model_academicdegrees	{"identification":{"type":"string"},"name_en":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"model":"nqf"},"school":{"collection":"school","via":"academicdegree","isVirtual":true},"fieldofstudies":{"collection":"fieldofstudy","via":"academicdegree","isVirtual":true},"competencedegreelink":{"model":"competencedegreelink","via":"academicdegree"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
1	db_model_users-permissions_permission	{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}}	object	\N	\N
4	db_model_users-permissions_role	{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}}	object	\N	\N
6	db_model_upload_file_morph	{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"}}	object	\N	\N
7	plugin_content-manager_schema	{"generalSettings":{"search":true,"filters":true,"bulkActions":true,"pageEntries":10},"models":{"plugins":{"upload":{"file":{"label":"File","labelPlural":"Files","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":["created_at","updated_at"]},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"hash":{"label":"Hash","type":"string","description":"","name":"hash","editable":true,"placeholder":""},"sha256":{"label":"Sha256","type":"string","description":"","name":"sha256","editable":true,"placeholder":""},"ext":{"label":"Ext","type":"string","description":"","name":"ext","editable":true,"placeholder":""},"mime":{"label":"Mime","type":"string","description":"","name":"mime","editable":true,"placeholder":""},"size":{"label":"Size","type":"string","description":"","name":"size","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"public_id":{"label":"Public_id","type":"string","description":"","name":"public_id","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","hash","sha256","ext","mime","size","url","provider","public_id"],"relations":[]},"info":{"name":"file","description":""},"connection":"default","collectionName":"upload_file","attributes":{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false}},"globalId":"UploadFile","globalName":"UploadFile","primaryKey":"id","associations":[{"alias":"related","type":"collection","related":["Organization","School"],"nature":"manyMorphToOne","autoPopulate":true,"filter":"field"}],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"hash":{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},"sha256":{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},"ext":{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true},"mime":{"label":"Mime","description":"","type":"string","disabled":false,"name":"mime","sortable":true,"searchable":true},"size":{"label":"Size","description":"","type":"string","disabled":false,"name":"size","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"public_id":{"label":"Public_id","description":"","type":"string","disabled":false,"name":"public_id","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true}],"relations":{"related":{"alias":"related","type":"collection","related":["Organization","School"],"nature":"manyMorphToOne","autoPopulate":true,"filter":"field","description":"","label":"Related","displayedAttribute":"id"}}}},"users-permissions":{"permission":{"label":"Permission","labelPlural":"Permissions","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""},"controller":{"label":"Controller","type":"string","description":"","name":"controller","editable":true,"placeholder":""},"action":{"label":"Action","type":"string","description":"","name":"action","editable":true,"placeholder":""},"enabled":{"label":"Enabled","type":"boolean","description":"","name":"enabled","editable":true,"placeholder":""},"policy":{"label":"Policy","type":"string","description":"","name":"policy","editable":true,"placeholder":""}},"displayedField":"id","fields":["type","controller","action","enabled","policy"],"relations":["role"]},"info":{"name":"permission","description":""},"connection":"default","collectionName":"users-permissions_permission","attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}},"globalId":"UsersPermissionsPermission","globalName":"UsersPermissionsPermission","primaryKey":"id","associations":[{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},"controller":{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},"action":{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},"enabled":{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true},"policy":{"label":"Policy","description":"","type":"string","disabled":false,"name":"policy","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true}],"relations":{"role":{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}}},"role":{"label":"Role","labelPlural":"Roles","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"string","description":"","name":"description","editable":true,"placeholder":""},"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","type"],"relations":["permissions","users"]},"info":{"name":"role","description":""},"connection":"default","collectionName":"users-permissions_role","attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}},"globalId":"UsersPermissionsRole","globalName":"UsersPermissionsRole","primaryKey":"id","associations":[{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"},{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}],"relations":{"permissions":{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Permissions","displayedAttribute":"type"},"users":{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Users","displayedAttribute":"username"}}},"user":{"label":"User","labelPlural":"Users","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"username":{"label":"Username","type":"string","description":"","name":"username","editable":true,"placeholder":""},"email":{"label":"Email","type":"email","description":"","name":"email","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"password":{"label":"Password","type":"password","description":"","name":"password","editable":true,"placeholder":""},"confirmed":{"label":"Confirmed","type":"boolean","description":"","name":"confirmed","editable":true,"placeholder":""},"blocked":{"label":"Blocked","type":"boolean","description":"","name":"blocked","editable":true,"placeholder":""}},"displayedField":"id","fields":["username","email","provider","password","confirmed","blocked"],"relations":["role"]},"info":{"name":"user","description":""},"connection":"default","collectionName":"users-permissions_user","attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}},"globalId":"UsersPermissionsUser","globalName":"UsersPermissionsUser","primaryKey":"id","associations":[{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"username":{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},"email":{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"password":{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true},"confirmed":{"label":"Confirmed","description":"","type":"boolean","disabled":false,"name":"confirmed","sortable":true,"searchable":true},"blocked":{"label":"Blocked","description":"","type":"boolean","disabled":false,"name":"blocked","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true}],"relations":{"role":{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}}}}},"competence":{"label":"Competence","labelPlural":"Competences","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""},"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","description_en","credits","url","name_fi","name_swe","description_fi","description_swe","identification","__col-md-6__9xoe49"],"relations":["nqf","organizations","competencedegreelink"]},"info":{"name":"competence","description":"Järjestön koulutus"},"connection":"default","collectionName":"organizationeducations","attributes":{"name_en":{"type":"string"},"description_en":{"type":"text"},"url":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"identification":{"type":"string"},"nqf":{"model":"nqf"},"credits":{"type":"integer"},"organizations":{"collection":"organization","via":"competence","isVirtual":true},"competencedegreelink":{"model":"competencedegreelink","via":"competence"}},"globalId":"Competence","globalName":"Competence","primaryKey":"id","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"organizations","type":"collection","collection":"organization","via":"competence","nature":"oneToMany","autoPopulate":true,"dominant":true},{"alias":"competencedegreelink","type":"model","model":"competencedegreelink","via":"competence","nature":"manyToOne","autoPopulate":true,"dominant":true}],"fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true},"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true}],"relations":{"nqf":{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Nqf","displayedAttribute":"name_en"},"organizations":{"alias":"organizations","type":"collection","collection":"organization","via":"competence","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Organizations","displayedAttribute":"name_en"},"competencedegreelink":{"alias":"competencedegreelink","type":"model","model":"competencedegreelink","via":"competence","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Competencedegreelink","displayedAttribute":"url"}}},"fieldofstudy":{"label":"Fieldofstudy","labelPlural":"Fieldofstudies","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_fi","name_en","name_swe"],"relations":["academicdegree"]},"info":{"name":"fieldofstudy","description":"Ala"},"connection":"default","collectionName":"fieldofstudies","attributes":{"name_fi":{"type":"string"},"name_en":{"type":"string"},"name_swe":{"type":"string"},"academicdegree":{"model":"academicdegree","via":"fieldofstudies"}},"globalId":"Fieldofstudy","globalName":"Fieldofstudy","primaryKey":"id","associations":[{"alias":"academicdegree","type":"model","model":"academicdegree","via":"fieldofstudies","nature":"manyToOne","autoPopulate":true,"dominant":true}],"fields":{"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true}],"relations":{"academicdegree":{"alias":"academicdegree","type":"model","model":"academicdegree","via":"fieldofstudies","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Academicdegree","displayedAttribute":"identification"}}},"academicdegree":{"label":"Academicdegree","labelPlural":"Academicdegrees","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""}},"displayedField":"id","fields":["identification","name_en","name_fi","name_swe","description_en","description_fi","description_swe","url","credits","__col-md-6__264yc"],"relations":["nqf","school","fieldofstudies","competencedegreelink"]},"info":{"name":"academicdegree","description":"Oppilaitosten tutkinnot"},"connection":"default","collectionName":"academicdegrees","attributes":{"identification":{"type":"string"},"name_en":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"model":"nqf"},"school":{"collection":"school","via":"academicdegree","isVirtual":true},"fieldofstudies":{"collection":"fieldofstudy","via":"academicdegree","isVirtual":true},"competencedegreelink":{"model":"competencedegreelink","via":"academicdegree"}},"globalId":"Academicdegree","globalName":"Academicdegree","primaryKey":"id","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"school","type":"collection","collection":"school","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true},{"alias":"fieldofstudies","type":"collection","collection":"fieldofstudy","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true},{"alias":"competencedegreelink","type":"model","model":"competencedegreelink","via":"academicdegree","nature":"manyToOne","autoPopulate":true,"dominant":true}],"fields":{"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true}],"relations":{"nqf":{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Nqf","displayedAttribute":"name_en"},"school":{"alias":"school","type":"collection","collection":"school","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"School","displayedAttribute":"name_en"},"fieldofstudies":{"alias":"fieldofstudies","type":"collection","collection":"fieldofstudy","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Fieldofstudies","displayedAttribute":"name_fi"},"competencedegreelink":{"alias":"competencedegreelink","type":"model","model":"competencedegreelink","via":"academicdegree","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Competencedegreelink","displayedAttribute":"url"}}},"school":{"label":"School","labelPlural":"Schools","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false},"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_swe","description_en","description_fi","description_swe","url","logo","logoUrl"],"relations":["academicdegree"]},"info":{"name":"school","description":"Oppilaitokset"},"connection":"default","collectionName":"schools","attributes":{"name_en":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"academicdegree":{"model":"academicdegree","via":"school"}},"globalId":"School","globalName":"School","primaryKey":"id","associations":[{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field"},{"alias":"academicdegree","type":"model","model":"academicdegree","via":"school","nature":"manyToOne","autoPopulate":true,"dominant":true}],"fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true}],"relations":{"logo":{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field","description":"","label":"Logo","displayedAttribute":"name"},"academicdegree":{"alias":"academicdegree","type":"model","model":"academicdegree","via":"school","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Academicdegree","displayedAttribute":"identification"}}},"organization":{"label":"Organization","labelPlural":"Organizations","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false},"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_swe","description_fi","description_en","description_swe","url","logo","logoUrl"],"relations":["competence"]},"info":{"name":"organization","description":"Järjestöt"},"connection":"default","collectionName":"organizations","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_swe":{"type":"string"},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_swe":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"competence":{"model":"competence","via":"organizations"},"logoUrl":{"type":"string"}},"globalId":"Organization","globalName":"Organization","primaryKey":"id","associations":[{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field"},{"alias":"competence","type":"model","model":"competence","via":"organizations","nature":"manyToOne","autoPopulate":true,"dominant":true}],"fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true}],"relations":{"logo":{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field","description":"","label":"Logo","displayedAttribute":"name"},"competence":{"alias":"competence","type":"model","model":"competence","via":"organizations","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Competence","displayedAttribute":"name_en"}}},"competencedegreelink":{"label":"Competencedegreelink","labelPlural":"Competencedegreelinks","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""}},"displayedField":"id","fields":["url","description_fi","description_en","description_swe"],"relations":["competence","academicdegree"]},"info":{"name":"competencedegreelink","description":"Koulutus tutkinto. "},"connection":"default","collectionName":"competencedegreelinks","attributes":{"url":{"type":"string"},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_swe":{"type":"text"},"competence":{"collection":"competence","via":"competencedegreelink","isVirtual":true},"academicdegree":{"collection":"academicdegree","via":"competencedegreelink","isVirtual":true}},"globalId":"Competencedegreelink","globalName":"Competencedegreelink","primaryKey":"id","associations":[{"alias":"competence","type":"collection","collection":"competence","via":"competencedegreelink","nature":"oneToMany","autoPopulate":true,"dominant":true},{"alias":"academicdegree","type":"collection","collection":"academicdegree","via":"competencedegreelink","nature":"oneToMany","autoPopulate":true,"dominant":true}],"fields":{"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true}],"relations":{"competence":{"alias":"competence","type":"collection","collection":"competence","via":"competencedegreelink","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competence","displayedAttribute":"name_en"},"academicdegree":{"alias":"academicdegree","type":"collection","collection":"academicdegree","via":"competencedegreelink","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Academicdegree","displayedAttribute":"identification"}}},"nqf":{"label":"Nqf","labelPlural":"Nqfs","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"level":{"label":"Level","type":"enumeration","description":"","name":"level","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_swe","level"],"relations":[]},"info":{"name":"nqf","description":"NQF taso"},"connection":"default","collectionName":"nqfs","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_swe":{"type":"string"},"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true}},"globalId":"Nqf","globalName":"Nqf","primaryKey":"id","associations":[],"fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"level":{"label":"Level","description":"","type":"enumeration","disabled":false,"name":"level","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true}],"relations":{}}},"layout":{"user":{"actions":{"create":"User.create","update":"User.update","destroy":"User.destroy","deleteall":"User.destroyAll"},"attributes":{"username":{"className":"col-md-6"},"email":{"className":"col-md-6"},"resetPasswordToken":{"className":"d-none"},"role":{"className":"d-none"}}},"competence":{"attributes":{}},"fieldofstudy":{"attributes":{}},"academicdegree":{"attributes":{}},"school":{"attributes":{}},"organization":{"attributes":{}},"competencedegreelink":{"attributes":{}},"nqf":{"attributes":{}}}}	object		
19	db_model_nqfs	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_swe":{"type":"string"},"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
18	db_model_competence	{"name_en":{"type":"string"},"description_en":{"type":"text"},"url":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"identification":{"type":"string"},"nqf":{"model":"nqf"},"credits":{"type":"integer"},"organizations":{"collection":"organization","via":"competence","isVirtual":true},"competencedegreelink":{"model":"competencedegreelink","via":"competence"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
20	db_model_fieldofstudies	{"name_fi":{"type":"string"},"name_en":{"type":"string"},"name_swe":{"type":"string"},"academicdegree":{"model":"academicdegree","via":"fieldofstudies"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
14	db_model_organizations	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_swe":{"type":"string"},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_swe":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"competence":{"model":"competence","via":"organizations"},"logoUrl":{"type":"string"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
23	db_model_competencedegreelinks	{"url":{"type":"string"},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_swe":{"type":"text"},"competence":{"collection":"competence","via":"competencedegreelink","isVirtual":true},"academicdegree":{"collection":"academicdegree","via":"competencedegreelink","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
5	db_model_upload_file	{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
22	db_model_schools	{"name_en":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"academicdegree":{"model":"academicdegree","via":"school"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
3	db_model_users-permissions_user	{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}}	object	\N	\N
\.


--
-- Data for Name: examinations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.examinations (id, name, description, url, credits, nqf, created_at, updated_at) FROM stdin;
1	Tietojenkäsittelytiede	Tietojenkäsittelytieteen tutkinnossa opiskellaan tietotekniikkaa ja algoritmeja.		310	\N	2019-04-30 08:32:43.86+00	2019-04-30 08:32:43.888+00
\.


--
-- Data for Name: fieldofstudies; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.fieldofstudies (id, name_fi, name_en, name_swe, created_at, updated_at, academicdegree) FROM stdin;
1	Humanistiset alat ja teologia	\N	\N	2019-05-07 09:32:46.427+00	2019-05-07 09:32:46.441+00	\N
2	Kasvatusala	\N	\N	2019-05-07 09:32:52.448+00	2019-05-07 09:32:52.46+00	\N
3	Kauppa, hallinto ja oikeustiede	\N	\N	2019-05-07 09:33:01.518+00	2019-05-07 09:33:01.528+00	\N
4	Luonnontieteet, matematiikka ja tilastotiede	\N	\N	2019-05-07 09:33:12.355+00	2019-05-07 09:33:12.368+00	\N
5	Farmasia, hammaslääketiede ja lääketiede	\N	\N	2019-05-07 09:33:22.819+00	2019-05-07 09:33:22.832+00	\N
6	Maa- ja metsätaloustiede, eläinlääketiede	\N	\N	2019-05-07 09:33:33.309+00	2019-05-07 09:33:33.321+00	\N
7	Palvelualat: liikuntatiede, sotilasala	\N	\N	2019-05-07 09:33:45.149+00	2019-05-07 09:33:45.164+00	\N
8	Sosiaalitieteet, journalistiikka ja viestintä	\N	\N	2019-05-07 09:33:56.027+00	2019-05-07 09:33:56.038+00	\N
9	Taiteet ja kulttuuri	\N	\N	2019-05-07 09:34:03.203+00	2019-05-07 09:34:03.214+00	\N
10	Tekniikka, teollisuus ja rakentaminen	\N	\N	2019-05-07 09:34:10.767+00	2019-05-07 09:34:10.785+00	\N
11	Tietojenkäsittely, tietotekniikka (ICT) ja informaatiotutkimus	\N	\N	2019-05-07 09:34:25.498+00	2019-05-07 09:34:25.511+00	\N
12	Terveys- ja hyvinvointi	\N	\N	2019-05-07 09:34:31.882+00	2019-05-07 09:34:31.911+00	\N
13	Yhteiskuntatieteet	\N	\N	2019-05-07 09:34:37.367+00	2019-05-07 09:34:37.382+00	\N
\.


--
-- Data for Name: nqfs; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.nqfs (id, name_en, name_fi, name_swe, level, created_at, updated_at, competence) FROM stdin;
1	testname_eng	testname_fi	\N	4	2019-05-07 12:13:56.869+00	2019-05-07 12:28:52.193+00	\N
\.


--
-- Data for Name: organizationeducations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.organizationeducations (id, name, description, credits, nqf, created_at, updated_at, name_en, description_en, url, name_swe, description_fi, name_fi, description_swe) FROM stdin;
1	Ensiapukoulutus	Näin opit tyrehdyttämään vuotavan haavan.	3	5	2019-04-30 08:30:55.956+00	2019-04-30 08:30:55.968+00	\N	\N	\N	\N	\N	\N	\N
2	Partiojohtajan perustutkinto	Partiojohtajan perustutkinnolla osaat johtaa pientä ryhmää (1-5) henkilöä.	3	8	2019-04-30 08:31:37.607+00	2019-04-30 08:31:37.63+00	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.organizations (id, name, description, url, created_at, updated_at, name_en, description_en, name_fi, name_swe, description_fi, description_swe, competence, "logoUrl") FROM stdin;
5	\N	\N	https://www.martat.fi/	2019-05-07 10:01:37.725+00	2019-05-07 10:01:37.752+00	The Marthas	The Martha Organization is a Finnish home economics organization, founded in 1899 to promote well-being and quality of life in the home. It carries out cultural and civic education and does advocacy work in Finland.	Martat	\N	Martat toimivat valtakunnallisesti ja yhdistyksiä ja marttaryhmiä on melkein jokaisessa Suomen kunnassa. Piirien opetuskeittiöitä on 16 kaupungissa ja kurssejamme järjestetään ympäri vuoden. Pääset siis helposti mukaan – ehkä innostut itsekin vetämään marttatoimintaa sinua innostavan aiheen parissa!	\N	\N	\N
7	\N	\N	https://www.partio.fipartio	2019-05-07 10:02:11.827+00	2019-05-07 10:03:05.893+00	Scout	Guiding and Scouting is a wonderful means of learning new things about nature, yourself, other people and your own living environment. You get to pick up new things by doing them yourself instead of reading about them in books. Guiding and Scouting is all about doing things together: hiking, skiing, canoeing, sailing, practising first aid, making crafts and honing your woodcraft skills in the great outdoors. Guiding and Scouting is a hobby where each individual can truly make a difference!\nGuiding and Scouting is for everyone	Partio	\N	Partio on hauska ja monipuolinen harrastus, joka sopii kaikille. Partiossa leikitään, pelataan, retkeillään, leireillään, opitaan, saadaan uusia kavereita ja koetaan ikimuistoisia elämyksiä. Nuorimmat partiolaiset ovat noin 7-vuotiaita ja yläikärajaa ei ole. Tule mukaan, niin tiedät mikä kaikki on #parastapartiossa!	Scouting är en rolig, mångsidig och nyttig hobby för barn. Scouting är små och stora äventyr som du kan uppleva med dina vänner. Verksamheten sker både ute och inne. Inom scouterna får du till exempel pyssla, spela, tillreda mat, göra utflykter i naturen, delta i läger, vandra och segla. En viktig del är gemenskapen där ingen blir lämnad utanför och tankesättet “learning by doing” som genomsyrar hela verksamheten. Det finns en plats för alla, du är välkommen som du är – också som vuxen. Scouting stöder barnets fostran och uppmuntrar till att utvecklas både som individ och som en del av en grupp. Vi lär oss vardags- och medborgarfärdigheter, problemlösning och ledarskap.	\N	\N
8	\N	\N	https://www.judoliitto.fi	2019-05-07 10:04:35.603+00	2019-05-07 10:04:35.622+00	Finnish Judo Association	\N	Suomen Judoliitto	\N	Suomen Judoliitto ry on perustettu vuonna 1958. Vuodesta 1963 lähtien Judoliitto on toiminut suomalaisten judoseurojen keskusjärjestönä. Judoliitossa on 122 jäsenseuraa.\n\nJudoliitto on Kansainvälisen Judoliiton (IJF) ja Euroopan Judoliiton (EJU) jäsen. Judoliitto on jäsenenä Suomen Olympiakomiteassa, Suomen Paralympiakomiteassa ja Suomen Urheilutyönantajissa.	\N	\N	\N
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.schools (id, name_en, name_fi, name_swe, description_en, description_fi, description_swe, url, created_at, updated_at, "logoUrl", academicdegree) FROM stdin;
1	Haaga-Helia University of Applied Sciences	Haaga-Helia Ammattikorkeakoulu	\N	Haaga-Helia is a strongly business orientated university of applied sciences in Finland. Through education, research and development, we prepare professionals for business and services. We focus on co-operation, entrepreneurship, innovation and internationality.	Haaga-Helia ammattikorkeakoulu kouluttaa liike-elämän ja palveluelinkeinojen asiantuntijoita sekä tutkii ja kehittää näihin aloihin liittyvää osaamista ja toimintaa. Koulutusalamme ovat liiketalous, tietotekniikka, hotelli-, ravintola- ja matkailuala, johdon assistenttityö, toimittajakoulutus, liikunta-ala sekä ammatillinen opettajankoulutus. Meille on tärkeää, että opiskelijoillamme on heti valmistuttuaan vahvat siteet työelämään. Panostamme toiminnassamme yrittäjyyteen, yhteistyöhön, innovatiivisuuteen ja kansainvälisyyteen.	\N	http://www.haaga-helia.fi	2019-05-07 09:38:47.727+00	2019-05-07 09:38:47.75+00	\N	\N
3	University of Helsinki	Helsingin yliopisto	\N	The University of Helsinki seeks solutions for global challenges and creates new ways of thinking for the best of humanity. Through the power of science and research, the University has contributed to society, education and welfare since 1640. We have educated nine presidents and thousands of people at the top of politics, science, culture and economics. Not to mention four Nobel prize winners.	Helsingin yliopisto on Suomen suurin ja vanhin tiedekorkeakoulu. Vuodesta 1640 se on ollut mukana luomassa reilua ja tasa-arvoista yhteiskuntaa, jota monilla mittareilla pidetään maailman parhaana. Tänään monitieteinen tiedeyhteisö ratkoo ongelmia, jotka koskettavat meistä jokaista, myös kansainvälisesti. 40 000 opiskelijan ja työntekijän tiedeyhteisö synnyttää ratkaisuja, jotka muotoilevat planeettamme ja koko ihmiskunnan tulevaisuutta.	Sedan år 1640 har vi varit den finländska civilisationens och det nya tänkandets vagga. Nu hör vi till den bästa procenten bland världens mångvetenskapliga universitet.	https://www.helsinki.fi/fi/yliopisto	2019-05-07 09:42:25.038+00	2019-05-07 09:42:25.055+00	\N	\N
2	Metropolia University	Metropolia Ammattikorkeakoulu	\N	Metropolia University of Applied Sciences, Finland’s largest university of applied sciences, educates the professionals of tomorrow in the fields of Business, Culture, Health care and Social services, and Technology.\n\nIn our community people and worlds meet to create insight, expertise and well-being for both the professional life and life in general. You can count on Metropolia as a reliable partner and an innovator in higher education. Through cooperation we discover new ideas and solutions to build a better future.	Metropolia on pääkaupunkiseudulla toimiva kansainvälinen ja monialainen ammattikorkeakoulu. Koulutamme kulttuurin, liiketalouden, sosiaali- ja terveysalan sekä tekniikan asiantuntijoita ja kehittäjiä. Muodostamme yhteisön, jossa erilaiset ihmiset ja maailmat kohtaavat ja joka synnyttää oivalluksia ja osaamista työhön ja hyvinvointia elämään. Olemme vastuullinen kumppani ja korkeakoulutuksen uudistaja, joka yhteistyössä löytää uusia ratkaisuja ja rakentaa parempaa tulevaisuutta.\n\nVuoteen 2020 ulottuva strategiamme tähtää voimakkaasti uudistumiseen. Siinä korostuu tavoite vahvistaa Metropolian yhtenäisyyttä, osaamisen kehittämistä, kilpailukykyä ja yhteiskunnallista vaikuttavuutta. Tahtotilanamme on olla osaamisen rohkea uudistaja ja tulevaisuuden aktiivinen rakentaja.\n\nKeskitymme tulevina vuosina laadukkaaseen oppimiseen ja työelämäyhteistyöhön. Haluamme uudistaa toimintakulttuurimme ja osaamistamme digitalisaation sekä kehittyvien kampustemme myötä. Tutkimus-, kehittämis- ja innovaatiotoiminnassa sekä liiketoiminnassa haemme kasvua erityisesti vaikuttavuudessa ja ulkoisessa rahoituksessa.	\N	https://www.metropolia.fi/	2019-05-07 09:40:58.1+00	2019-05-07 09:42:48.873+00	\N	\N
4	Aalto University	Aalto-yliopisto	\N	Aalto University is a multidisciplinary community of bold thinkers, where science and art meet technology and business. We are committed to identifying and solving grand societal challenges and building an innovative future.	Aalto-yliopisto on monialainen tiedeyhteisö, jossa tiede ja taide kohtaavat tekniikan ja talouden. Rakennamme innovatiivista yhteiskuntaa korkeatasoisen tutkimuksen, opetuksen ja taiteellisen toiminnan keinoin.	Aalto-universitetet är en flervetenskaplig gemenskap av modiga tänkare, där konst och vetenskap möter teknik och ekonomi. Vi bygger ett innovativt samhälle med hjälp av högklassig forskning, undervisning och konstnärlig verksamhet. 	https://www.aalto.fi/	2019-05-07 09:44:40.537+00	2019-05-07 09:44:40.574+00	\N	\N
5	Laurea University Of Applied Sciences	Laurea-ammattikorkeakoulu	\N	Laurea University of Applied Sciences operates in Uusimaa region at six different campuses. There are about 7800 students, 500 staff members and more than 24 000 alumni in our community.	Olemme kuudella kampuksella Uudellamaalla toimiva ammattikorkeakoulu. Yhteisöömme kuuluu noin 7 800 opiskelijaa, 500 henkilökunnan jäsentä sekä yli 24 000 alumnia.	\N	https://www.laurea.fi	2019-05-07 09:45:57.785+00	2019-05-07 09:45:57.803+00	\N	\N
\.


--
-- Data for Name: upload_file; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.upload_file (id, name, hash, sha256, ext, mime, size, url, provider, public_id, created_at, updated_at) FROM stdin;
1	haagahelialogo.png	b67fa8244f1147699bd6bfe4b1a437eb	oJLfTJZQee80kAUoxiEj8QRUy02Ls12017yJ79Gi1n0	.png	image/png	4.25	/uploads/b67fa8244f1147699bd6bfe4b1a437eb.png	local	\N	2019-05-07 09:38:47.781+00	2019-05-07 09:38:47.81+00
2	hy_logo_black.png	0c76b641ae404f5090ede7a8a2132bfc	Jw8HIGrzvLv3I59z2Lf9fkX5ccA_QqoIlpQAsi8-bKA	.png	image/png	14.33	/uploads/0c76b641ae404f5090ede7a8a2132bfc.png	local	\N	2019-05-07 09:42:25.079+00	2019-05-07 09:42:25.1+00
3	Metropolia_Ammattikorkeakoulu_logo.svg.png	d7b49103ed4646029fb6774fb9c1d36a	GtJQj7AHcVdJGeJIk8g8dYfA3G9_RD6q36DaUUlI1Ig	.png	image/png	76.80	/uploads/d7b49103ed4646029fb6774fb9c1d36a.png	local	\N	2019-05-07 09:42:48.897+00	2019-05-07 09:42:48.918+00
4	Aalto-yliopiston_logo.svg.png	f715e5f043344961baa643bda7f83aa0	k7KFCHoYZNnfdN_PiSqP4tlfa91Pv6nIbZDrindt3dA	.png	image/png	31.65	/uploads/f715e5f043344961baa643bda7f83aa0.png	local	\N	2019-05-07 09:44:40.618+00	2019-05-07 09:44:40.646+00
5	250px-Neliötunnus_Laurea-ammattikorkeakoulu.png	c9921e4aded94c54a7c1fc203d09ad9a	ns2Gqk0D1-47YXb1UmRn5uZp6U0PdgJtlIt2-d8qujY	.png	image/png	16.07	/uploads/c9921e4aded94c54a7c1fc203d09ad9a.png	local	\N	2019-05-07 09:45:57.829+00	2019-05-07 09:45:57.851+00
6	syd_n_martat_martat_auttaa-1.jpg	e644e424b9674a4ea64ef04742bd473e	atyftPrfHpVJI-RBDFkemgst--4hskqemT2udPP2V4Y	.jpg	image/jpeg	225.90	/uploads/e644e424b9674a4ea64ef04742bd473e.jpg	local	\N	2019-05-07 09:55:55.098+00	2019-05-07 09:55:55.124+00
7	syd_n_martat_martat_auttaa-1.jpg	388ddc8752c54df6aaa2d0019bb5c0f7	atyftPrfHpVJI-RBDFkemgst--4hskqemT2udPP2V4Y	.jpg	image/jpeg	225.90	/uploads/388ddc8752c54df6aaa2d0019bb5c0f7.jpg	local	\N	2019-05-07 10:01:37.788+00	2019-05-07 10:01:37.81+00
8	partio.png	c483df0b2def4ff2bab60a24f8633374	TE9ZyTC083vgQZ27nV57uCQe8Sxd0PGCkVe2wDdC57g	.png	image/png	7.96	/uploads/c483df0b2def4ff2bab60a24f8633374.png	local	\N	2019-05-07 10:03:05.923+00	2019-05-07 10:03:05.944+00
9	judoliitto.jpg	c7fc232ad6c640859ae83b7592cad6af	sGVs0lJ90YuYyHxpaq9aXcOrvO4jg4xpY0CJgUqxR_Q	.jpg	image/jpeg	21.95	/uploads/c7fc232ad6c640859ae83b7592cad6af.jpg	local	\N	2019-05-07 10:04:35.651+00	2019-05-07 10:04:35.671+00
\.


--
-- Data for Name: upload_file_morph; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.upload_file_morph (id, upload_file_id, related_id, related_type, field) FROM stdin;
1	1	1	schools	logo
2	2	3	schools	logo
3	3	2	schools	logo
4	4	4	schools	logo
5	5	5	schools	logo
6	6	3	organizations	logo
7	7	5	organizations	logo
8	8	7	organizations	logo
9	9	8	organizations	logo
\.


--
-- Data for Name: users-permissions_permission; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."users-permissions_permission" (id, type, controller, action, enabled, policy, role) FROM stdin;
1	content-manager	contentmanager	models	t		1
2	content-manager	contentmanager	find	t		1
3	content-manager	contentmanager	count	t		1
4	content-manager	contentmanager	findone	t		1
5	content-manager	contentmanager	create	t		1
6	content-manager	contentmanager	update	t		1
7	content-manager	contentmanager	updatesettings	t		1
8	content-manager	contentmanager	delete	t		1
9	content-manager	contentmanager	deleteall	t		1
10	content-type-builder	contenttypebuilder	getmodels	t		1
11	content-type-builder	contenttypebuilder	getmodel	t		1
12	content-type-builder	contenttypebuilder	getconnections	t		1
13	content-type-builder	contenttypebuilder	createmodel	t		1
14	content-type-builder	contenttypebuilder	updatemodel	t		1
15	content-type-builder	contenttypebuilder	deletemodel	t		1
16	content-type-builder	contenttypebuilder	autoreload	t		1
17	content-type-builder	contenttypebuilder	checktableexists	t		1
18	email	email	send	t		1
19	email	email	getenvironments	t		1
20	settings-manager	settingsmanager	menu	t		1
21	settings-manager	settingsmanager	environments	t		1
22	settings-manager	settingsmanager	languages	t		1
23	settings-manager	settingsmanager	databases	t		1
24	settings-manager	settingsmanager	database	t		1
25	settings-manager	settingsmanager	databasemodel	t		1
26	email	email	updatesettings	t		1
27	email	email	getsettings	t		1
28	settings-manager	settingsmanager	get	t		1
29	settings-manager	settingsmanager	update	t		1
30	settings-manager	settingsmanager	createlanguage	t		1
31	settings-manager	settingsmanager	deletelanguage	t		1
32	settings-manager	settingsmanager	createdatabase	t		1
33	settings-manager	settingsmanager	updatedatabase	t		1
34	settings-manager	settingsmanager	deletedatabase	t		1
35	settings-manager	settingsmanager	autoreload	t		1
36	upload	upload	upload	t		1
37	upload	upload	getenvironments	t		1
38	upload	upload	getsettings	t		1
39	upload	upload	updatesettings	t		1
40	upload	upload	find	t		1
41	upload	upload	findone	t		1
42	upload	upload	count	t		1
43	upload	upload	destroy	t		1
44	upload	upload	search	t		1
45	users-permissions	auth	callback	t		1
46	users-permissions	auth	changepassword	t		1
47	users-permissions	auth	connect	t		1
48	users-permissions	auth	forgotpassword	t		1
49	users-permissions	auth	register	t		1
50	users-permissions	auth	emailconfirmation	t		1
51	users-permissions	user	find	t		1
52	users-permissions	user	me	t		1
53	users-permissions	user	findone	t		1
54	users-permissions	user	create	t		1
55	users-permissions	user	update	t		1
56	users-permissions	user	destroy	t		1
57	users-permissions	user	destroyall	t		1
58	users-permissions	userspermissions	createrole	t		1
59	users-permissions	userspermissions	deleteprovider	t		1
60	users-permissions	userspermissions	deleterole	t		1
61	users-permissions	userspermissions	getpermissions	t		1
62	users-permissions	userspermissions	getpolicies	t		1
63	users-permissions	userspermissions	getrole	t		1
64	users-permissions	userspermissions	getroles	t		1
65	users-permissions	userspermissions	getroutes	t		1
66	users-permissions	userspermissions	index	t		1
67	users-permissions	userspermissions	init	t		1
68	users-permissions	userspermissions	searchusers	t		1
69	users-permissions	userspermissions	updaterole	t		1
70	users-permissions	userspermissions	getemailtemplate	t		1
71	users-permissions	userspermissions	updateemailtemplate	t		1
72	users-permissions	userspermissions	getadvancedsettings	t		1
73	users-permissions	userspermissions	updateadvancedsettings	t		1
74	users-permissions	userspermissions	getproviders	t		1
75	users-permissions	userspermissions	updateproviders	t		1
76	content-manager	contentmanager	models	f		2
77	content-manager	contentmanager	find	f		2
78	content-manager	contentmanager	count	f		2
79	content-manager	contentmanager	findone	f		2
80	content-manager	contentmanager	create	f		2
81	content-manager	contentmanager	update	f		2
82	content-manager	contentmanager	updatesettings	f		2
83	content-manager	contentmanager	delete	f		2
84	content-manager	contentmanager	deleteall	f		2
85	content-type-builder	contenttypebuilder	getmodels	f		2
86	content-type-builder	contenttypebuilder	getmodel	f		2
87	content-type-builder	contenttypebuilder	getconnections	f		2
88	content-type-builder	contenttypebuilder	createmodel	f		2
89	content-type-builder	contenttypebuilder	updatemodel	f		2
90	content-type-builder	contenttypebuilder	deletemodel	f		2
91	content-type-builder	contenttypebuilder	autoreload	t		2
92	content-type-builder	contenttypebuilder	checktableexists	f		2
93	email	email	send	f		2
94	email	email	getenvironments	f		2
95	email	email	getsettings	f		2
96	email	email	updatesettings	f		2
97	settings-manager	settingsmanager	menu	f		2
98	settings-manager	settingsmanager	environments	f		2
99	settings-manager	settingsmanager	languages	f		2
100	settings-manager	settingsmanager	databases	f		2
101	settings-manager	settingsmanager	database	f		2
111	upload	upload	upload	f		2
121	users-permissions	auth	changepassword	f		2
131	users-permissions	user	destroy	f		2
141	users-permissions	userspermissions	index	f		2
102	settings-manager	settingsmanager	databasemodel	f		2
112	upload	upload	getenvironments	f		2
122	users-permissions	auth	connect	t		2
132	users-permissions	user	destroyall	f		2
142	users-permissions	userspermissions	init	t		2
103	settings-manager	settingsmanager	get	f		2
113	upload	upload	getsettings	f		2
123	users-permissions	auth	forgotpassword	f		2
133	users-permissions	userspermissions	createrole	f		2
143	users-permissions	userspermissions	searchusers	f		2
104	settings-manager	settingsmanager	update	f		2
114	upload	upload	updatesettings	f		2
124	users-permissions	auth	register	f		2
134	users-permissions	userspermissions	deleteprovider	f		2
144	users-permissions	userspermissions	updaterole	f		2
105	settings-manager	settingsmanager	createlanguage	f		2
115	upload	upload	find	f		2
125	users-permissions	auth	emailconfirmation	f		2
135	users-permissions	userspermissions	deleterole	f		2
145	users-permissions	userspermissions	getemailtemplate	f		2
106	settings-manager	settingsmanager	deletelanguage	f		2
116	upload	upload	findone	f		2
126	users-permissions	user	find	f		2
136	users-permissions	userspermissions	getpermissions	f		2
146	users-permissions	userspermissions	updateemailtemplate	f		2
107	settings-manager	settingsmanager	createdatabase	f		2
117	upload	upload	count	f		2
127	users-permissions	user	me	t		2
137	users-permissions	userspermissions	getpolicies	f		2
147	users-permissions	userspermissions	getadvancedsettings	f		2
108	settings-manager	settingsmanager	updatedatabase	f		2
118	upload	upload	destroy	f		2
128	users-permissions	user	findone	f		2
138	users-permissions	userspermissions	getrole	f		2
148	users-permissions	userspermissions	updateadvancedsettings	f		2
109	settings-manager	settingsmanager	deletedatabase	f		2
119	upload	upload	search	f		2
129	users-permissions	user	create	f		2
139	users-permissions	userspermissions	getroles	f		2
149	users-permissions	userspermissions	getproviders	f		2
110	settings-manager	settingsmanager	autoreload	t		2
120	users-permissions	auth	callback	f		2
130	users-permissions	user	update	f		2
140	users-permissions	userspermissions	getroutes	f		2
150	users-permissions	userspermissions	updateproviders	f		2
298	application	competence	find	t		1
299	application	competence	findone	t		1
163	content-type-builder	contenttypebuilder	createmodel	f		3
171	email	email	updatesettings	f		3
168	email	email	send	f		3
173	settings-manager	settingsmanager	environments	f		3
181	settings-manager	settingsmanager	deletelanguage	f		3
183	settings-manager	settingsmanager	updatedatabase	f		3
184	settings-manager	settingsmanager	deletedatabase	f		3
185	settings-manager	settingsmanager	autoreload	t		3
178	settings-manager	settingsmanager	get	f		3
182	settings-manager	settingsmanager	createdatabase	f		3
175	settings-manager	settingsmanager	databases	f		3
174	settings-manager	settingsmanager	languages	f		3
186	upload	upload	upload	f		3
194	upload	upload	search	f		3
191	upload	upload	findone	f		3
192	upload	upload	count	f		3
187	upload	upload	getenvironments	f		3
188	upload	upload	getsettings	f		3
193	upload	upload	destroy	f		3
201	users-permissions	user	find	f		3
202	users-permissions	user	me	t		3
203	users-permissions	user	findone	f		3
204	users-permissions	user	create	f		3
205	users-permissions	user	update	f		3
206	users-permissions	user	destroy	f		3
207	users-permissions	user	destroyall	f		3
215	users-permissions	userspermissions	getroutes	f		3
212	users-permissions	userspermissions	getpolicies	f		3
214	users-permissions	userspermissions	getroles	f		3
213	users-permissions	userspermissions	getrole	f		3
224	users-permissions	userspermissions	getproviders	f		3
221	users-permissions	userspermissions	updateemailtemplate	f		3
223	users-permissions	userspermissions	updateadvancedsettings	f		3
211	users-permissions	userspermissions	getpermissions	f		3
217	users-permissions	userspermissions	init	t		3
208	users-permissions	userspermissions	createrole	f		3
222	users-permissions	userspermissions	getadvancedsettings	f		3
195	users-permissions	auth	callback	t		3
196	users-permissions	auth	changepassword	t		3
197	users-permissions	auth	connect	t		3
198	users-permissions	auth	forgotpassword	t		3
300	application	competence	count	t		1
301	application	competence	create	t		1
302	application	competence	update	t		1
303	application	competence	find	f		2
304	application	competence	destroy	t		1
305	application	competence	findone	f		2
306	application	competence	count	f		2
307	application	competence	destroy	f		2
308	application	competence	update	f		2
310	application	competence	create	f		2
334	application	fieldofstudy	find	t		1
335	application	fieldofstudy	findone	t		1
336	application	fieldofstudy	count	t		1
337	application	fieldofstudy	create	t		1
338	application	fieldofstudy	destroy	t		1
339	application	fieldofstudy	find	f		2
340	application	fieldofstudy	findone	f		2
341	application	fieldofstudy	count	f		2
342	application	fieldofstudy	create	f		2
343	application	fieldofstudy	update	t		1
344	application	fieldofstudy	update	f		2
345	application	fieldofstudy	destroy	f		2
352	application	academicdegree	find	t		1
353	application	academicdegree	findone	t		1
354	application	academicdegree	count	t		1
355	application	academicdegree	create	t		1
356	application	academicdegree	update	t		1
357	application	academicdegree	destroy	t		1
358	application	academicdegree	find	f		2
359	application	academicdegree	findone	f		2
360	application	academicdegree	count	f		2
361	application	academicdegree	create	f		2
365	application	academicdegree	update	f		2
367	application	academicdegree	destroy	f		2
370	application	school	find	t		1
371	application	school	findone	t		1
372	application	school	count	t		1
373	application	school	create	t		1
374	application	school	update	t		1
375	application	school	destroy	t		1
376	application	school	find	f		2
377	application	school	findone	f		2
378	application	school	count	f		2
379	application	school	create	f		2
380	application	school	destroy	f		2
381	application	school	update	f		2
388	application	organization	find	t		1
389	application	organization	findone	t		1
390	application	organization	count	t		1
392	application	organization	update	t		1
391	application	organization	create	t		1
393	application	organization	destroy	t		1
394	application	organization	find	f		2
395	application	organization	findone	f		2
396	application	organization	create	f		2
397	application	organization	count	f		2
398	application	organization	update	f		2
399	application	organization	destroy	f		2
154	content-manager	contentmanager	findone	f		3
160	content-type-builder	contenttypebuilder	getmodels	f		3
164	content-type-builder	contenttypebuilder	updatemodel	f		3
162	content-type-builder	contenttypebuilder	getconnections	f		3
165	content-type-builder	contenttypebuilder	deletemodel	f		3
167	content-type-builder	contenttypebuilder	checktableexists	f		3
169	email	email	getenvironments	f		3
170	email	email	getsettings	f		3
179	settings-manager	settingsmanager	update	f		3
180	settings-manager	settingsmanager	createlanguage	f		3
189	upload	upload	updatesettings	f		3
190	upload	upload	find	f		3
220	users-permissions	userspermissions	getemailtemplate	f		3
218	users-permissions	userspermissions	searchusers	f		3
210	users-permissions	userspermissions	deleterole	f		3
209	users-permissions	userspermissions	deleteprovider	f		3
219	users-permissions	userspermissions	updaterole	f		3
199	users-permissions	auth	register	t		3
200	users-permissions	auth	emailconfirmation	t		3
346	application	fieldofstudy	find	t		3
347	application	fieldofstudy	findone	t		3
348	application	fieldofstudy	count	t		3
350	application	fieldofstudy	update	f		3
351	application	fieldofstudy	destroy	f		3
362	application	academicdegree	find	t		3
363	application	academicdegree	findone	t		3
364	application	academicdegree	count	t		3
368	application	academicdegree	update	f		3
369	application	academicdegree	destroy	f		3
366	application	academicdegree	create	f		3
384	application	school	count	t		3
385	application	school	create	f		3
386	application	school	update	f		3
387	application	school	destroy	f		3
309	application	competence	find	t		3
311	application	competence	findone	t		3
312	application	competence	count	t		3
313	application	competence	create	f		3
314	application	competence	update	f		3
315	application	competence	destroy	f		3
400	application	organization	find	t		3
406	application	competencedegreelink	find	t		1
407	application	competencedegreelink	findone	t		1
408	application	competencedegreelink	count	t		1
409	application	competencedegreelink	create	t		1
410	application	competencedegreelink	update	t		1
411	application	competencedegreelink	destroy	t		1
412	application	competencedegreelink	find	f		2
413	application	competencedegreelink	findone	f		2
414	application	competencedegreelink	count	f		2
415	application	competencedegreelink	create	f		2
416	application	competencedegreelink	update	f		2
417	application	competencedegreelink	destroy	f		2
424	application	nqf	find	t		1
425	application	nqf	findone	t		1
426	application	nqf	count	t		1
427	application	nqf	create	t		1
428	application	nqf	update	t		1
429	application	nqf	destroy	t		1
430	application	nqf	find	f		2
431	application	nqf	findone	f		2
432	application	nqf	count	f		2
433	application	nqf	create	f		2
434	application	nqf	update	f		2
435	application	nqf	destroy	f		2
156	content-manager	contentmanager	update	f		3
151	content-manager	contentmanager	models	f		3
157	content-manager	contentmanager	updatesettings	f		3
158	content-manager	contentmanager	delete	f		3
153	content-manager	contentmanager	count	f		3
159	content-manager	contentmanager	deleteall	f		3
155	content-manager	contentmanager	create	f		3
161	content-type-builder	contenttypebuilder	getmodel	f		3
152	content-manager	contentmanager	find	f		3
166	content-type-builder	contenttypebuilder	autoreload	t		3
177	settings-manager	settingsmanager	databasemodel	f		3
176	settings-manager	settingsmanager	database	f		3
172	settings-manager	settingsmanager	menu	f		3
216	users-permissions	userspermissions	index	f		3
225	users-permissions	userspermissions	updateproviders	f		3
349	application	fieldofstudy	create	f		3
382	application	school	find	t		3
383	application	school	findone	t		3
401	application	organization	findone	t		3
402	application	organization	count	t		3
403	application	organization	create	f		3
404	application	organization	update	f		3
405	application	organization	destroy	f		3
418	application	competencedegreelink	find	t		3
419	application	competencedegreelink	findone	t		3
420	application	competencedegreelink	count	t		3
421	application	competencedegreelink	create	f		3
422	application	competencedegreelink	update	f		3
423	application	competencedegreelink	destroy	f		3
436	application	nqf	find	t		3
437	application	nqf	findone	t		3
438	application	nqf	count	t		3
439	application	nqf	create	f		3
440	application	nqf	update	f		3
441	application	nqf	destroy	f		3
\.


--
-- Data for Name: users-permissions_role; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."users-permissions_role" (id, name, description, type) FROM stdin;
1	Administrator	These users have all access in the project.	root
2	Authenticated	Default role given to authenticated user.	authenticated
3	Public	Default role given to unauthenticated user.	public
\.


--
-- Data for Name: users-permissions_user; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."users-permissions_user" (id, username, email, provider, password, "resetPasswordToken", confirmed, blocked, role) FROM stdin;
1	partioadmin	partioadmin@test.com	local	$2a$10$GyNt7aGazWI1db8xhK27Y.lfiBYD/K1n.tKqo1uumx6r3CRxPnkX.	\N	t	\N	1
\.


--
-- Name: academicdegrees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.academicdegrees_id_seq', 1, false);


--
-- Name: academies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.academies_id_seq', 2, true);


--
-- Name: competence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.competence_id_seq', 1, false);


--
-- Name: competencedegreelinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.competencedegreelinks_id_seq', 1, false);


--
-- Name: core_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.core_store_id_seq', 23, true);


--
-- Name: examinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.examinations_id_seq', 1, true);


--
-- Name: fieldofstudies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.fieldofstudies_id_seq', 13, true);


--
-- Name: nqfs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.nqfs_id_seq', 1, true);


--
-- Name: organizationeducations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.organizationeducations_id_seq', 2, true);


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.organizations_id_seq', 8, true);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.schools_id_seq', 5, true);


--
-- Name: upload_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.upload_file_id_seq', 9, true);


--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.upload_file_morph_id_seq', 9, true);


--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."users-permissions_permission_id_seq"', 441, true);


--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."users-permissions_role_id_seq"', 3, true);


--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."users-permissions_user_id_seq"', 1, true);


--
-- PostgreSQL database dump complete
--

