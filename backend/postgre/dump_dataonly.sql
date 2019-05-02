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
-- Data for Name: academies; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.academies (id, name, description, url, created_at, updated_at) FROM stdin;
1	Haaga Helia	uliuluiluiluiluilui	www.haaga-helia.fi	2019-04-30 11:51:17.027+00	2019-04-30 11:51:17.046+00
2	metropolia	testidata on testidataa uluululu	www.metropolia.fi	2019-04-30 11:51:42.117+00	2019-04-30 11:51:42.126+00
\.


--
-- Data for Name: core_store; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.core_store (id, key, value, type, environment, tag) FROM stdin;
1	db_model_users-permissions_user	{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}}	object	\N	\N
2	db_model_academies	{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
3	db_model_users-permissions_permission	{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}}	object	\N	\N
4	db_model_examinations	{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"type":"integer"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
5	db_model_organizations	{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
6	db_model_users-permissions_role	{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}}	object	\N	\N
7	db_model_upload_file	{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
8	db_model_core_store	{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}	object	\N	\N
9	db_model_organizationeducations	{"name":{"type":"string"},"description":{"type":"text"},"credits":{"type":"integer"},"nqf":{"type":"integer"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
10	db_model_upload_file_morph	{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"}}	object	\N	\N
11	plugin_content-manager_schema	{"generalSettings":{"search":true,"filters":true,"bulkActions":true,"pageEntries":10},"models":{"plugins":{"upload":{"file":{"label":"File","labelPlural":"Files","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":["created_at","updated_at"]},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"hash":{"label":"Hash","type":"string","description":"","name":"hash","editable":true,"placeholder":""},"sha256":{"label":"Sha256","type":"string","description":"","name":"sha256","editable":true,"placeholder":""},"ext":{"label":"Ext","type":"string","description":"","name":"ext","editable":true,"placeholder":""},"mime":{"label":"Mime","type":"string","description":"","name":"mime","editable":true,"placeholder":""},"size":{"label":"Size","type":"string","description":"","name":"size","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"public_id":{"label":"Public_id","type":"string","description":"","name":"public_id","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","hash","sha256","ext","mime","size","url","provider","public_id"],"relations":[]},"info":{"name":"file","description":""},"connection":"default","collectionName":"upload_file","attributes":{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false}},"globalId":"UploadFile","globalName":"UploadFile","primaryKey":"id","associations":[{"alias":"related","type":"collection","related":[],"nature":"manyMorphToMany","autoPopulate":true,"filter":"field"}],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"hash":{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},"sha256":{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},"ext":{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true},"mime":{"label":"Mime","description":"","type":"string","disabled":false,"name":"mime","sortable":true,"searchable":true},"size":{"label":"Size","description":"","type":"string","disabled":false,"name":"size","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"public_id":{"label":"Public_id","description":"","type":"string","disabled":false,"name":"public_id","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true}],"relations":{"related":{"alias":"related","type":"collection","related":[],"nature":"manyMorphToMany","autoPopulate":true,"filter":"field","description":"","label":"Related","displayedAttribute":"id"}}}},"users-permissions":{"permission":{"label":"Permission","labelPlural":"Permissions","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""},"controller":{"label":"Controller","type":"string","description":"","name":"controller","editable":true,"placeholder":""},"action":{"label":"Action","type":"string","description":"","name":"action","editable":true,"placeholder":""},"enabled":{"label":"Enabled","type":"boolean","description":"","name":"enabled","editable":true,"placeholder":""},"policy":{"label":"Policy","type":"string","description":"","name":"policy","editable":true,"placeholder":""}},"displayedField":"id","fields":["type","controller","action","enabled","policy"],"relations":["role"]},"info":{"name":"permission","description":""},"connection":"default","collectionName":"users-permissions_permission","attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}},"globalId":"UsersPermissionsPermission","globalName":"UsersPermissionsPermission","primaryKey":"id","associations":[{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},"controller":{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},"action":{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},"enabled":{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true},"policy":{"label":"Policy","description":"","type":"string","disabled":false,"name":"policy","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true}],"relations":{"role":{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}}},"role":{"label":"Role","labelPlural":"Roles","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"string","description":"","name":"description","editable":true,"placeholder":""},"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","type"],"relations":["permissions","users"]},"info":{"name":"role","description":""},"connection":"default","collectionName":"users-permissions_role","attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}},"globalId":"UsersPermissionsRole","globalName":"UsersPermissionsRole","primaryKey":"id","associations":[{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"},{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}],"relations":{"permissions":{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Permissions","displayedAttribute":"type"},"users":{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Users","displayedAttribute":"username"}}},"user":{"label":"User","labelPlural":"Users","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"username":{"label":"Username","type":"string","description":"","name":"username","editable":true,"placeholder":""},"email":{"label":"Email","type":"email","description":"","name":"email","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"password":{"label":"Password","type":"password","description":"","name":"password","editable":true,"placeholder":""},"confirmed":{"label":"Confirmed","type":"boolean","description":"","name":"confirmed","editable":true,"placeholder":""},"blocked":{"label":"Blocked","type":"boolean","description":"","name":"blocked","editable":true,"placeholder":""}},"displayedField":"id","fields":["username","email","provider","password","confirmed","blocked"],"relations":["role"]},"info":{"name":"user","description":""},"connection":"default","collectionName":"users-permissions_user","attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}},"globalId":"UsersPermissionsUser","globalName":"UsersPermissionsUser","primaryKey":"id","associations":[{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"username":{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},"email":{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"password":{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true},"confirmed":{"label":"Confirmed","description":"","type":"boolean","disabled":false,"name":"confirmed","sortable":true,"searchable":true},"blocked":{"label":"Blocked","description":"","type":"boolean","disabled":false,"name":"blocked","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true}],"relations":{"role":{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}}}}},"academy":{"label":"Academy","labelPlural":"Academies","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"text","description":"","name":"description","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","url"],"relations":[]},"info":{"name":"academy","description":""},"connection":"default","collectionName":"academies","attributes":{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"}},"globalId":"Academy","globalName":"Academy","primaryKey":"id","associations":[],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true}],"relations":{}},"examination":{"label":"Examination","labelPlural":"Examinations","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"text","description":"","name":"description","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""},"nqf":{"label":"Nqf","type":"integer","description":"","name":"nqf","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","url","credits","nqf"],"relations":[]},"info":{"name":"examination","description":""},"connection":"default","collectionName":"examinations","attributes":{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"type":"integer"}},"globalId":"Examination","globalName":"Examination","primaryKey":"id","associations":[],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},"nqf":{"label":"Nqf","description":"","type":"integer","disabled":false,"name":"nqf","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true}],"relations":{}},"organization":{"label":"Organization","labelPlural":"Organizations","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"text","description":"","name":"description","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","url"],"relations":[]},"info":{"name":"organization","description":""},"connection":"default","collectionName":"organizations","attributes":{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"}},"globalId":"Organization","globalName":"Organization","primaryKey":"id","associations":[],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true}],"relations":{}},"organizationeducation":{"label":"Organizationeducation","labelPlural":"Organizationeducations","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"text","description":"","name":"description","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""},"nqf":{"label":"Nqf","type":"integer","description":"","name":"nqf","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","credits","nqf"],"relations":[]},"info":{"name":"organizationeducation","description":""},"connection":"default","collectionName":"organizationeducations","attributes":{"name":{"type":"string"},"description":{"type":"text"},"credits":{"type":"integer"},"nqf":{"type":"integer"}},"globalId":"Organizationeducation","globalName":"Organizationeducation","primaryKey":"id","associations":[],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},"nqf":{"label":"Nqf","description":"","type":"integer","disabled":false,"name":"nqf","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},{"label":"Nqf","description":"","type":"integer","disabled":false,"name":"nqf","sortable":true,"searchable":true}],"relations":{}}},"layout":{"user":{"actions":{"create":"User.create","update":"User.update","destroy":"User.destroy","deleteall":"User.destroyAll"},"attributes":{"username":{"className":"col-md-6"},"email":{"className":"col-md-6"},"resetPasswordToken":{"className":"d-none"},"role":{"className":"d-none"}}},"academy":{"attributes":{}},"examination":{"attributes":{}},"organization":{"attributes":{}},"organizationeducation":{"attributes":{}}}}	object		
12	core_application	{"name":"Default Application","description":"This API is going to be awesome!"}	object		
13	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"comments","key":"","secret":"","callback":"/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-official","key":"","secret":"","callback":"/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","redirect_uri":"/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"/auth/twitter/callback"}}	object		
14	plugin_email_provider	{"provider":"sendmail","name":"Sendmail","auth":{"sendmail_default_from":{"label":"Sendmail Default From","type":"text"},"sendmail_default_replyto":{"label":"Sendmail Default Reply-To","type":"text"}}}	object	development	
15	plugin_upload_provider	{"provider":"local","name":"Local server","enabled":true,"sizeLimit":1000000}	object	development	
16	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"refresh","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"­Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square-o","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object		
17	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_confirmation_redirection":"http://localhost:1337/admin","default_role":"authenticated"}	object		
\.


--
-- Data for Name: examinations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.examinations (id, name, description, url, credits, nqf, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: organizationeducations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.organizationeducations (id, name, description, credits, nqf, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.organizations (id, name, description, url, created_at, updated_at) FROM stdin;
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
1	application	academy	find	t		1
2	application	academy	findone	t		1
3	application	academy	count	t		1
4	application	academy	create	t		1
5	application	academy	update	t		1
6	application	academy	destroy	t		1
7	application	examination	find	t		1
8	application	examination	findone	t		1
9	application	examination	count	t		1
10	application	examination	create	t		1
11	application	examination	update	t		1
12	application	examination	destroy	t		1
13	application	organization	find	t		1
14	application	organization	findone	t		1
15	application	organization	count	t		1
16	application	organization	create	t		1
17	application	organization	update	t		1
18	application	organization	destroy	t		1
19	application	organizationeducation	find	t		1
20	application	organizationeducation	findone	t		1
21	application	organizationeducation	count	t		1
22	application	organizationeducation	create	t		1
23	application	organizationeducation	update	t		1
24	application	organizationeducation	destroy	t		1
25	content-manager	contentmanager	models	t		1
26	content-manager	contentmanager	find	t		1
27	content-manager	contentmanager	count	t		1
28	content-manager	contentmanager	findone	t		1
29	content-manager	contentmanager	create	t		1
30	content-manager	contentmanager	update	t		1
31	content-manager	contentmanager	updatesettings	t		1
32	content-manager	contentmanager	delete	t		1
33	content-manager	contentmanager	deleteall	t		1
34	content-type-builder	contenttypebuilder	getmodels	t		1
35	content-type-builder	contenttypebuilder	getmodel	t		1
36	content-type-builder	contenttypebuilder	getconnections	t		1
37	content-type-builder	contenttypebuilder	createmodel	t		1
38	content-type-builder	contenttypebuilder	updatemodel	t		1
39	content-type-builder	contenttypebuilder	deletemodel	t		1
40	content-type-builder	contenttypebuilder	autoreload	t		1
41	content-type-builder	contenttypebuilder	checktableexists	t		1
42	email	email	send	t		1
43	email	email	getenvironments	t		1
44	email	email	getsettings	t		1
45	email	email	updatesettings	t		1
46	settings-manager	settingsmanager	menu	t		1
47	settings-manager	settingsmanager	environments	t		1
48	settings-manager	settingsmanager	languages	t		1
49	settings-manager	settingsmanager	databases	t		1
50	settings-manager	settingsmanager	database	t		1
51	settings-manager	settingsmanager	databasemodel	t		1
52	settings-manager	settingsmanager	get	t		1
53	settings-manager	settingsmanager	update	t		1
54	settings-manager	settingsmanager	createlanguage	t		1
55	settings-manager	settingsmanager	deletelanguage	t		1
56	settings-manager	settingsmanager	createdatabase	t		1
57	settings-manager	settingsmanager	updatedatabase	t		1
58	settings-manager	settingsmanager	deletedatabase	t		1
59	settings-manager	settingsmanager	autoreload	t		1
60	upload	upload	upload	t		1
61	upload	upload	getenvironments	t		1
62	upload	upload	getsettings	t		1
63	upload	upload	updatesettings	t		1
64	upload	upload	find	t		1
65	upload	upload	findone	t		1
66	upload	upload	count	t		1
67	upload	upload	destroy	t		1
68	upload	upload	search	t		1
69	users-permissions	auth	callback	t		1
70	users-permissions	auth	changepassword	t		1
71	users-permissions	auth	connect	t		1
72	users-permissions	auth	forgotpassword	t		1
73	users-permissions	auth	register	t		1
74	users-permissions	auth	emailconfirmation	t		1
75	users-permissions	user	find	t		1
76	users-permissions	user	me	t		1
77	users-permissions	user	findone	t		1
78	users-permissions	user	create	t		1
79	users-permissions	user	update	t		1
80	users-permissions	user	destroy	t		1
81	users-permissions	user	destroyall	t		1
82	users-permissions	userspermissions	createrole	t		1
83	users-permissions	userspermissions	deleteprovider	t		1
84	users-permissions	userspermissions	deleterole	t		1
85	users-permissions	userspermissions	getpermissions	t		1
86	users-permissions	userspermissions	getpolicies	t		1
87	users-permissions	userspermissions	getrole	t		1
88	users-permissions	userspermissions	getroles	t		1
89	users-permissions	userspermissions	index	t		1
90	users-permissions	userspermissions	getroutes	t		1
91	users-permissions	userspermissions	init	t		1
92	users-permissions	userspermissions	searchusers	t		1
93	users-permissions	userspermissions	updaterole	t		1
94	users-permissions	userspermissions	getemailtemplate	t		1
95	users-permissions	userspermissions	updateemailtemplate	t		1
96	users-permissions	userspermissions	getadvancedsettings	t		1
97	users-permissions	userspermissions	updateadvancedsettings	t		1
98	users-permissions	userspermissions	getproviders	t		1
99	users-permissions	userspermissions	updateproviders	t		1
100	application	academy	find	f		2
101	application	academy	findone	f		2
102	application	academy	count	f		2
103	application	academy	create	f		2
104	application	academy	update	f		2
114	application	organization	count	f		2
124	content-manager	contentmanager	models	f		2
134	content-type-builder	contenttypebuilder	getmodel	f		2
144	email	email	updatesettings	f		2
154	settings-manager	settingsmanager	deletelanguage	f		2
164	upload	upload	findone	f		2
174	users-permissions	user	find	f		2
184	users-permissions	userspermissions	getpermissions	f		2
194	users-permissions	userspermissions	updateemailtemplate	f		2
205	application	academy	destroy	f		3
215	application	organization	update	f		3
225	content-manager	contentmanager	count	f		3
235	content-type-builder	contenttypebuilder	createmodel	f		3
248	settings-manager	settingsmanager	database	f		3
258	upload	upload	upload	f		3
268	users-permissions	auth	changepassword	t		3
278	users-permissions	user	destroy	f		3
288	users-permissions	userspermissions	index	f		3
105	application	academy	destroy	f		2
115	application	organization	create	f		2
125	content-manager	contentmanager	find	f		2
135	content-type-builder	contenttypebuilder	getconnections	f		2
145	settings-manager	settingsmanager	menu	f		2
155	settings-manager	settingsmanager	createdatabase	f		2
165	upload	upload	count	f		2
175	users-permissions	user	me	t		2
185	users-permissions	userspermissions	getpolicies	f		2
195	users-permissions	userspermissions	getadvancedsettings	f		2
204	application	examination	find	f		3
214	application	organization	create	f		3
224	content-manager	contentmanager	find	f		3
234	content-type-builder	contenttypebuilder	getconnections	f		3
243	email	email	updatesettings	f		3
253	settings-manager	settingsmanager	deletelanguage	f		3
263	upload	upload	findone	f		3
273	users-permissions	user	find	f		3
283	users-permissions	userspermissions	getpermissions	f		3
293	users-permissions	userspermissions	updateemailtemplate	f		3
106	application	examination	find	f		2
116	application	organization	update	f		2
126	content-manager	contentmanager	count	f		2
136	content-type-builder	contenttypebuilder	createmodel	f		2
146	settings-manager	settingsmanager	environments	f		2
156	settings-manager	settingsmanager	updatedatabase	f		2
166	upload	upload	destroy	f		2
176	users-permissions	user	findone	f		2
186	users-permissions	userspermissions	getrole	f		2
196	users-permissions	userspermissions	updateadvancedsettings	f		2
206	application	examination	findone	f		3
216	application	organization	destroy	f		3
226	content-manager	contentmanager	findone	f		3
236	content-type-builder	contenttypebuilder	updatemodel	f		3
245	settings-manager	settingsmanager	environments	f		3
255	settings-manager	settingsmanager	updatedatabase	f		3
265	upload	upload	destroy	f		3
275	users-permissions	user	findone	f		3
285	users-permissions	userspermissions	getrole	f		3
295	users-permissions	userspermissions	updateadvancedsettings	f		3
107	application	examination	findone	f		2
117	application	organization	destroy	f		2
127	content-manager	contentmanager	findone	f		2
137	content-type-builder	contenttypebuilder	updatemodel	f		2
147	settings-manager	settingsmanager	languages	f		2
157	settings-manager	settingsmanager	deletedatabase	f		2
167	upload	upload	search	f		2
177	users-permissions	user	create	f		2
187	users-permissions	userspermissions	getroles	f		2
197	users-permissions	userspermissions	getproviders	f		2
207	application	examination	count	f		3
217	application	organizationeducation	find	f		3
227	content-manager	contentmanager	create	f		3
237	content-type-builder	contenttypebuilder	deletemodel	f		3
246	settings-manager	settingsmanager	languages	f		3
256	settings-manager	settingsmanager	deletedatabase	f		3
266	upload	upload	search	f		3
276	users-permissions	user	create	f		3
286	users-permissions	userspermissions	getroles	f		3
297	users-permissions	userspermissions	getproviders	f		3
108	application	examination	count	f		2
118	application	organizationeducation	find	f		2
128	content-manager	contentmanager	create	f		2
138	content-type-builder	contenttypebuilder	deletemodel	f		2
148	settings-manager	settingsmanager	databases	f		2
158	settings-manager	settingsmanager	autoreload	t		2
168	users-permissions	auth	callback	f		2
178	users-permissions	user	update	f		2
188	users-permissions	userspermissions	getroutes	f		2
198	users-permissions	userspermissions	updateproviders	f		2
208	application	examination	create	f		3
218	application	organizationeducation	findone	f		3
228	content-manager	contentmanager	update	f		3
238	content-type-builder	contenttypebuilder	autoreload	t		3
247	settings-manager	settingsmanager	databases	f		3
257	settings-manager	settingsmanager	autoreload	t		3
267	users-permissions	auth	callback	t		3
277	users-permissions	user	update	f		3
287	users-permissions	userspermissions	getroutes	f		3
296	users-permissions	userspermissions	updateproviders	f		3
109	application	examination	create	f		2
119	application	organizationeducation	findone	f		2
129	content-manager	contentmanager	update	f		2
139	content-type-builder	contenttypebuilder	autoreload	t		2
149	settings-manager	settingsmanager	database	f		2
159	upload	upload	upload	f		2
169	users-permissions	auth	changepassword	f		2
179	users-permissions	user	destroy	f		2
189	users-permissions	userspermissions	index	f		2
199	application	academy	find	f		3
209	application	examination	update	f		3
219	application	organizationeducation	count	f		3
229	content-manager	contentmanager	updatesettings	f		3
239	content-type-builder	contenttypebuilder	checktableexists	f		3
244	settings-manager	settingsmanager	menu	f		3
254	settings-manager	settingsmanager	createdatabase	f		3
264	upload	upload	count	f		3
274	users-permissions	user	me	t		3
284	users-permissions	userspermissions	getpolicies	f		3
294	users-permissions	userspermissions	getadvancedsettings	f		3
110	application	examination	update	f		2
120	application	organizationeducation	count	f		2
130	content-manager	contentmanager	updatesettings	f		2
140	content-type-builder	contenttypebuilder	checktableexists	f		2
150	settings-manager	settingsmanager	databasemodel	f		2
160	upload	upload	getenvironments	f		2
170	users-permissions	auth	connect	t		2
180	users-permissions	user	destroyall	f		2
190	users-permissions	userspermissions	init	t		2
200	application	academy	findone	f		3
210	application	examination	destroy	f		3
220	application	organizationeducation	create	f		3
230	content-manager	contentmanager	delete	f		3
240	email	email	send	f		3
250	settings-manager	settingsmanager	get	f		3
260	upload	upload	getsettings	f		3
270	users-permissions	auth	forgotpassword	t		3
280	users-permissions	userspermissions	createrole	f		3
290	users-permissions	userspermissions	searchusers	f		3
111	application	examination	destroy	f		2
121	application	organizationeducation	create	f		2
131	content-manager	contentmanager	delete	f		2
141	email	email	send	f		2
151	settings-manager	settingsmanager	get	f		2
161	upload	upload	getsettings	f		2
171	users-permissions	auth	forgotpassword	f		2
181	users-permissions	userspermissions	createrole	f		2
191	users-permissions	userspermissions	searchusers	f		2
201	application	academy	count	f		3
211	application	organization	find	f		3
221	application	organizationeducation	update	f		3
231	content-manager	contentmanager	deleteall	f		3
241	email	email	getenvironments	f		3
251	settings-manager	settingsmanager	update	f		3
261	upload	upload	updatesettings	f		3
271	users-permissions	auth	register	t		3
281	users-permissions	userspermissions	deleteprovider	f		3
291	users-permissions	userspermissions	updaterole	f		3
112	application	organization	find	f		2
122	application	organizationeducation	update	f		2
132	content-manager	contentmanager	deleteall	f		2
142	email	email	getenvironments	f		2
152	settings-manager	settingsmanager	update	f		2
162	upload	upload	updatesettings	f		2
172	users-permissions	auth	register	f		2
182	users-permissions	userspermissions	deleteprovider	f		2
192	users-permissions	userspermissions	updaterole	f		2
202	application	academy	create	f		3
212	application	organization	findone	f		3
222	application	organizationeducation	destroy	f		3
232	content-type-builder	contenttypebuilder	getmodels	f		3
242	email	email	getsettings	f		3
252	settings-manager	settingsmanager	createlanguage	f		3
262	upload	upload	find	f		3
272	users-permissions	auth	emailconfirmation	t		3
282	users-permissions	userspermissions	deleterole	f		3
292	users-permissions	userspermissions	getemailtemplate	f		3
113	application	organization	findone	f		2
123	application	organizationeducation	destroy	f		2
133	content-type-builder	contenttypebuilder	getmodels	f		2
143	email	email	getsettings	f		2
153	settings-manager	settingsmanager	createlanguage	f		2
163	upload	upload	find	f		2
173	users-permissions	auth	emailconfirmation	f		2
183	users-permissions	userspermissions	deleterole	f		2
193	users-permissions	userspermissions	getemailtemplate	f		2
203	application	academy	update	f		3
213	application	organization	count	f		3
223	content-manager	contentmanager	models	f		3
233	content-type-builder	contenttypebuilder	getmodel	f		3
249	settings-manager	settingsmanager	databasemodel	f		3
259	upload	upload	getenvironments	f		3
269	users-permissions	auth	connect	t		3
279	users-permissions	user	destroyall	f		3
289	users-permissions	userspermissions	init	t		3
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
1	partioadmin	niki.ahlskog@eficode.com	local	$2a$10$GTAyiL2IhKfAs8epJvoUg.Kz3bQO1YudxJucGlg.fPtZgwgMo5oQ.	\N	t	\N	1
\.


--
-- Name: academies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.academies_id_seq', 2, true);


--
-- Name: core_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.core_store_id_seq', 17, true);


--
-- Name: examinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.examinations_id_seq', 1, false);


--
-- Name: organizationeducations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.organizationeducations_id_seq', 1, false);


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.organizations_id_seq', 1, false);


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

SELECT pg_catalog.setval('public."users-permissions_permission_id_seq"', 297, true);


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

