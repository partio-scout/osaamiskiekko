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

COPY public.academicdegrees (id, identification, name_en, name_fi, name_sv, description_en, description_fi, description_sv, url, credits, nqf, school, fieldofstudy, created_at, updated_at) FROM stdin;
1	humak-yhteisopedagogi_amk	Yhteisöpedagogi (AMK)_EN	Yhteisöpedagogi (AMK)	Yhteisöpedagogi (AMK)_sv	Yhteisöpedagogitutkinnosta valmistuu arvostavan kohtaamisen ammattilaisia nuoriso- ja järjestötyöhön sekä yhä moninaisempiin ammatillisiin toimintaympäristöihin yhteiskunnan eri sektoreilla.  Työssä tarvitaan laajaa osaamista ihmisten kasvusta ja kehityksestä, yhteiskunnan rakenteesta ja toiminnasta sekä tietoa kulttuureista ja osallisuudesta. Yhteisöpedagogi (AMK) -tutkinnon voit suorittaa Humakissa kokopäiväisesti päivätoteutuksena tai rajallisen määrän lähijaksoja sisältävinä monimuoto-opintoina._en	Yhteisöpedagogitutkinnosta valmistuu arvostavan kohtaamisen ammattilaisia nuoriso- ja järjestötyöhön sekä yhä moninaisempiin ammatillisiin toimintaympäristöihin yhteiskunnan eri sektoreilla.  Työssä tarvitaan laajaa osaamista ihmisten kasvusta ja kehityksestä, yhteiskunnan rakenteesta ja toiminnasta sekä tietoa kulttuureista ja osallisuudesta. Yhteisöpedagogi (AMK) -tutkinnon voit suorittaa Humakissa kokopäiväisesti päivätoteutuksena tai rajallisen määrän lähijaksoja sisältävinä monimuoto-opintoina.	Yhteisöpedagogitutkinnosta valmistuu arvostavan kohtaamisen ammattilaisia nuoriso- ja järjestötyöhön sekä yhä moninaisempiin ammatillisiin toimintaympäristöihin yhteiskunnan eri sektoreilla.  Työssä tarvitaan laajaa osaamista ihmisten kasvusta ja kehityksestä, yhteiskunnan rakenteesta ja toiminnasta sekä tietoa kulttuureista ja osallisuudesta. Yhteisöpedagogi (AMK) -tutkinnon voit suorittaa Humakissa kokopäiväisesti päivätoteutuksena tai rajallisen määrän lähijaksoja sisältävinä monimuoto-opintoina._en	\N	\N	4	1	1	2019-05-09 10:01:07.693+00	2019-05-15 12:46:03.55+00
2	laurea-amk-liiketalous	Service Business Management	Liiketalouden koulutus	Service Business Management	Students of business management need the right attitude and ambition to get ahead in their career as well as the drive to develop both in Finland and internationally.	Valmistuttuaan tradenomit osaavat myydä ja markkinoida, kehittää palveluita, verkostoitua sekä hoitaa taloushallinnon tehtäviä.	Studerande i företagsledningen behöver rätt attityd och ambition att gå vidare i sin karriär samt att utveckla både i Finland och internationellt.	https://www.laurea.fi/koulutus/liiketalous-ja-tietojenkasittely/liiketalous-amk/	210	4	6	3	2019-05-16 08:27:50.932+00	2019-05-16 08:30:08.646+00
\.


--
-- Data for Name: competence; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.competence (id, identification, name_en, description_en, url, name_fi, name_sv, description_fi, description_sv, nqf, credits, organization, created_at, updated_at) FROM stdin;
2	partio-valmentajakoulutus	Valmentajakoulutus_EN	Valmentaja -koulutuksen käytyään partiojohtaja ymmärtää valmentamisen käsitteen ja osaa soveltaa valmentamisen toimintatapoja ja työkaluja pestissään. Hän ymmärtää partion aluetyön ja lippukuntatuen merkityksen sekä perusteet, ja osaa valmentaa lippukuntia kohti laadukkaampaa partiota. Hän osaa tukea lippukuntatoimijoita pesteissään ja varmistaa, että partion strategia sekä ajankohtaiset teemat nivotuvat osaksi lippukuntatoimintaa. Kouluttautuja osaa tukea ja valmentaa lippukunnan johtajistoa lippukunnan kokonaisuuden johtamisessa, partiokasvatuksen toteuttamisessa, henkilöstöresurssien kehittämisessä, lippukunnan lyhyen ja pitkän tähtäimen suunnittelussa ja erilaisten haasteiden ratkaisemisessa._en	\N	Valmentajakoulutus	Valmentajakoulutus_sv	Valmentaja -koulutuksen käytyään partiojohtaja ymmärtää valmentamisen käsitteen ja osaa soveltaa valmentamisen toimintatapoja ja työkaluja pestissään. Hän ymmärtää partion aluetyön ja lippukuntatuen merkityksen sekä perusteet, ja osaa valmentaa lippukuntia kohti laadukkaampaa partiota. Hän osaa tukea lippukuntatoimijoita pesteissään ja varmistaa, että partion strategia sekä ajankohtaiset teemat nivotuvat osaksi lippukuntatoimintaa. Kouluttautuja osaa tukea ja valmentaa lippukunnan johtajistoa lippukunnan kokonaisuuden johtamisessa, partiokasvatuksen toteuttamisessa, henkilöstöresurssien kehittämisessä, lippukunnan lyhyen ja pitkän tähtäimen suunnittelussa ja erilaisten haasteiden ratkaisemisessa.	Valmentaja -koulutuksen käytyään partiojohtaja ymmärtää valmentamisen käsitteen ja osaa soveltaa valmentamisen toimintatapoja ja työkaluja pestissään. Hän ymmärtää partion aluetyön ja lippukuntatuen merkityksen sekä perusteet, ja osaa valmentaa lippukuntia kohti laadukkaampaa partiota. Hän osaa tukea lippukuntatoimijoita pesteissään ja varmistaa, että partion strategia sekä ajankohtaiset teemat nivotuvat osaksi lippukuntatoimintaa. Kouluttautuja osaa tukea ja valmentaa lippukunnan johtajistoa lippukunnan kokonaisuuden johtamisessa, partiokasvatuksen toteuttamisessa, henkilöstöresurssien kehittämisessä, lippukunnan lyhyen ja pitkän tähtäimen suunnittelussa ja erilaisten haasteiden ratkaisemisessa._sv	3	\N	\N	2019-05-09 09:58:26.655+00	2019-05-13 09:27:55.567+00
1	partio-johtajan_peruskoulutus	Partiojohtajan peruskoulutus_en	Partiojohtaja -peruskoulutus on Suomen Partiolaiset ry:n johtamiskoulutusta. Koulutuksen suorituksesta saatava valtakirja on edellytys tietyissä partiotehtävissä esim. leirinjohtajana toimimiselle. Lähiopetuksen lisäksi kouluttautuja toteuttaa johtamistehtävän, jonka aikana hän johtaa ja ohjaa muita aikuisia tapahtuman tms. toteuttamiseksi. Kouluttautujan tukena johtamistehtävän aikana on aikuinen ohjaaja. Koulutukseen sisältyy maastoyöpyminen, jonka avulla opitaan perusleiritaitoja ja turvallisen maastotoiminnan perusteita. Partiojohtaja -peruskoulutuksen suoritettuaan partiojohtaja osaa perustaidot ja tiedot tapahtuman ja ihmisten johtamisesta, partio-ohjelmasta sekä lippukunnan (paikallisyhdistys) toiminnasta._en	\N	Partiojohtajan peruskoulutus	Partiojohtajan peruskoulutus_sv	Partiojohtaja -peruskoulutus on Suomen Partiolaiset ry:n johtamiskoulutusta. Koulutuksen suorituksesta saatava valtakirja on edellytys tietyissä partiotehtävissä esim. leirinjohtajana toimimiselle. Lähiopetuksen lisäksi kouluttautuja toteuttaa johtamistehtävän, jonka aikana hän johtaa ja ohjaa muita aikuisia tapahtuman tms. toteuttamiseksi. Kouluttautujan tukena johtamistehtävän aikana on aikuinen ohjaaja. Koulutukseen sisältyy maastoyöpyminen, jonka avulla opitaan perusleiritaitoja ja turvallisen maastotoiminnan perusteita. Partiojohtaja -peruskoulutuksen suoritettuaan partiojohtaja osaa perustaidot ja tiedot tapahtuman ja ihmisten johtamisesta, partio-ohjelmasta sekä lippukunnan (paikallisyhdistys) toiminnasta.	Partiojohtaja -peruskoulutus on Suomen Partiolaiset ry:n johtamiskoulutusta. Koulutuksen suorituksesta saatava valtakirja on edellytys tietyissä partiotehtävissä esim. leirinjohtajana toimimiselle. Lähiopetuksen lisäksi kouluttautuja toteuttaa johtamistehtävän, jonka aikana hän johtaa ja ohjaa muita aikuisia tapahtuman tms. toteuttamiseksi. Kouluttautujan tukena johtamistehtävän aikana on aikuinen ohjaaja. Koulutukseen sisältyy maastoyöpyminen, jonka avulla opitaan perusleiritaitoja ja turvallisen maastotoiminnan perusteita. Partiojohtaja -peruskoulutuksen suoritettuaan partiojohtaja osaa perustaidot ja tiedot tapahtuman ja ihmisten johtamisesta, partio-ohjelmasta sekä lippukunnan (paikallisyhdistys) toiminnasta._sv	3	\N	1	2019-05-09 09:56:07.855+00	2019-05-15 13:25:31.674+00
\.


--
-- Data for Name: competencedegreelinks; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.competencedegreelinks (id, url, description_fi, description_en, description_sv, competence, academicdegree, created_at, updated_at) FROM stdin;
1	https://wiki.humak.fi/display/OS/AHOT-ohjeet+opiskelijoille#	Partiojohtajan peruskoulutus voidaan osittain hyväksilukea Valmentava työote  ja Toimijuuden edistäminen -opintojaksoihin. Opintojaksojen muut osat suoritetaan opintojaksovastaavan antamin tehtävin. 	Partiojohtajan peruskoulutus voidaan osittain hyväksilukea Valmentava työote  ja Toimijuuden edistäminen -opintojaksoihin. Opintojaksojen muut osat suoritetaan opintojaksovastaavan antamin tehtävin. _en	Partiojohtajan peruskoulutus voidaan osittain hyväksilukea Valmentava työote  ja Toimijuuden edistäminen -opintojaksoihin. Opintojaksojen muut osat suoritetaan opintojaksovastaavan antamin tehtävin. _sv	1	1	2019-05-09 10:01:27.377+00	2019-05-28 10:32:51.118+00
2	https://wiki.humak.fi/display/OS/AHOT-ohjeet+opiskelijoille	Valmentajakoulutus voidaan hyväksilukea Valmentava työote -opintojaksoon. Hyväksilukuun vaaditaan lisäksi näyttö kokonaisuuden keskeisten asioiden hallinnasta NQF6-tasolla. Jos samalla ei hyväksilueta partionjohtajakoulutusta, hyväksiluku edellyttää myös  toimintaa valmentajan pestissä partiossa.	Valmentajakoulutus voidaan hyväksilukea Valmentava työote -opintojaksoon. Hyväksilukuun vaaditaan lisäksi näyttö kokonaisuuden keskeisten asioiden hallinnasta NQF6-tasolla. Jos samalla ei hyväksilueta partionjohtajakoulutusta, hyväksiluku edellyttää myös  toimintaa valmentajan pestissä partiossa._en	Valmentajakoulutus voidaan hyväksilukea Valmentava työote -opintojaksoon. Hyväksilukuun vaaditaan lisäksi näyttö kokonaisuuden keskeisten asioiden hallinnasta NQF6-tasolla. Jos samalla ei hyväksilueta partionjohtajakoulutusta, hyväksiluku edellyttää myös  toimintaa valmentajan pestissä partiossa._sv	2	1	2019-05-09 10:02:00.36+00	2019-05-28 10:32:57.382+00
\.


--
-- Data for Name: core_store; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.core_store (id, key, value, type, environment, tag) FROM stdin;
15	core_application	{"name":"Default Application","description":"This API is going to be awesome!"}	object		
16	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"comments","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-official","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","redirect_uri":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"}}	object		
17	plugin_email_provider	{"provider":"sendmail","name":"Sendmail","auth":{"sendmail_default_from":{"label":"Sendmail Default From","type":"text"},"sendmail_default_replyto":{"label":"Sendmail Default Reply-To","type":"text"}}}	object	development	
18	plugin_upload_provider	{"provider":"local","name":"Local server","enabled":true,"sizeLimit":1000000}	object	development	
19	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"refresh","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"­Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square-o","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object		
20	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_confirmation_redirection":"http://localhost:1337/admin","default_role":"authenticated"}	object		
4	db_model_users-permissions_permission	{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}}	object	\N	\N
6	db_model_core_store	{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}	object	\N	\N
8	db_model_users-permissions_user	{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}}	object	\N	\N
13	db_model_upload_file_morph	{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"}}	object	\N	\N
14	plugin_content-manager_schema	{"generalSettings":{"search":true,"filters":true,"bulkActions":true,"pageEntries":10},"models":{"plugins":{"upload":{"file":{"label":"File","labelPlural":"Files","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":["created_at","updated_at"]},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"hash":{"label":"Hash","type":"string","description":"","name":"hash","editable":true,"placeholder":""},"sha256":{"label":"Sha256","type":"string","description":"","name":"sha256","editable":true,"placeholder":""},"ext":{"label":"Ext","type":"string","description":"","name":"ext","editable":true,"placeholder":""},"mime":{"label":"Mime","type":"string","description":"","name":"mime","editable":true,"placeholder":""},"size":{"label":"Size","type":"string","description":"","name":"size","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"public_id":{"label":"Public_id","type":"string","description":"","name":"public_id","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","hash","sha256","ext","mime","size","url","provider","public_id"],"relations":[]},"info":{"name":"file","description":""},"connection":"default","collectionName":"upload_file","attributes":{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false}},"globalId":"UploadFile","globalName":"UploadFile","primaryKey":"id","associations":[{"alias":"related","type":"collection","related":["Organization","School"],"nature":"manyMorphToOne","autoPopulate":true,"filter":"field"}],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"hash":{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},"sha256":{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},"ext":{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true},"mime":{"label":"Mime","description":"","type":"string","disabled":false,"name":"mime","sortable":true,"searchable":true},"size":{"label":"Size","description":"","type":"string","disabled":false,"name":"size","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"public_id":{"label":"Public_id","description":"","type":"string","disabled":false,"name":"public_id","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true}],"relations":{"related":{"alias":"related","type":"collection","related":["Organization","School"],"nature":"manyMorphToOne","autoPopulate":true,"filter":"field","description":"","label":"Related","displayedAttribute":"id"}}}},"users-permissions":{"permission":{"label":"Permission","labelPlural":"Permissions","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""},"controller":{"label":"Controller","type":"string","description":"","name":"controller","editable":true,"placeholder":""},"action":{"label":"Action","type":"string","description":"","name":"action","editable":true,"placeholder":""},"enabled":{"label":"Enabled","type":"boolean","description":"","name":"enabled","editable":true,"placeholder":""},"policy":{"label":"Policy","type":"string","description":"","name":"policy","editable":true,"placeholder":""}},"displayedField":"id","fields":["type","controller","action","enabled","policy"],"relations":["role"]},"info":{"name":"permission","description":""},"connection":"default","collectionName":"users-permissions_permission","attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}},"globalId":"UsersPermissionsPermission","globalName":"UsersPermissionsPermission","primaryKey":"id","associations":[{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},"controller":{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},"action":{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},"enabled":{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true},"policy":{"label":"Policy","description":"","type":"string","disabled":false,"name":"policy","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true}],"relations":{"role":{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}}},"role":{"label":"Role","labelPlural":"Roles","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"string","description":"","name":"description","editable":true,"placeholder":""},"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","type"],"relations":["permissions","users"]},"info":{"name":"role","description":""},"connection":"default","collectionName":"users-permissions_role","attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}},"globalId":"UsersPermissionsRole","globalName":"UsersPermissionsRole","primaryKey":"id","associations":[{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"},{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}],"relations":{"permissions":{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Permissions","displayedAttribute":"type"},"users":{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Users","displayedAttribute":"username"}}},"user":{"label":"User","labelPlural":"Users","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"username":{"label":"Username","type":"string","description":"","name":"username","editable":true,"placeholder":""},"email":{"label":"Email","type":"email","description":"","name":"email","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"password":{"label":"Password","type":"password","description":"","name":"password","editable":true,"placeholder":""},"confirmed":{"label":"Confirmed","type":"boolean","description":"","name":"confirmed","editable":true,"placeholder":""},"blocked":{"label":"Blocked","type":"boolean","description":"","name":"blocked","editable":true,"placeholder":""}},"displayedField":"id","fields":["username","email","provider","password","confirmed","blocked"],"relations":["role"]},"info":{"name":"user","description":""},"connection":"default","collectionName":"users-permissions_user","attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}},"globalId":"UsersPermissionsUser","globalName":"UsersPermissionsUser","primaryKey":"id","associations":[{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"username":{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},"email":{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"password":{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true},"confirmed":{"label":"Confirmed","description":"","type":"boolean","disabled":false,"name":"confirmed","sortable":true,"searchable":true},"blocked":{"label":"Blocked","description":"","type":"boolean","disabled":false,"name":"blocked","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true}],"relations":{"role":{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}}}}},"academicdegree":{"label":"Academicdegree","labelPlural":"Academicdegrees","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""}},"displayedField":"id","fields":["identification","name_en","name_fi","name_sv","description_en","description_fi","description_sv","url","credits"],"relations":["nqf","school","fieldofstudy","competencedegreelinks"]},"info":{"name":"academicdegree","description":"Oppilaitosten tutkinnot"},"connection":"default","collectionName":"academicdegrees","attributes":{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text","required":true},"description_fi":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"model":"nqf"},"school":{"model":"school","via":"academicdegrees"},"fieldofstudy":{"model":"fieldofstudy"},"competencedegreelinks":{"collection":"competencedegreelink","via":"academicdegree","isVirtual":true}},"globalId":"Academicdegree","globalName":"Academicdegree","primaryKey":"id","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"school","type":"model","model":"school","via":"academicdegrees","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"fieldofstudy","type":"model","model":"fieldofstudy","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true}],"fields":{"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}],"relations":{"nqf":{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Nqf","displayedAttribute":"name_en"},"school":{"alias":"school","type":"model","model":"school","via":"academicdegrees","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"School","displayedAttribute":"name_en"},"fieldofstudy":{"alias":"fieldofstudy","type":"model","model":"fieldofstudy","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Fieldofstudy","displayedAttribute":"name_fi"},"competencedegreelinks":{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competencedegreelinks","displayedAttribute":"url"}}},"competence":{"label":"Competence","labelPlural":"Competences","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""}},"displayedField":"id","fields":["identification","name_en","description_en","url","name_fi","name_sv","description_fi","description_sv","credits"],"relations":["nqf","organization","competencedegreelinks"]},"info":{"name":"competence","description":"Järjestön koulutus"},"connection":"default","collectionName":"competence","attributes":{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"description_en":{"type":"text"},"url":{"type":"string"},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"nqf":{"model":"nqf"},"credits":{"type":"integer"},"organization":{"model":"organization","via":"competences"},"competencedegreelinks":{"collection":"competencedegreelink","via":"competence","isVirtual":true}},"globalId":"Competence","globalName":"Competence","primaryKey":"id","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"organization","type":"model","model":"organization","via":"competences","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"competence","nature":"oneToMany","autoPopulate":true,"dominant":true}],"fields":{"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true}],"relations":{"nqf":{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Nqf","displayedAttribute":"name_en"},"organization":{"alias":"organization","type":"model","model":"organization","via":"competences","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Organization","displayedAttribute":"name_en"},"competencedegreelinks":{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"competence","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competencedegreelinks","displayedAttribute":"url"}}},"competencedegreelink":{"label":"Competencedegreelink","labelPlural":"Competencedegreelinks","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""}},"displayedField":"id","fields":["url","description_fi","description_en","description_sv"],"relations":["competence","academicdegree"]},"info":{"name":"competencedegreelink","description":"Koulutus tutkinto. "},"connection":"default","collectionName":"competencedegreelinks","attributes":{"url":{"type":"string"},"description_fi":{"type":"text","required":true},"description_en":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"competence":{"model":"competence","via":"competencedegreelinks"},"academicdegree":{"model":"academicdegree","via":"competencedegreelinks"}},"globalId":"Competencedegreelink","globalName":"Competencedegreelink","primaryKey":"id","associations":[{"alias":"competence","type":"model","model":"competence","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"academicdegree","type":"model","model":"academicdegree","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true}],"fields":{"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true}],"relations":{"competence":{"alias":"competence","type":"model","model":"competence","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Competence","displayedAttribute":"identification"},"academicdegree":{"alias":"academicdegree","type":"model","model":"academicdegree","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Academicdegree","displayedAttribute":"identification"}}},"fieldofstudy":{"label":"Fieldofstudy","labelPlural":"Fieldofstudies","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_fi","name_en","name_sv"],"relations":[]},"info":{"name":"fieldofstudy","description":"Ala"},"connection":"default","collectionName":"fieldofstudies","attributes":{"name_fi":{"type":"string","required":true},"name_en":{"type":"string","required":true},"name_sv":{"type":"string","required":true}},"globalId":"Fieldofstudy","globalName":"Fieldofstudy","primaryKey":"id","associations":[],"fields":{"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}],"relations":{}},"nqf":{"label":"Nqf","labelPlural":"Nqfs","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"level":{"label":"Level","type":"enumeration","description":"","name":"level","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_sv","level"],"relations":[]},"info":{"name":"nqf","description":"NQF taso"},"connection":"default","collectionName":"nqfs","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true}},"globalId":"Nqf","globalName":"Nqf","primaryKey":"id","associations":[],"fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"level":{"label":"Level","description":"","type":"enumeration","disabled":false,"name":"level","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},{"label":"Level","description":"","type":"enumeration","disabled":false,"name":"level","sortable":true,"searchable":true}],"relations":{}},"organization":{"label":"Organization","labelPlural":"Organizations","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false}},"displayedField":"id","fields":["name_en","name_fi","name_sv","description_fi","description_en","description_sv","url","logoUrl","logo"],"relations":["competences"]},"info":{"name":"organization","description":"Järjestöt"},"connection":"default","collectionName":"organizations","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"competences":{"collection":"competence","via":"organization","isVirtual":true}},"globalId":"Organization","globalName":"Organization","primaryKey":"id","associations":[{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field"},{"alias":"competences","type":"collection","collection":"competence","via":"organization","nature":"oneToMany","autoPopulate":true,"dominant":true}],"fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true}],"relations":{"logo":{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field","description":"","label":"Logo","displayedAttribute":"name"},"competences":{"alias":"competences","type":"collection","collection":"competence","via":"organization","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competences","displayedAttribute":"identification"}}},"school":{"label":"School","labelPlural":"Schools","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false}},"displayedField":"id","fields":["name_en","name_fi","name_sv","description_en","description_fi","description_sv","url","logoUrl","logo"],"relations":["academicdegrees"]},"info":{"name":"school","description":"Oppilaitokset"},"connection":"default","collectionName":"schools","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"academicdegrees":{"collection":"academicdegree","via":"school","isVirtual":true}},"globalId":"School","globalName":"School","primaryKey":"id","associations":[{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field"},{"alias":"academicdegrees","type":"collection","collection":"academicdegree","via":"school","nature":"oneToMany","autoPopulate":true,"dominant":true}],"fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true}],"relations":{"logo":{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field","description":"","label":"Logo","displayedAttribute":"name"},"academicdegrees":{"alias":"academicdegrees","type":"collection","collection":"academicdegree","via":"school","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Academicdegrees","displayedAttribute":"identification"}}}},"layout":{"user":{"actions":{"create":"User.create","update":"User.update","destroy":"User.destroy","deleteall":"User.destroyAll"},"attributes":{"username":{"className":"col-md-6"},"email":{"className":"col-md-6"},"resetPasswordToken":{"className":"d-none"},"role":{"className":"d-none"}}},"academicdegree":{"attributes":{}},"competence":{"attributes":{}},"competencedegreelink":{"attributes":{}},"fieldofstudy":{"attributes":{}},"nqf":{"attributes":{}},"organization":{"attributes":{}},"school":{"attributes":{}}}}	object		
7	db_model_nqfs	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
10	db_model_fieldofstudies	{"name_fi":{"type":"string","required":true},"name_en":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
5	db_model_competencedegreelinks	{"url":{"type":"string"},"description_fi":{"type":"text","required":true},"description_en":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"competence":{"model":"competence","via":"competencedegreelinks"},"academicdegree":{"model":"academicdegree","via":"competencedegreelinks"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
2	db_model_competence	{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"description_en":{"type":"text"},"url":{"type":"string"},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"nqf":{"model":"nqf"},"credits":{"type":"integer"},"organization":{"model":"organization","via":"competences"},"competencedegreelinks":{"collection":"competencedegreelink","via":"competence","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
1	db_model_schools	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"academicdegrees":{"collection":"academicdegree","via":"school","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
12	db_model_organizations	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"competences":{"collection":"competence","via":"organization","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
3	db_model_academicdegrees	{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text","required":true},"description_fi":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"model":"nqf"},"school":{"model":"school","via":"academicdegrees"},"fieldofstudy":{"model":"fieldofstudy"},"competencedegreelinks":{"collection":"competencedegreelink","via":"academicdegree","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
9	db_model_upload_file	{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
11	db_model_users-permissions_role	{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}}	object	\N	\N
\.


--
-- Data for Name: fieldofstudies; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.fieldofstudies (id, name_fi, name_en, name_sv, created_at, updated_at) FROM stdin;
1	Humanistiset alat ja teologia	Humanistiset alat ja teologia_en	Humanistiset alat ja teologia_sv	2019-05-09 09:59:54.211+00	2019-05-13 09:22:54.804+00
2	Kasvatusala	Kasvatusala_en	Kasvatusala_sv	2019-05-07 09:32:52.448+00	2019-05-13 09:23:02.28+00
3	Kauppa, hallinto ja oikeustiede	Kauppa, hallinto ja oikeustiede_en	Kauppa, hallinto ja oikeustiede_sv	2019-05-07 09:33:01.518+00	2019-05-13 09:23:09.6+00
4	Luonnontieteet, matematiikka ja tilastotiede	Luonnontieteet, matematiikka ja tilastotiede_en	Luonnontieteet, matematiikka ja tilastotiede_sv	2019-05-07 09:33:12.355+00	2019-05-13 09:23:18.439+00
5	Farmasia, hammaslääketiede ja lääketiede	Farmasia, hammaslääketiede ja lääketiede_en	Farmasia, hammaslääketiede ja lääketiede_sv	2019-05-07 09:33:22.819+00	2019-05-13 09:23:33.571+00
6	Maa- ja metsätaloustiede, eläinlääketiede	Maa- ja metsätaloustiede, eläinlääketiede_en	Maa- ja metsätaloustiede, eläinlääketiede_sv	2019-05-07 09:33:33.309+00	2019-05-13 09:23:39.329+00
7	Palvelualat: liikuntatiede, sotilasala	Palvelualat: liikuntatiede, sotilasala_en	Palvelualat: liikuntatiede, sotilasala_sv	2019-05-07 09:33:45.149+00	2019-05-13 09:23:49.825+00
8	Sosiaalitieteet, journalistiikka ja viestintä	Sosiaalitieteet, journalistiikka ja viestintä_en	Sosiaalitieteet, journalistiikka ja viestintä_sv	2019-05-07 09:33:56.027+00	2019-05-13 09:23:56.038+00
9	Taiteet ja kulttuuri	Taiteet ja kulttuuri_en	Taiteet ja kulttuuri_sv	2019-05-07 09:34:03.203+00	2019-05-13 09:24:02.096+00
10	Tekniikka, teollisuus ja rakentaminen	Tekniikka, teollisuus ja rakentaminen_en	Tekniikka, teollisuus ja rakentaminen_sv	2019-05-07 09:34:10.767+00	2019-05-13 09:24:07.713+00
11	Tietojenkäsittely, tietotekniikka (ICT) ja informaatiotutkimus	Tietojenkäsittely, tietotekniikka (ICT) ja informaatiotutkimus_en	Tietojenkäsittely, tietotekniikka (ICT) ja informaatiotutkimus_sv	2019-05-07 09:34:25.498+00	2019-05-07 09:34:25.511+00
12	Terveys- ja hyvinvointi	Terveys- ja hyvinvointi_en	Terveys- ja hyvinvointi_sv	2019-05-07 09:34:31.882+00	2019-05-07 09:34:31.911+00
13	Yhteiskuntatieteet	Yhteiskuntatieteet_en	Yhteiskuntatieteet_sv	2019-05-07 09:34:37.367+00	2019-05-07 09:34:37.382+00
\.


--
-- Data for Name: nqfs; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.nqfs (id, name_en, name_fi, name_sv, level, created_at, updated_at) FROM stdin;
1	Peruskoulutus_en	Peruskoulutus	Peruskoulutus_sv	2	2019-05-09 09:56:25.044+00	2019-05-13 09:24:17.822+00
2	Toisen asteen koulutus_en	Toisen asteen koulutus	Toisen asteen koulutus_sv	4	2019-05-09 09:57:12.741+00	2019-05-13 09:24:25.122+00
3	Erikoisammattitukinnot_en	Erikoisammattitukinnot	Erikoisammattitukinnot_sv	5	2019-05-09 09:57:47.742+00	2019-05-13 09:24:32.452+00
4	Alempi korkakoulututkinto_en	Alempi korkakoulututkinto	Alempi korkakoulututkinto_sv	6	2019-05-09 09:58:58.697+00	2019-05-13 09:24:41.4+00
5	Ylempi korkeakoulututkinto_en	Ylempi korkeakoulututkinto	Ylempi korkeakoulututkinto_sv	7	2019-05-13 09:24:56.002+00	2019-05-13 09:24:56.017+00
6	Lisensiaatin tai tohtorin tutkinto_en	Lisensiaatin tai tohtorin tutkinto	Lisensiaatin tai tohtorin tutkinto_sv	8	2019-05-13 09:25:30.87+00	2019-05-13 09:25:30.898+00
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.organizations (id, name_en, name_fi, name_sv, description_fi, description_en, description_sv, url, "logoUrl", created_at, updated_at) FROM stdin;
1	The Guides and Scouts of Finland	Suomen Partiolaiset – Finlands Scouter ry	Suomen Partiolaiset – Finlands Scouter ry	Suomen Partiolaiset – Finlands Scouter ry on partioliikkeen keskusjärjestö Suomessa ja Suomen suurin nuorisojärjestö.	Suomen Partiolaiset – Finlands Scouter ry on partioliikkeen keskusjärjestö Suomessa ja Suomen suurin nuorisojärjestö._en	Suomen Partiolaiset – Finlands Scouter ry on partioliikkeen keskusjärjestö Suomessa ja Suomen suurin nuorisojärjestö._sv	https://www.partio.fi	\N	2019-05-09 09:55:05.648+00	2019-05-15 13:25:31.65+00
2	Finnish Judo Association	Suomen Judoliitto	Suomen Judoliitto_sv	Suomen Judoliitto ry on perustettu vuonna 1958. Vuodesta 1963 lähtien Judoliitto on toiminut suomalaisten judoseurojen keskusjärjestönä. Judoliitossa on 122 jäsenseuraa.\n\nJudoliitto on Kansainvälisen Judoliiton (IJF) ja Euroopan Judoliiton (EJU) jäsen. Judoliitto on jäsenenä Suomen Olympiakomiteassa, Suomen Paralympiakomiteassa ja Suomen Urheilutyönantajissa.	The Finnish Judit Association was founded in 1958. Since 1963 Judo has been a central organization of Finnish judo clubs. There are 122 member societies in Judo.\n\nJudaism is a member of the International Union of Judges (IJF) and the European Judicial Union (EJU). Judo Federation is a member of the Finnish Olympic Committee, the Finnish Paralympic Committee and Finnish Sports Workers.	Finlands juditförening grundades 1958. Sedan 1963 har Judo varit en central organisation för finska judoklubbar. Det finns 122 medlemsorganisationer i Judo.\n\nJudendom är medlem i Internationella domstolen (IJF) och Europeiska rättsliga unionen (EJU). Judo Federation är medlem i Finlands Olympiska Kommitté, Finlands Paralympiska Kommitté och Finlands Sportarbetare.	https://www.judoliitto.fi/	\N	2019-05-16 08:10:07.135+00	2019-05-16 08:10:07.181+00
3	The Marthas	Martat	Martat_sv	Marttaliitto on keskusjärjestö, joka suunnittelee järjestön toimintaa ja julkaisee kotitalouksia varten ruokaan, ravitsemukseen, puutarhanhoitoon, ympäristöön, kodin talouteen ja kodinhoitoon liittyvää aineistoa. Marttaliiton jäseniä ovat marttapiirit, joissa ammattitutkinnon suorittaneet kotitalous- ja puutarha-asiantuntijat järjestävät kursseja ja opetusta sekä jäsenilleen että avoimesti kaikille. Marttayhdistyksiä ja toimintaryhmiä on yli 1 200 ja niissä on noin 46 000 jäsentä. Yhdistykset kokoontuvat marttailtoihin luentojen, opiskelun, kotitalouskurssien ja kädentaitojen merkeissä.	The Martha Organization is a Finnish home economics organization, founded in 1899 to promote well-being and quality of life in the home. It carries out cultural and civic education and does advocacy work in Finland.	Martha är en central organisation som utformar organisationens verksamhet och publicerar material för mat, näring, trädgårdsarbete, miljö, hushållsekonomi och hushållning för hushåll. Marttis medlemmar är martyrkretsar, där professionellt kvalificerade hem- och trädgårdsexperter organiserar kurser och undervisning för sina medlemmar och öppet för alla. Det finns mer än 1 200 Martha-föreningar och åtgärdsgrupper med cirka 46 000 medlemmar. Föreningar samlas i martyrer för föreläsningar, studier, hemmakurser och hantverk.	https://www.martat.fi	\N	2019-05-16 08:13:09.603+00	2019-05-16 08:13:09.645+00
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.schools (id, name_en, name_fi, name_sv, description_en, description_fi, description_sv, url, "logoUrl", created_at, updated_at) FROM stdin;
1	Humanistinen ammattikorkeakoulu_en	Humanistinen ammattikorkeakoulu	Humanistinen ammattikorkeakoulu_sv	Humanistinen ammattikorkeakoulu (Humak) on vahvasti profiloitunut, valtakunnallinen ammattikorkeakoulu, joka on erikoistunut järjestö- ja nuorisotyön, työyhteisöjen kehittämisen, kulttuurituotannon ja luovan toimialan yrittäjyyden sekä tulkkausalan erityisosaamisen ja toiminnan kehittämiseen. Humakissa on 1500 opiskelijaa ja noin 130 asiantuntijaa eri tehtävissä._en	Humanistinen ammattikorkeakoulu (Humak) on vahvasti profiloitunut, valtakunnallinen ammattikorkeakoulu, joka on erikoistunut järjestö- ja nuorisotyön, työyhteisöjen kehittämisen, kulttuurituotannon ja luovan toimialan yrittäjyyden sekä tulkkausalan erityisosaamisen ja toiminnan kehittämiseen. Humakissa on 1500 opiskelijaa ja noin 130 asiantuntijaa eri tehtävissä.	Humanistinen ammattikorkeakoulu (Humak) on vahvasti profiloitunut, valtakunnallinen ammattikorkeakoulu, joka on erikoistunut järjestö- ja nuorisotyön, työyhteisöjen kehittämisen, kulttuurituotannon ja luovan toimialan yrittäjyyden sekä tulkkausalan erityisosaamisen ja toiminnan kehittämiseen. Humakissa on 1500 opiskelijaa ja noin 130 asiantuntijaa eri tehtävissä._sv	\N	\N	2019-05-09 09:59:36.683+00	2019-05-15 12:46:03.542+00
2	Haaga-Helia University of Applied Sciences	Haaga-Helia ammattikorkeakoulu	Haaga-Helia	Haaga-Helia is a strongly business orientated university of applied sciences in Finland. Through education, research and development, we prepare professionals for business and services. We focus on co-operation, entrepreneurship, innovation and internationality.	Haaga-Helia ammattikorkeakoulu kouluttaa liike-elämän ja palveluelinkeinojen asiantuntijoita sekä tutkii ja kehittää näihin aloihin liittyvää osaamista ja toimintaa. Koulutusalamme ovat liiketalous, tietotekniikka, hotelli-, ravintola- ja matkailuala, johdon assistenttityö, toimittajakoulutus, liikunta-ala sekä ammatillinen opettajankoulutus. Meille on tärkeää, että opiskelijoillamme on heti valmistuttuaan vahvat siteet työelämään. Panostamme toiminnassamme yrittäjyyteen, yhteistyöhön, innovatiivisuuteen ja kansainvälisyyteen.	Haaga-Helia University of Applied Sciences utbildar experter inom affärs- och serviceindustrin och forskar och utvecklar kompetens och aktiviteter inom dessa områden. Våra utbildningsområden omfattar företagsekonomi, informationsteknik, hotell, restaurang och turism, ledningsassistentarbete, journalistutbildning, sport och professionell lärarutbildning. Det är viktigt för oss att våra studenter har starka band med arbetslivet efter examen. Vi satsar på entreprenörskap, samarbete, innovation och internationalitet i vår verksamhet.	http://www.haaga-helia.fi/	\N	2019-05-16 08:16:09.159+00	2019-05-16 08:16:09.203+00
3	Metropolia University	Metropolia Ammattikorkeakoulu	Metropolia	Metropolia University of Applied Sciences, Finland’s largest university of applied sciences, educates the professionals of tomorrow in the fields of Business, Culture, Health care and Social services, and Technology.\n\nIn our community people and worlds meet to create insight, expertise and well-being for both the professional life and life in general. You can count on Metropolia as a reliable partner and an innovator in higher education. Through cooperation we discover new ideas and solutions to build a better future.\n\n	Metropolia on pääkaupunkiseudulla toimiva kansainvälinen ja monialainen ammattikorkeakoulu. Koulutamme kulttuurin, liiketalouden, sosiaali- ja terveysalan sekä tekniikan asiantuntijoita ja kehittäjiä. Muodostamme yhteisön, jossa erilaiset ihmiset ja maailmat kohtaavat ja joka synnyttää oivalluksia ja osaamista työhön ja hyvinvointia elämään. Olemme vastuullinen kumppani ja korkeakoulutuksen uudistaja, joka yhteistyössä löytää uusia ratkaisuja ja rakentaa parempaa tulevaisuutta.\n\nVuoteen 2020 ulottuva strategiamme tähtää voimakkaasti uudistumiseen. Siinä korostuu tavoite vahvistaa Metropolian yhtenäisyyttä, osaamisen kehittämistä, kilpailukykyä ja yhteiskunnallista vaikuttavuutta. Tahtotilanamme on olla osaamisen rohkea uudistaja ja tulevaisuuden aktiivinen rakentaja.\n\nKeskitymme tulevina vuosina laadukkaaseen oppimiseen ja työelämäyhteistyöhön. Haluamme uudistaa toimintakulttuurimme ja osaamistamme digitalisaation sekä kehittyvien kampustemme myötä. Tutkimus-, kehittämis- ja innovaatiotoiminnassa sekä liiketoiminnassa haemme kasvua erityisesti vaikuttavuudessa ja ulkoisessa rahoituksessa.	Metropolia tekniska högskolan, Finlands största vetenskaps universitet, utbildar morgondagens yrkesverksamma inom områdena Business, Culture, Health Care och Social Services, och Technology.\n\nI vårt samhälle möts människor och världar för att skapa insikt, kompetens och välbefinnande för både det professionella livet och livet i allmänhet. Du kan räkna med Metropolia som en pålitlig partner och en innovatör inom högre utbildning. Genom samarbete upptäcker vi nya idéer och lösningar för att skapa en bättre framtid.	https://www.metropolia.fi/	\N	2019-05-16 08:17:56.04+00	2019-05-16 08:17:56.083+00
4	University of Helsinki	Helsingin yliopisto	Helsingin yliopisto	The University of Helsinki seeks solutions for global challenges and creates new ways of thinking for the best of humanity. Through the power of science and research, the University has contributed to society, education and welfare since 1640. We have educated nine presidents and thousands of people at the top of politics, science, culture and economics. Not to mention four Nobel prize winners.	Helsingin yliopisto on Suomen suurin ja vanhin tiedekorkeakoulu. Vuodesta 1640 se on ollut mukana luomassa reilua ja tasa-arvoista yhteiskuntaa, jota monilla mittareilla pidetään maailman parhaana. Tänään monitieteinen tiedeyhteisö ratkoo ongelmia, jotka koskettavat meistä jokaista, myös kansainvälisesti. 40 000 opiskelijan ja työntekijän tiedeyhteisö synnyttää ratkaisuja, jotka muotoilevat planeettamme ja koko ihmiskunnan tulevaisuutta.	Helsingfors universitet är det största och äldsta universitetet i Finland. Sedan 1640 har det varit inblandat i att skapa ett rättvist och lika samhälle, vilket av många anses vara det bästa i världen. Idag löser det tvärvetenskapliga samhället de problem som påverkar oss alla, även internationellt. Det vetenskapliga samfundet på 40 000 studenter och medarbetare skapar lösningar som formar vår planet och hela mänsklighetens framtid.	https://www.helsinki.fi	\N	2019-05-16 08:21:54.465+00	2019-05-16 08:21:54.504+00
5	Aalto University	Aalto-yliopisto	Aalto-yliopisto	Aalto University is a multidisciplinary community of bold thinkers, where science and art meet technology and business. We are committed to identifying and solving grand societal challenges and building an innovative future.	Aalto-yliopisto on monialainen tiedeyhteisö, jossa tiede ja taide kohtaavat tekniikan ja talouden. Rakennamme innovatiivista yhteiskuntaa korkeatasoisen tutkimuksen, opetuksen ja taiteellisen toiminnan keinoin.	Aalto-universitetet är en flervetenskaplig gemenskap av modiga tänkare, där konst och vetenskap möter teknik och ekonomi. Vi bygger ett innovativt samhälle med hjälp av högklassig forskning, undervisning och konstnärlig verksamhet. 	https://www.aalto.f	\N	2019-05-16 08:23:36.156+00	2019-05-16 08:23:36.196+00
6	Laurea University of Applied Sciences	Laurea-ammattikorkeakoulu	Laurea-ammattikorkeakoulu	Laurea University of Applied Sciences operates in Uusimaa region at six different campuses. There are about 7800 students, 500 staff members and more than 24 000 alumni in our community.	Olemme kuudella kampuksella Uudellamaalla toimiva ammattikorkeakoulu. Yhteisöömme kuuluu noin 7 800 opiskelijaa, 500 henkilökunnan jäsentä sekä yli 24 000 alumnia.	Vi är ett sex-universitets universitet för tillämpad vetenskap i Uusimaa. Vårt samhälle omfattar cirka 7 800 studenter, 500 anställda och över 24 000 alumni.	https://www.laurea.fi	\N	2019-05-16 08:24:58.052+00	2019-05-16 08:24:58.093+00
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
85	upload	upload	destroy	t		1
86	upload	upload	search	t		1
87	users-permissions	auth	changepassword	t		1
88	users-permissions	auth	callback	t		1
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
237	application	academicdegree	count	f		2
247	application	competencedegreelink	find	f		2
257	application	fieldofstudy	update	f		2
267	application	organization	count	f		2
277	content-manager	contentmanager	models	f		2
286	content-type-builder	contenttypebuilder	getmodel	f		2
296	email	email	getsettings	f		2
306	settings-manager	settingsmanager	createlanguage	f		2
316	upload	upload	find	f		2
326	users-permissions	auth	emailconfirmation	f		2
336	users-permissions	userspermissions	deleterole	f		2
346	users-permissions	userspermissions	getemailtemplate	f		2
127	application	competence	create	f		3
137	application	fieldofstudy	findone	f		3
147	application	nqf	destroy	f		3
157	application	school	create	f		3
167	content-manager	contentmanager	delete	f		3
177	email	email	send	f		3
187	settings-manager	settingsmanager	get	f		3
197	upload	upload	getsettings	f		3
207	users-permissions	auth	forgotpassword	t		3
227	users-permissions	userspermissions	searchusers	f		3
217	users-permissions	userspermissions	createrole	f		3
108	users-permissions	userspermissions	index	t		1
238	application	academicdegree	create	f		2
250	application	competencedegreelink	create	f		2
260	application	nqf	findone	f		2
270	application	organization	destroy	f		2
280	content-manager	contentmanager	findone	f		2
290	content-type-builder	contenttypebuilder	updatemodel	f		2
300	settings-manager	settingsmanager	languages	f		2
310	settings-manager	settingsmanager	deletedatabase	f		2
320	upload	upload	search	f		2
330	users-permissions	user	create	f		2
340	users-permissions	userspermissions	getroles	f		2
350	users-permissions	userspermissions	getproviders	f		2
128	application	competence	update	f		3
138	application	fieldofstudy	count	f		3
158	application	school	update	f		3
118	application	academicdegree	find	t		3
148	application	organization	find	t		3
168	content-manager	contentmanager	deleteall	f		3
178	email	email	getenvironments	f		3
188	settings-manager	settingsmanager	update	f		3
198	upload	upload	updatesettings	f		3
208	users-permissions	auth	register	t		3
218	users-permissions	userspermissions	deleteprovider	f		3
228	users-permissions	userspermissions	updaterole	f		3
109	users-permissions	userspermissions	init	t		1
239	application	academicdegree	update	f		2
249	application	competencedegreelink	count	f		2
259	application	nqf	find	f		2
269	application	organization	update	f		2
279	content-manager	contentmanager	count	f		2
289	content-type-builder	contenttypebuilder	createmodel	f		2
299	settings-manager	settingsmanager	environments	f		2
309	settings-manager	settingsmanager	updatedatabase	f		2
319	upload	upload	destroy	f		2
329	users-permissions	user	findone	f		2
339	users-permissions	userspermissions	getrole	f		2
349	users-permissions	userspermissions	updateadvancedsettings	f		2
129	application	competence	destroy	f		3
139	application	fieldofstudy	create	f		3
159	application	school	destroy	f		3
119	application	academicdegree	findone	f		3
149	application	organization	findone	f		3
179	email	email	getsettings	f		3
189	settings-manager	settingsmanager	createlanguage	f		3
199	upload	upload	find	f		3
209	users-permissions	auth	emailconfirmation	t		3
229	users-permissions	userspermissions	getemailtemplate	f		3
219	users-permissions	userspermissions	deleterole	f		3
169	content-type-builder	contenttypebuilder	getmodels	f		3
110	users-permissions	userspermissions	searchusers	t		1
240	application	academicdegree	destroy	f		2
248	application	competencedegreelink	findone	f		2
258	application	fieldofstudy	destroy	f		2
268	application	organization	create	f		2
278	content-manager	contentmanager	find	f		2
288	content-type-builder	contenttypebuilder	getconnections	f		2
298	settings-manager	settingsmanager	menu	f		2
308	settings-manager	settingsmanager	createdatabase	f		2
318	upload	upload	count	f		2
328	users-permissions	user	me	t		2
338	users-permissions	userspermissions	getpolicies	f		2
348	users-permissions	userspermissions	getadvancedsettings	f		2
140	application	fieldofstudy	update	f		3
120	application	academicdegree	count	f		3
150	application	organization	count	f		3
130	application	competencedegreelink	find	t		3
160	content-manager	contentmanager	models	f		3
180	email	email	updatesettings	f		3
190	settings-manager	settingsmanager	deletelanguage	f		3
200	upload	upload	findone	f		3
230	users-permissions	userspermissions	updateemailtemplate	f		3
220	users-permissions	userspermissions	getpermissions	f		3
210	users-permissions	user	find	f		3
170	content-type-builder	contenttypebuilder	getmodel	f		3
111	users-permissions	userspermissions	updaterole	t		1
242	application	competence	findone	f		2
252	application	competencedegreelink	destroy	f		2
262	application	nqf	create	f		2
272	application	school	findone	f		2
282	content-manager	contentmanager	update	f		2
292	content-type-builder	contenttypebuilder	autoreload	t		2
302	settings-manager	settingsmanager	database	f		2
312	upload	upload	upload	f		2
322	users-permissions	auth	changepassword	f		2
332	users-permissions	user	destroy	f		2
342	users-permissions	userspermissions	index	f		2
141	application	fieldofstudy	destroy	f		3
121	application	academicdegree	create	f		3
151	application	organization	create	f		3
131	application	competencedegreelink	findone	f		3
162	content-manager	contentmanager	find	f		3
182	settings-manager	settingsmanager	environments	f		3
192	settings-manager	settingsmanager	updatedatabase	f		3
202	upload	upload	destroy	f		3
222	users-permissions	userspermissions	getrole	f		3
232	users-permissions	userspermissions	updateadvancedsettings	f		3
212	users-permissions	user	findone	f		3
172	content-type-builder	contenttypebuilder	createmodel	f		3
112	users-permissions	userspermissions	getemailtemplate	t		1
243	application	competence	count	f		2
253	application	fieldofstudy	find	f		2
263	application	nqf	update	f		2
273	application	school	count	f		2
287	content-manager	contentmanager	updatesettings	f		2
297	email	email	updatesettings	f		2
307	settings-manager	settingsmanager	deletelanguage	f		2
317	upload	upload	findone	f		2
327	users-permissions	user	find	f		2
337	users-permissions	userspermissions	getpermissions	f		2
347	users-permissions	userspermissions	updateemailtemplate	f		2
142	application	nqf	find	t		3
122	application	academicdegree	update	f		3
152	application	organization	update	f		3
132	application	competencedegreelink	count	f		3
163	content-manager	contentmanager	count	f		3
193	settings-manager	settingsmanager	deletedatabase	f		3
183	settings-manager	settingsmanager	languages	f		3
203	upload	upload	search	f		3
223	users-permissions	userspermissions	getroles	f		3
233	users-permissions	userspermissions	getproviders	f		3
213	users-permissions	user	create	f		3
173	content-type-builder	contenttypebuilder	updatemodel	f		3
113	users-permissions	userspermissions	updateemailtemplate	t		1
244	application	competence	create	f		2
254	application	fieldofstudy	findone	f		2
264	application	nqf	destroy	f		2
274	application	school	create	f		2
285	content-manager	contentmanager	delete	f		2
295	email	email	getenvironments	f		2
305	settings-manager	settingsmanager	update	f		2
315	upload	upload	updatesettings	f		2
325	users-permissions	auth	register	f		2
335	users-permissions	userspermissions	deleteprovider	f		2
345	users-permissions	userspermissions	updaterole	f		2
144	application	nqf	findone	f		3
154	application	school	find	t		3
123	application	academicdegree	destroy	f		3
133	application	competencedegreelink	create	f		3
164	content-manager	contentmanager	create	f		3
194	settings-manager	settingsmanager	autoreload	t		3
184	settings-manager	settingsmanager	databases	f		3
204	users-permissions	auth	callback	t		3
224	users-permissions	userspermissions	getroutes	f		3
234	users-permissions	userspermissions	updateproviders	f		3
214	users-permissions	user	update	f		3
174	content-type-builder	contenttypebuilder	deletemodel	f		3
114	users-permissions	userspermissions	getadvancedsettings	t		1
241	application	competence	find	f		2
251	application	competencedegreelink	update	f		2
261	application	nqf	count	f		2
271	application	school	find	f		2
281	content-manager	contentmanager	create	f		2
291	content-type-builder	contenttypebuilder	deletemodel	f		2
301	settings-manager	settingsmanager	databases	f		2
311	settings-manager	settingsmanager	autoreload	t		2
321	users-permissions	auth	callback	f		2
331	users-permissions	user	update	f		2
341	users-permissions	userspermissions	getroutes	f		2
351	users-permissions	userspermissions	updateproviders	f		2
124	application	competence	find	t		3
143	application	nqf	count	f		3
153	application	organization	destroy	f		3
134	application	competencedegreelink	update	f		3
161	content-manager	contentmanager	findone	f		3
191	settings-manager	settingsmanager	createdatabase	f		3
181	settings-manager	settingsmanager	menu	f		3
201	upload	upload	count	f		3
221	users-permissions	userspermissions	getpolicies	f		3
231	users-permissions	userspermissions	getadvancedsettings	f		3
211	users-permissions	user	me	t		3
171	content-type-builder	contenttypebuilder	getconnections	f		3
115	users-permissions	userspermissions	updateadvancedsettings	t		1
235	application	academicdegree	find	f		2
245	application	competence	update	f		2
255	application	fieldofstudy	count	f		2
265	application	organization	find	f		2
275	application	school	update	f		2
284	content-manager	contentmanager	deleteall	f		2
294	email	email	send	f		2
304	settings-manager	settingsmanager	get	f		2
314	upload	upload	getsettings	f		2
324	users-permissions	auth	forgotpassword	f		2
334	users-permissions	userspermissions	createrole	f		2
344	users-permissions	userspermissions	searchusers	f		2
125	application	competence	findone	f		3
145	application	nqf	create	f		3
155	application	school	findone	f		3
135	application	competencedegreelink	destroy	f		3
165	content-manager	contentmanager	update	f		3
185	settings-manager	settingsmanager	database	f		3
195	upload	upload	upload	f		3
205	users-permissions	auth	changepassword	t		3
225	users-permissions	userspermissions	index	f		3
215	users-permissions	user	destroy	f		3
175	content-type-builder	contenttypebuilder	autoreload	t		3
116	users-permissions	userspermissions	getproviders	t		1
236	application	academicdegree	findone	f		2
246	application	competence	destroy	f		2
256	application	fieldofstudy	create	f		2
266	application	organization	findone	f		2
276	application	school	destroy	f		2
283	content-type-builder	contenttypebuilder	getmodels	f		2
293	content-type-builder	contenttypebuilder	checktableexists	f		2
303	settings-manager	settingsmanager	databasemodel	f		2
313	upload	upload	getenvironments	f		2
323	users-permissions	auth	connect	t		2
333	users-permissions	user	destroyall	f		2
343	users-permissions	userspermissions	init	t		2
126	application	competence	count	f		3
136	application	fieldofstudy	find	t		3
146	application	nqf	update	f		3
156	application	school	count	f		3
166	content-manager	contentmanager	updatesettings	f		3
186	settings-manager	settingsmanager	databasemodel	f		3
196	upload	upload	getenvironments	f		3
206	users-permissions	auth	connect	t		3
226	users-permissions	userspermissions	init	t		3
216	users-permissions	user	destroyall	f		3
176	content-type-builder	contenttypebuilder	checktableexists	f		3
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

SELECT pg_catalog.setval('public.academicdegrees_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.nqfs_id_seq', 6, true);


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.organizations_id_seq', 3, true);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.schools_id_seq', 6, true);


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

