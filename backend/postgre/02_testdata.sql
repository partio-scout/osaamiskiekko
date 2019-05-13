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

COPY public.academicdegrees (id, identification, name_en, name_fi, name_swe, description_en, description_fi, description_swe, url, credits, nqf, school, fieldofstudy, created_at, updated_at) FROM stdin;
1	humak-yhteisopedagogi_amk	Yhteisöpedagogi (AMK)_EN	Yhteisöpedagogi (AMK)	\N	\N	Yhteisöpedagogitutkinnosta valmistuu arvostavan kohtaamisen ammattilaisia nuoriso- ja järjestötyöhön sekä yhä moninaisempiin ammatillisiin toimintaympäristöihin yhteiskunnan eri sektoreilla.  Työssä tarvitaan laajaa osaamista ihmisten kasvusta ja kehityksestä, yhteiskunnan rakenteesta ja toiminnasta sekä tietoa kulttuureista ja osallisuudesta. Yhteisöpedagogi (AMK) -tutkinnon voit suorittaa Humakissa kokopäiväisesti päivätoteutuksena tai rajallisen määrän lähijaksoja sisältävinä monimuoto-opintoina.	\N	\N	\N	4	1	1	2019-05-09 10:01:07.693+00	2019-05-09 10:01:07.71+00
\.


--
-- Data for Name: competence; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.competence (id, name_en, description_en, url, name_fi, name_swe, description_fi, description_swe, identification, nqf, credits, organization, created_at, updated_at) FROM stdin;
2	Valmentajakoulutus_EN	\N	\N	Valmentajakoulutus	\N	Valmentaja -koulutuksen käytyään partiojohtaja ymmärtää valmentamisen käsitteen ja osaa soveltaa valmentamisen toimintatapoja ja työkaluja pestissään. Hän ymmärtää partion aluetyön ja lippukuntatuen merkityksen sekä perusteet, ja osaa valmentaa lippukuntia kohti laadukkaampaa partiota. Hän osaa tukea lippukuntatoimijoita pesteissään ja varmistaa, että partion strategia sekä ajankohtaiset teemat nivotuvat osaksi lippukuntatoimintaa. Kouluttautuja osaa tukea ja valmentaa lippukunnan johtajistoa lippukunnan kokonaisuuden johtamisessa, partiokasvatuksen toteuttamisessa, henkilöstöresurssien kehittämisessä, lippukunnan lyhyen ja pitkän tähtäimen suunnittelussa ja erilaisten haasteiden ratkaisemisessa.	\N	\N	3	\N	1	2019-05-09 09:58:26.655+00	2019-05-09 09:58:26.668+00
1	Partiojohtajan peruskoulutus_EN	\N	\N	Partiojohtajan peruskoulutus	\N	Partiojohtaja -peruskoulutus on Suomen Partiolaiset ry:n johtamiskoulutusta. Koulutuksen suorituksesta saatava valtakirja on edellytys tietyissä partiotehtävissä esim. leirinjohtajana toimimiselle. Lähiopetuksen lisäksi kouluttautuja toteuttaa johtamistehtävän, jonka aikana hän johtaa ja ohjaa muita aikuisia tapahtuman tms. toteuttamiseksi. Kouluttautujan tukena johtamistehtävän aikana on aikuinen ohjaaja. Koulutukseen sisältyy maastoyöpyminen, jonka avulla opitaan perusleiritaitoja ja turvallisen maastotoiminnan perusteita. Partiojohtaja -peruskoulutuksen suoritettuaan partiojohtaja osaa perustaidot ja tiedot tapahtuman ja ihmisten johtamisesta, partio-ohjelmasta sekä lippukunnan (paikallisyhdistys) toiminnasta.	\N	partio-johtajan_peruskoulutus	3	\N	1	2019-05-09 09:56:07.855+00	2019-05-09 10:02:50.663+00
\.


--
-- Data for Name: competencedegreelinks; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.competencedegreelinks (id, url, description_fi, description_en, description_swe, competence, academicdegree, created_at, updated_at) FROM stdin;
2	https://wiki.humak.fi/display/OS/AHOT-ohjeet+opiskelijoille	Valmentajakoulutus voidaan hyväksilukea Valmentava työote -opintojaksoon. Hyväksilukuun vaaditaan lisäksi näyttö kokonaisuuden keskeisten asioiden hallinnasta NQF6-tasolla. Jos samalla ei hyväksilueta partionjohtajakoulutusta, hyväksiluku edellyttää myös  toimintaa valmentajan pestissä partiossa.	\N	\N	2	1	2019-05-09 10:02:00.36+00	2019-05-09 10:02:00.375+00
1	https://wiki.humak.fi/display/OS/AHOT-ohjeet+opiskelijoille#	Partiojohtajan peruskoulutus voidaan osittain hyväksilukea Valmentava työote  ja Toimijuuden edistäminen -opintojaksoihin. Opintojaksojen muut osat suoritetaan opintojaksovastaavan antamin tehtävin. 	\N	\N	1	1	2019-05-09 10:01:27.377+00	2019-05-09 10:04:13.328+00
\.


--
-- Data for Name: core_store; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.core_store (id, key, value, type, environment, tag) FROM stdin;
1	db_model_upload_file	{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
2	db_model_academicdegrees	{"identification":{"type":"string"},"name_en":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"model":"nqf"},"school":{"model":"school","via":"academicdegrees"},"fieldofstudy":{"model":"fieldofstudy"},"competencedegreelinks":{"collection":"competencedegreelink","via":"academicdegree","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
3	db_model_schools	{"name_en":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"academicdegrees":{"collection":"academicdegree","via":"school","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
4	db_model_competencedegreelinks	{"url":{"type":"string"},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_swe":{"type":"text"},"competence":{"model":"competence","via":"competencedegreelinks"},"academicdegree":{"model":"academicdegree","via":"competencedegreelinks"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
5	db_model_fieldofstudies	{"name_fi":{"type":"string"},"name_en":{"type":"string"},"name_swe":{"type":"string"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
6	db_model_competence	{"name_en":{"type":"string"},"description_en":{"type":"text"},"url":{"type":"string"},"name_fi":{"type":"string"},"name_swe":{"type":"string"},"description_fi":{"type":"text"},"description_swe":{"type":"text"},"identification":{"type":"string"},"nqf":{"model":"nqf"},"credits":{"type":"integer"},"organization":{"model":"organization","via":"competences"},"competencedegreelinks":{"collection":"competencedegreelink","via":"competence","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
7	db_model_nqfs	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_swe":{"type":"string"},"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
8	db_model_organizations	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_swe":{"type":"string"},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_swe":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"competences":{"collection":"competence","via":"organization","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
9	db_model_core_store	{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}	object	\N	\N
10	db_model_users-permissions_permission	{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}}	object	\N	\N
11	db_model_users-permissions_role	{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}}	object	\N	\N
12	db_model_users-permissions_user	{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}}	object	\N	\N
13	db_model_upload_file_morph	{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"}}	object	\N	\N
15	core_application	{"name":"Default Application","description":"This API is going to be awesome!"}	object		
16	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"comments","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-official","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","redirect_uri":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"}}	object		
17	plugin_email_provider	{"provider":"sendmail","name":"Sendmail","auth":{"sendmail_default_from":{"label":"Sendmail Default From","type":"text"},"sendmail_default_replyto":{"label":"Sendmail Default Reply-To","type":"text"}}}	object	development	
18	plugin_upload_provider	{"provider":"local","name":"Local server","enabled":true,"sizeLimit":1000000}	object	development	
14	plugin_content-manager_schema	{"generalSettings":{"search":true,"filters":true,"bulkActions":true,"pageEntries":10},"models":{"plugins":{"upload":{"file":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true}],"search":true,"collectionName":"upload_file","orm":"bookshelf","bulkActions":true,"info":{"name":"file","description":""},"globalName":"UploadFile","associations":[{"alias":"related","type":"collection","related":["Organization","School"],"nature":"manyMorphToOne","autoPopulate":true,"filter":"field"}],"label":"File","attributes":{"size":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"sha256":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true}},"relations":{"related":{"nature":"manyMorphToOne","related":["Organization","School"],"alias":"related","label":"Related","filter":"field","autoPopulate":true,"type":"collection","displayedAttribute":"id","description":""}},"editDisplay":{"availableFields":{"size":{"label":"Size","type":"string","description":"","name":"size","editable":true,"placeholder":""},"ext":{"label":"Ext","type":"string","description":"","name":"ext","editable":true,"placeholder":""},"sha256":{"label":"Sha256","type":"string","description":"","name":"sha256","editable":true,"placeholder":""},"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"hash":{"label":"Hash","type":"string","description":"","name":"hash","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"public_id":{"label":"Public_id","type":"string","description":"","name":"public_id","editable":true,"placeholder":""},"mime":{"label":"Mime","type":"string","description":"","name":"mime","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","hash","sha256","ext","mime","size","url","provider","public_id"],"relations":[]},"labelPlural":"Files","fields":{"size":{"label":"Size","description":"","type":"string","disabled":false,"name":"size","sortable":true,"searchable":true},"ext":{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true},"sha256":{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"hash":{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"public_id":{"label":"Public_id","description":"","type":"string","disabled":false,"name":"public_id","sortable":true,"searchable":true},"mime":{"label":"Mime","description":"","type":"string","disabled":false,"name":"mime","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UploadFile","sort":"ASC","options":{"timestamps":["created_at","updated_at"]},"connection":"default","defaultSort":"id"}},"users-permissions":{"permission":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true}],"search":true,"collectionName":"users-permissions_permission","orm":"bookshelf","bulkActions":true,"info":{"name":"permission","description":""},"globalName":"UsersPermissionsPermission","associations":[{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"label":"Permission","attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}},"relations":{"role":{"dominant":true,"nature":"manyToOne","model":"role","via":"permissions","alias":"role","plugin":"users-permissions","label":"Role","autoPopulate":true,"type":"model","displayedAttribute":"name","description":""}},"editDisplay":{"availableFields":{"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""},"controller":{"label":"Controller","type":"string","description":"","name":"controller","editable":true,"placeholder":""},"action":{"label":"Action","type":"string","description":"","name":"action","editable":true,"placeholder":""},"enabled":{"label":"Enabled","type":"boolean","description":"","name":"enabled","editable":true,"placeholder":""},"policy":{"label":"Policy","type":"string","description":"","name":"policy","editable":true,"placeholder":""}},"displayedField":"id","fields":["type","controller","action","enabled","policy"],"relations":["role"]},"labelPlural":"Permissions","fields":{"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},"controller":{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},"action":{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},"enabled":{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true},"policy":{"label":"Policy","description":"","type":"string","disabled":false,"name":"policy","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UsersPermissionsPermission","sort":"ASC","options":{"timestamps":false},"connection":"default","defaultSort":"id"},"role":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}],"search":true,"collectionName":"users-permissions_role","orm":"bookshelf","bulkActions":true,"info":{"name":"role","description":""},"globalName":"UsersPermissionsRole","associations":[{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"},{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"label":"Role","attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}},"relations":{"permissions":{"dominant":true,"nature":"oneToMany","via":"role","alias":"permissions","plugin":"users-permissions","label":"Permissions","autoPopulate":true,"type":"collection","displayedAttribute":"type","description":"","collection":"permission"},"users":{"dominant":true,"nature":"oneToMany","via":"role","alias":"users","plugin":"users-permissions","label":"Users","autoPopulate":true,"type":"collection","displayedAttribute":"username","description":"","collection":"user"}},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"string","description":"","name":"description","editable":true,"placeholder":""},"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","type"],"relations":["permissions","users"]},"labelPlural":"Roles","fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UsersPermissionsRole","sort":"ASC","options":{"timestamps":false},"connection":"default","defaultSort":"id"},"user":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true}],"search":true,"collectionName":"users-permissions_user","orm":"bookshelf","bulkActions":true,"info":{"name":"user","description":""},"globalName":"UsersPermissionsUser","associations":[{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"label":"User","attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}},"relations":{"role":{"dominant":true,"nature":"manyToOne","model":"role","via":"users","alias":"role","plugin":"users-permissions","label":"Role","autoPopulate":true,"type":"model","displayedAttribute":"name","description":""}},"editDisplay":{"availableFields":{"username":{"label":"Username","type":"string","description":"","name":"username","editable":true,"placeholder":""},"email":{"label":"Email","type":"email","description":"","name":"email","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"password":{"label":"Password","type":"password","description":"","name":"password","editable":true,"placeholder":""},"confirmed":{"label":"Confirmed","type":"boolean","description":"","name":"confirmed","editable":true,"placeholder":""},"blocked":{"label":"Blocked","type":"boolean","description":"","name":"blocked","editable":true,"placeholder":""}},"displayedField":"id","fields":["username","email","provider","password","confirmed","blocked"],"relations":["role"]},"labelPlural":"Users","fields":{"username":{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},"email":{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"password":{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true},"confirmed":{"label":"Confirmed","description":"","type":"boolean","disabled":false,"name":"confirmed","sortable":true,"searchable":true},"blocked":{"label":"Blocked","description":"","type":"boolean","disabled":false,"name":"blocked","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UsersPermissionsUser","sort":"ASC","options":{"timestamps":false},"connection":"default","defaultSort":"id"}}},"academicdegree":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true}],"search":true,"collectionName":"academicdegrees","orm":"bookshelf","bulkActions":true,"info":{"name":"academicdegree","description":"Oppilaitosten tutkinnot"},"globalName":"Academicdegree","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"school","type":"model","model":"school","via":"academicdegrees","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"fieldofstudy","type":"model","model":"fieldofstudy","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"Academicdegree","attributes":{"nqf":{"model":"nqf"},"competencedegreelinks":{"collection":"competencedegreelink","via":"academicdegree","isVirtual":true},"description_fi":{"type":"text"},"description_en":{"type":"text"},"name_swe":{"type":"string"},"identification":{"type":"string"},"url":{"type":"string"},"school":{"model":"school","via":"academicdegrees"},"name_fi":{"type":"string"},"fieldofstudy":{"model":"fieldofstudy"},"credits":{"type":"integer"},"name_en":{"type":"string"},"description_swe":{"type":"text"}},"relations":{"nqf":{"dominant":true,"nature":"oneWay","model":"nqf","alias":"nqf","label":"Nqf","autoPopulate":true,"type":"model","displayedAttribute":"name_en","description":""},"school":{"dominant":true,"nature":"manyToOne","model":"school","via":"academicdegrees","alias":"school","label":"School","autoPopulate":true,"type":"model","displayedAttribute":"name_en","description":""},"fieldofstudy":{"dominant":true,"nature":"oneWay","model":"fieldofstudy","alias":"fieldofstudy","label":"Fieldofstudy","autoPopulate":true,"type":"model","displayedAttribute":"name_fi","description":""},"competencedegreelinks":{"dominant":true,"nature":"oneToMany","via":"academicdegree","alias":"competencedegreelinks","label":"Competencedegreelinks","autoPopulate":true,"type":"collection","displayedAttribute":"url","description":"","collection":"competencedegreelink"}},"editDisplay":{"availableFields":{"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""}},"displayedField":"id","fields":["identification","name_en","name_fi","name_swe","description_en","description_fi","description_swe","url","credits"],"relations":["nqf","school","fieldofstudy","competencedegreelinks"]},"labelPlural":"Academicdegrees","fields":{"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Academicdegree","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"competence":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true}],"search":true,"collectionName":"competence","orm":"bookshelf","bulkActions":true,"info":{"name":"competence","description":"Järjestön koulutus"},"globalName":"Competence","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"organization","type":"model","model":"organization","via":"competences","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"competence","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"Competence","attributes":{"nqf":{"model":"nqf"},"competencedegreelinks":{"collection":"competencedegreelink","via":"competence","isVirtual":true},"description_fi":{"type":"text"},"description_en":{"type":"text"},"name_swe":{"type":"string"},"identification":{"type":"string"},"url":{"type":"string"},"organization":{"model":"organization","via":"competences"},"name_fi":{"type":"string"},"credits":{"type":"integer"},"name_en":{"type":"string"},"description_swe":{"type":"text"}},"relations":{"nqf":{"dominant":true,"nature":"oneWay","model":"nqf","alias":"nqf","label":"Nqf","autoPopulate":true,"type":"model","displayedAttribute":"name_en","description":""},"organization":{"dominant":true,"nature":"manyToOne","model":"organization","via":"competences","alias":"organization","label":"Organization","autoPopulate":true,"type":"model","displayedAttribute":"name_en","description":""},"competencedegreelinks":{"dominant":true,"nature":"oneToMany","via":"competence","alias":"competencedegreelinks","label":"Competencedegreelinks","autoPopulate":true,"type":"collection","displayedAttribute":"url","description":"","collection":"competencedegreelink"}},"editDisplay":{"availableFields":{"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""}},"displayedField":"id","fields":["identification","__col-md-6__700","name_en","description_en","name_fi","description_fi","name_swe","description_swe","credits","url"],"relations":["nqf","organization","competencedegreelinks"]},"labelPlural":"Competences","fields":{"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Competence","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"competencedegreelink":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true}],"search":true,"collectionName":"competencedegreelinks","orm":"bookshelf","bulkActions":true,"info":{"name":"competencedegreelink","description":"Koulutus tutkinto. "},"globalName":"Competencedegreelink","associations":[{"alias":"competence","type":"model","model":"competence","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"academicdegree","type":"model","model":"academicdegree","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true}],"label":"Competencedegreelink","attributes":{"url":{"type":"string"},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_swe":{"type":"text"},"competence":{"model":"competence","via":"competencedegreelinks"},"academicdegree":{"model":"academicdegree","via":"competencedegreelinks"}},"relations":{"competence":{"dominant":true,"nature":"manyToOne","model":"competence","via":"competencedegreelinks","alias":"competence","label":"Competence","autoPopulate":true,"type":"model","displayedAttribute":"name_en","description":""},"academicdegree":{"dominant":true,"nature":"manyToOne","model":"academicdegree","via":"competencedegreelinks","alias":"academicdegree","label":"Academicdegree","autoPopulate":true,"type":"model","displayedAttribute":"identification","description":""}},"editDisplay":{"availableFields":{"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""}},"displayedField":"id","fields":["description_fi","url","description_en","description_swe"],"relations":["competence","academicdegree"]},"labelPlural":"Competencedegreelinks","fields":{"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Competencedegreelink","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"fieldofstudy":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true}],"search":true,"collectionName":"fieldofstudies","orm":"bookshelf","bulkActions":true,"info":{"name":"fieldofstudy","description":"Ala"},"globalName":"Fieldofstudy","associations":[],"label":"Fieldofstudy","attributes":{"name_fi":{"type":"string"},"name_en":{"type":"string"},"name_swe":{"type":"string"}},"relations":{},"editDisplay":{"availableFields":{"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_fi","name_en","name_swe"],"relations":[]},"labelPlural":"Fieldofstudies","fields":{"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Fieldofstudy","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"nqf":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},{"label":"Level","description":"","type":"enumeration","disabled":false,"name":"level","sortable":true,"searchable":true}],"search":true,"collectionName":"nqfs","orm":"bookshelf","bulkActions":true,"info":{"name":"nqf","description":"NQF taso"},"globalName":"Nqf","associations":[],"label":"Nqf","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_swe":{"type":"string"},"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true}},"relations":{},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"level":{"label":"Level","type":"enumeration","description":"","name":"level","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_swe","level"],"relations":[]},"labelPlural":"Nqfs","fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"level":{"label":"Level","description":"","type":"enumeration","disabled":false,"name":"level","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Nqf","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"organization":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true}],"search":true,"collectionName":"organizations","orm":"bookshelf","bulkActions":true,"info":{"name":"organization","description":"Järjestöt"},"globalName":"Organization","associations":[{"dominant":true,"nature":"oneToManyMorph","model":"file","via":"related","alias":"logo","plugin":"upload","filter":"field","autoPopulate":true,"type":"model"},{"alias":"competences","type":"collection","collection":"competence","via":"organization","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"Organization","attributes":{"logoUrl":{"type":"string"},"description_fi":{"type":"text"},"competences":{"collection":"competence","via":"organization","isVirtual":true},"logo":{"model":"file","via":"related","plugin":"upload"},"description_en":{"type":"text"},"name_swe":{"type":"string"},"url":{"type":"string"},"name_fi":{"type":"string","required":true},"name_en":{"type":"string","required":true},"description_swe":{"type":"text"}},"relations":{"logo":{"dominant":true,"nature":"oneToManyMorph","model":"file","via":"related","alias":"logo","plugin":"upload","label":"Logo","filter":"field","autoPopulate":true,"type":"model","displayedAttribute":"name","description":""},"competences":{"dominant":true,"nature":"oneToMany","via":"organization","alias":"competences","label":"Competences","autoPopulate":true,"type":"collection","displayedAttribute":"name_en","description":"","collection":"competence"}},"editDisplay":{"availableFields":{"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_swe","description_fi","description_en","description_swe","url","logoUrl","logo"],"relations":["competences"]},"labelPlural":"Organizations","fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Organization","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"school":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true}],"search":true,"collectionName":"schools","orm":"bookshelf","bulkActions":true,"info":{"name":"school","description":"Oppilaitokset"},"globalName":"School","associations":[{"dominant":true,"nature":"oneToManyMorph","model":"file","via":"related","alias":"logo","plugin":"upload","filter":"field","autoPopulate":true,"type":"model"},{"alias":"academicdegrees","type":"collection","collection":"academicdegree","via":"school","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"School","attributes":{"academicdegrees":{"collection":"academicdegree","via":"school","isVirtual":true},"logoUrl":{"type":"string"},"description_fi":{"type":"text"},"logo":{"model":"file","via":"related","plugin":"upload"},"description_en":{"type":"text"},"name_swe":{"type":"string"},"url":{"type":"string"},"name_fi":{"type":"string"},"name_en":{"type":"string"},"description_swe":{"type":"text"}},"relations":{"logo":{"dominant":true,"nature":"oneToManyMorph","model":"file","via":"related","alias":"logo","plugin":"upload","label":"Logo","filter":"field","autoPopulate":true,"type":"model","displayedAttribute":"name","description":""},"academicdegrees":{"dominant":true,"nature":"oneToMany","via":"school","alias":"academicdegrees","label":"Academicdegrees","autoPopulate":true,"type":"collection","displayedAttribute":"identification","description":"","collection":"academicdegree"}},"editDisplay":{"availableFields":{"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"name_swe":{"label":"Name_swe","type":"string","description":"","name":"name_swe","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"description_swe":{"label":"Description_swe","type":"text","description":"","name":"description_swe","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_swe","description_en","description_fi","description_swe","url","logoUrl","logo"],"relations":["academicdegrees"]},"labelPlural":"Schools","fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_swe":{"label":"Name_swe","description":"","type":"string","disabled":false,"name":"name_swe","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_swe":{"label":"Description_swe","description":"","type":"text","disabled":false,"name":"description_swe","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"School","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"}},"layout":{"user":{"actions":{"create":"User.create","update":"User.update","destroy":"User.destroy","deleteall":"User.destroyAll"},"attributes":{"username":{"className":"col-md-6"},"email":{"className":"col-md-6"},"resetPasswordToken":{"className":"d-none"},"role":{"className":"d-none"}}},"academicdegree":{"attributes":{}},"competence":{"attributes":{}},"competencedegreelink":{"attributes":{}},"fieldofstudy":{"attributes":{}},"nqf":{"attributes":{}},"organization":{"attributes":{}},"school":{"attributes":{}}}}	object		
19	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"refresh","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"­Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square-o","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object		
20	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_confirmation_redirection":"http://localhost:1337/admin","default_role":"authenticated"}	object		
\.


--
-- Data for Name: fieldofstudies; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.fieldofstudies (id, name_fi, name_en, name_swe, created_at, updated_at) FROM stdin;
1	Humanistinen ja kasvatusala	Humanistinen ja kasvatusala_en	\N	2019-05-09 09:59:54.211+00	2019-05-09 09:59:54.228+00
\.


--
-- Data for Name: nqfs; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.nqfs (id, name_en, name_fi, name_swe, level, created_at, updated_at) FROM stdin;
1	NQF 2	Peruskoulutus	\N	2	2019-05-09 09:56:25.044+00	2019-05-09 09:56:25.06+00
2	NQF 4	Toisen asteen koulutus	\N	4	2019-05-09 09:57:12.741+00	2019-05-09 09:57:12.763+00
3	NQF 5	Erikoisammattitukinnot	\N	5	2019-05-09 09:57:47.742+00	2019-05-09 09:57:47.762+00
4	NQF 6	Alempi korkakoulututkinto	\N	6	2019-05-09 09:58:58.697+00	2019-05-09 09:58:58.72+00
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.organizations (id, name_en, name_fi, name_swe, description_fi, description_en, description_swe, url, "logoUrl", created_at, updated_at) FROM stdin;
1	Suomen Partiolaiset – Finlands Scouter ry	Suomen Partiolaiset – Finlands Scouter ry	\N	\N	\N	\N	https://www.partio.fi	\N	2019-05-09 09:55:05.648+00	2019-05-09 09:55:05.668+00
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.schools (id, name_en, name_fi, name_swe, description_en, description_fi, description_swe, url, "logoUrl", created_at, updated_at) FROM stdin;
1	HUMAK_EN	Humanistinen ammattikorkeakoulu	\N	\N	\N	\N	\N	\N	2019-05-09 09:59:36.683+00	2019-05-09 09:59:36.703+00
\.


--
-- Data for Name: upload_file; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.upload_file (id, name, hash, sha256, ext, mime, size, url, provider, public_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: upload_file_morph; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.upload_file_morph (id, upload_file_id, related_id, related_type, field) FROM stdin;
\.


--
-- Data for Name: users-permissions_permission; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."users-permissions_permission" (id, type, controller, action, enabled, policy, role) FROM stdin;
1	application	academicdegree	find	t		1
2	application	academicdegree	findone	t		1
3	application	academicdegree	count	t		1
4	application	academicdegree	create	t		1
5	application	academicdegree	update	t		1
6	application	academicdegree	destroy	t		1
7	application	competence	find	t		1
8	application	competence	findone	t		1
9	application	competence	count	t		1
10	application	competence	create	t		1
11	application	competence	update	t		1
12	application	competence	destroy	t		1
13	application	competencedegreelink	find	t		1
14	application	competencedegreelink	findone	t		1
15	application	competencedegreelink	count	t		1
16	application	competencedegreelink	create	t		1
17	application	competencedegreelink	update	t		1
18	application	competencedegreelink	destroy	t		1
19	application	fieldofstudy	find	t		1
20	application	fieldofstudy	findone	t		1
21	application	fieldofstudy	count	t		1
22	application	fieldofstudy	create	t		1
23	application	fieldofstudy	update	t		1
24	application	fieldofstudy	destroy	t		1
25	application	nqf	find	t		1
26	application	nqf	findone	t		1
27	application	nqf	count	t		1
28	application	nqf	create	t		1
29	application	nqf	update	t		1
30	application	nqf	destroy	t		1
31	application	organization	find	t		1
32	application	organization	findone	t		1
33	application	organization	count	t		1
34	application	organization	create	t		1
35	application	organization	update	t		1
36	application	organization	destroy	t		1
37	application	school	find	t		1
38	application	school	findone	t		1
39	application	school	count	t		1
40	application	school	create	t		1
41	application	school	update	t		1
42	application	school	destroy	t		1
43	content-manager	contentmanager	models	t		1
44	content-manager	contentmanager	find	t		1
45	content-manager	contentmanager	count	t		1
46	content-manager	contentmanager	findone	t		1
47	content-manager	contentmanager	create	t		1
48	content-manager	contentmanager	update	t		1
49	content-manager	contentmanager	updatesettings	t		1
50	content-manager	contentmanager	delete	t		1
51	content-manager	contentmanager	deleteall	t		1
52	content-type-builder	contenttypebuilder	getmodels	t		1
53	content-type-builder	contenttypebuilder	getmodel	t		1
54	content-type-builder	contenttypebuilder	getconnections	t		1
55	content-type-builder	contenttypebuilder	createmodel	t		1
56	content-type-builder	contenttypebuilder	updatemodel	t		1
57	content-type-builder	contenttypebuilder	deletemodel	t		1
58	content-type-builder	contenttypebuilder	autoreload	t		1
59	content-type-builder	contenttypebuilder	checktableexists	t		1
60	email	email	send	t		1
61	email	email	getenvironments	t		1
62	email	email	getsettings	t		1
63	email	email	updatesettings	t		1
64	settings-manager	settingsmanager	menu	t		1
65	settings-manager	settingsmanager	environments	t		1
66	settings-manager	settingsmanager	languages	t		1
67	settings-manager	settingsmanager	databases	t		1
68	settings-manager	settingsmanager	database	t		1
69	settings-manager	settingsmanager	databasemodel	t		1
70	settings-manager	settingsmanager	get	t		1
71	settings-manager	settingsmanager	update	t		1
72	settings-manager	settingsmanager	createlanguage	t		1
73	settings-manager	settingsmanager	deletelanguage	t		1
74	settings-manager	settingsmanager	createdatabase	t		1
75	settings-manager	settingsmanager	updatedatabase	t		1
76	settings-manager	settingsmanager	deletedatabase	t		1
77	settings-manager	settingsmanager	autoreload	t		1
78	upload	upload	upload	t		1
79	upload	upload	getenvironments	t		1
80	upload	upload	getsettings	t		1
81	upload	upload	updatesettings	t		1
82	upload	upload	find	t		1
83	upload	upload	findone	t		1
84	upload	upload	count	t		1
85	upload	upload	search	t		1
86	upload	upload	destroy	t		1
87	users-permissions	auth	callback	t		1
88	users-permissions	auth	changepassword	t		1
89	users-permissions	auth	connect	t		1
90	users-permissions	auth	forgotpassword	t		1
91	users-permissions	auth	register	t		1
92	users-permissions	auth	emailconfirmation	t		1
93	users-permissions	user	find	t		1
94	users-permissions	user	me	t		1
95	users-permissions	user	findone	t		1
96	users-permissions	user	create	t		1
97	users-permissions	user	update	t		1
98	users-permissions	user	destroy	t		1
99	users-permissions	user	destroyall	t		1
100	users-permissions	userspermissions	createrole	t		1
101	users-permissions	userspermissions	deleteprovider	t		1
102	users-permissions	userspermissions	deleterole	t		1
103	users-permissions	userspermissions	getpermissions	t		1
104	users-permissions	userspermissions	getpolicies	t		1
105	users-permissions	userspermissions	getrole	t		1
106	users-permissions	userspermissions	getroles	t		1
107	users-permissions	userspermissions	getroutes	t		1
117	users-permissions	userspermissions	updateproviders	t		1
123	application	academicdegree	destroy	f		2
133	application	competencedegreelink	create	f		2
139	application	fieldofstudy	create	f		2
152	application	organization	update	f		2
163	content-manager	contentmanager	findone	f		2
172	content-type-builder	contenttypebuilder	createmodel	f		2
185	settings-manager	settingsmanager	database	f		2
195	upload	upload	upload	f		2
207	users-permissions	auth	forgotpassword	f		2
217	users-permissions	userspermissions	createrole	f		2
226	users-permissions	userspermissions	init	t		2
236	application	academicdegree	findone	t		3
246	application	competencedegreelink	find	t		3
259	application	nqf	find	t		3
269	application	organization	update	f		3
279	content-manager	contentmanager	count	f		3
289	content-type-builder	contenttypebuilder	createmodel	f		3
297	email	email	updatesettings	f		3
309	settings-manager	settingsmanager	updatedatabase	f		3
320	upload	upload	search	f		3
331	users-permissions	user	update	f		3
350	users-permissions	userspermissions	getproviders	f		3
342	users-permissions	userspermissions	index	f		3
108	users-permissions	userspermissions	index	t		1
119	application	academicdegree	findone	f		2
132	application	competencedegreelink	count	f		2
142	application	nqf	find	f		2
150	application	organization	count	f		2
160	content-manager	contentmanager	models	f		2
170	content-type-builder	contenttypebuilder	getmodel	f		2
176	content-type-builder	contenttypebuilder	checktableexists	f		2
186	settings-manager	settingsmanager	databasemodel	f		2
193	settings-manager	settingsmanager	deletedatabase	f		2
203	upload	upload	search	f		2
211	users-permissions	user	me	t		2
223	users-permissions	userspermissions	getroles	f		2
233	users-permissions	userspermissions	getproviders	f		2
268	application	organization	create	f		3
247	application	competence	count	t		3
257	application	fieldofstudy	update	f		3
278	content-manager	contentmanager	find	f		3
288	content-type-builder	contenttypebuilder	getconnections	f		3
308	settings-manager	settingsmanager	createdatabase	f		3
298	settings-manager	settingsmanager	menu	f		3
319	upload	upload	destroy	f		3
328	users-permissions	user	me	t		3
334	users-permissions	userspermissions	createrole	f		3
345	users-permissions	userspermissions	updaterole	f		3
109	users-permissions	userspermissions	init	t		1
121	application	academicdegree	create	f		2
130	application	competencedegreelink	find	f		2
140	application	fieldofstudy	update	f		2
153	application	organization	destroy	f		2
161	content-manager	contentmanager	find	f		2
173	content-type-builder	contenttypebuilder	updatemodel	f		2
183	settings-manager	settingsmanager	languages	f		2
196	upload	upload	getenvironments	f		2
206	users-permissions	auth	connect	t		2
216	users-permissions	user	destroyall	f		2
225	users-permissions	userspermissions	index	f		2
235	application	academicdegree	find	t		3
267	application	organization	count	t		3
244	application	competence	update	f		3
256	application	fieldofstudy	create	f		3
277	content-manager	contentmanager	models	f		3
287	content-type-builder	contenttypebuilder	getmodel	f		3
299	settings-manager	settingsmanager	environments	f		3
307	settings-manager	settingsmanager	deletelanguage	f		3
317	upload	upload	findone	f		3
329	users-permissions	user	findone	f		3
339	users-permissions	userspermissions	getrole	f		3
349	users-permissions	userspermissions	updateadvancedsettings	f		3
110	users-permissions	userspermissions	searchusers	t		1
120	application	academicdegree	count	f		2
131	application	competencedegreelink	findone	f		2
141	application	fieldofstudy	destroy	f		2
149	application	organization	findone	f		2
159	application	school	destroy	f		2
165	content-manager	contentmanager	update	f		2
175	content-type-builder	contenttypebuilder	autoreload	t		2
182	settings-manager	settingsmanager	environments	f		2
192	settings-manager	settingsmanager	updatedatabase	f		2
199	upload	upload	find	f		2
209	users-permissions	auth	emailconfirmation	f		2
221	users-permissions	userspermissions	getpolicies	f		2
231	users-permissions	userspermissions	getadvancedsettings	f		2
252	application	competencedegreelink	destroy	f		3
262	application	nqf	create	f		3
241	application	competence	find	t		3
271	application	school	find	t		3
281	content-manager	contentmanager	create	f		3
294	email	email	send	f		3
302	settings-manager	settingsmanager	database	f		3
312	upload	upload	upload	f		3
344	users-permissions	userspermissions	searchusers	f		3
338	users-permissions	userspermissions	getpolicies	f		3
323	users-permissions	auth	connect	t		3
111	users-permissions	userspermissions	updaterole	t		1
118	application	academicdegree	find	f		2
128	application	competence	update	f		2
138	application	fieldofstudy	count	f		2
144	application	nqf	count	f		2
154	application	school	find	f		2
164	content-manager	contentmanager	create	f		2
171	content-type-builder	contenttypebuilder	getconnections	f		2
181	settings-manager	settingsmanager	menu	f		2
188	settings-manager	settingsmanager	update	f		2
198	upload	upload	updatesettings	f		2
208	users-permissions	auth	register	f		2
218	users-permissions	userspermissions	deleteprovider	f		2
228	users-permissions	userspermissions	updaterole	f		2
238	application	academicdegree	create	f		3
265	application	organization	find	t		3
245	application	competence	destroy	f		3
258	application	fieldofstudy	destroy	f		3
275	application	school	update	f		3
285	content-manager	contentmanager	deleteall	f		3
295	email	email	getenvironments	f		3
301	settings-manager	settingsmanager	databases	f		3
316	upload	upload	find	f		3
347	users-permissions	userspermissions	updateemailtemplate	f		3
337	users-permissions	userspermissions	getpermissions	f		3
324	users-permissions	auth	forgotpassword	t		3
112	users-permissions	userspermissions	getemailtemplate	t		1
122	application	academicdegree	update	f		2
129	application	competence	destroy	f		2
143	application	nqf	findone	f		2
151	application	organization	create	f		2
162	content-manager	contentmanager	count	f		2
174	content-type-builder	contenttypebuilder	deletemodel	f		2
184	settings-manager	settingsmanager	databases	f		2
197	upload	upload	getsettings	f		2
205	users-permissions	auth	changepassword	f		2
215	users-permissions	user	destroy	f		2
227	users-permissions	userspermissions	searchusers	f		2
237	application	academicdegree	count	t		3
248	application	competencedegreelink	findone	t		3
264	application	nqf	destroy	f		3
254	application	fieldofstudy	findone	t		3
273	application	school	count	t		3
283	content-manager	contentmanager	updatesettings	f		3
291	content-type-builder	contenttypebuilder	deletemodel	f		3
304	settings-manager	settingsmanager	get	f		3
315	upload	upload	updatesettings	f		3
332	users-permissions	user	destroy	f		3
340	users-permissions	userspermissions	getroles	f		3
351	users-permissions	userspermissions	updateproviders	f		3
322	users-permissions	auth	changepassword	t		3
113	users-permissions	userspermissions	updateemailtemplate	t		1
125	application	competence	findone	f		2
135	application	competencedegreelink	destroy	f		2
147	application	nqf	destroy	f		2
158	application	school	update	f		2
166	content-manager	contentmanager	updatesettings	f		2
177	email	email	getenvironments	f		2
187	settings-manager	settingsmanager	get	f		2
194	settings-manager	settingsmanager	autoreload	t		2
204	users-permissions	auth	callback	f		2
214	users-permissions	user	update	f		2
219	users-permissions	userspermissions	deleterole	f		2
229	users-permissions	userspermissions	getemailtemplate	f		2
239	application	academicdegree	update	f		3
249	application	competencedegreelink	count	t		3
266	application	organization	findone	t		3
255	application	fieldofstudy	count	t		3
276	application	school	destroy	f		3
286	content-type-builder	contenttypebuilder	getmodels	f		3
310	settings-manager	settingsmanager	deletedatabase	f		3
300	settings-manager	settingsmanager	languages	f		3
318	upload	upload	count	f		3
327	users-permissions	user	find	f		3
333	users-permissions	user	destroyall	f		3
343	users-permissions	userspermissions	init	t		3
114	users-permissions	userspermissions	getadvancedsettings	t		1
127	application	competence	create	f		2
134	application	competencedegreelink	update	f		2
146	application	nqf	update	f		2
155	application	school	findone	f		2
167	content-manager	contentmanager	delete	f		2
179	email	email	getsettings	f		2
189	settings-manager	settingsmanager	createlanguage	f		2
200	upload	upload	findone	f		2
210	users-permissions	user	find	f		2
220	users-permissions	userspermissions	getpermissions	f		2
230	users-permissions	userspermissions	updateemailtemplate	f		2
240	application	academicdegree	destroy	f		3
250	application	competencedegreelink	create	f		3
260	application	nqf	findone	t		3
270	application	organization	destroy	f		3
280	content-manager	contentmanager	findone	f		3
290	content-type-builder	contenttypebuilder	updatemodel	f		3
296	email	email	getsettings	f		3
311	settings-manager	settingsmanager	autoreload	t		3
306	settings-manager	settingsmanager	createlanguage	f		3
330	users-permissions	user	create	f		3
341	users-permissions	userspermissions	getroutes	f		3
321	users-permissions	auth	callback	t		3
115	users-permissions	userspermissions	updateadvancedsettings	t		1
126	application	competence	count	f		2
136	application	fieldofstudy	find	f		2
148	application	organization	find	f		2
156	application	school	count	f		2
169	content-type-builder	contenttypebuilder	getmodels	f		2
178	email	email	send	f		2
190	settings-manager	settingsmanager	deletelanguage	f		2
202	upload	upload	destroy	f		2
212	users-permissions	user	findone	f		2
222	users-permissions	userspermissions	getrole	f		2
232	users-permissions	userspermissions	updateadvancedsettings	f		2
251	application	competencedegreelink	update	f		3
261	application	nqf	count	t		3
242	application	competence	findone	t		3
272	application	school	findone	t		3
282	content-manager	contentmanager	update	f		3
293	content-type-builder	contenttypebuilder	checktableexists	f		3
303	settings-manager	settingsmanager	databasemodel	f		3
314	upload	upload	getsettings	f		3
348	users-permissions	userspermissions	getadvancedsettings	f		3
335	users-permissions	userspermissions	deleteprovider	f		3
326	users-permissions	auth	emailconfirmation	t		3
116	users-permissions	userspermissions	getproviders	t		1
124	application	competence	find	f		2
137	application	fieldofstudy	findone	f		2
145	application	nqf	create	f		2
157	application	school	create	f		2
168	content-manager	contentmanager	deleteall	f		2
180	email	email	updatesettings	f		2
191	settings-manager	settingsmanager	createdatabase	f		2
201	upload	upload	count	f		2
213	users-permissions	user	create	f		2
224	users-permissions	userspermissions	getroutes	f		2
234	users-permissions	userspermissions	updateproviders	f		2
263	application	nqf	update	f		3
243	application	competence	create	f		3
253	application	fieldofstudy	find	t		3
274	application	school	create	f		3
284	content-manager	contentmanager	delete	f		3
292	content-type-builder	contenttypebuilder	autoreload	t		3
305	settings-manager	settingsmanager	update	f		3
313	upload	upload	getenvironments	f		3
346	users-permissions	userspermissions	getemailtemplate	f		3
336	users-permissions	userspermissions	deleterole	f		3
325	users-permissions	auth	register	t		3
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
1	partioadmin	esko.rikkonen@eficode.com	local	$2a$10$mCPqi.PHTWwp1lXx.wOliu3FjyBZ8VCeSfp.dqBFP4aF0C1gjvG9O	\N	t	\N	1
\.


--
-- Name: academicdegrees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.academicdegrees_id_seq', 1, true);


--
-- Name: competence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.competence_id_seq', 2, true);


--
-- Name: competencedegreelinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.competencedegreelinks_id_seq', 2, true);


--
-- Name: core_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.core_store_id_seq', 20, true);


--
-- Name: fieldofstudies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.fieldofstudies_id_seq', 1, true);


--
-- Name: nqfs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.nqfs_id_seq', 4, true);


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.organizations_id_seq', 1, true);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.schools_id_seq', 1, true);


--
-- Name: upload_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.upload_file_id_seq', 1, false);


--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.upload_file_morph_id_seq', 1, false);


--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."users-permissions_permission_id_seq"', 351, true);


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

