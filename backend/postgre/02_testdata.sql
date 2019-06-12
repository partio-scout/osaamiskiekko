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
4	school1-deg2	school1-deg2	school1-deg2	school1-deg2	school1-deg2	school1-deg2	school1-deg2	\N	\N	5	7	2	2019-06-03 08:31:36.135+00	2019-06-03 08:39:35.832+00
5	school1-deg3	school1-deg3	school1-deg3	school1-deg3	school1-deg3	school1-deg3	school1-deg3	\N	\N	4	7	5	2019-06-03 08:31:57.018+00	2019-06-03 08:39:35.832+00
6	school2-deg1	school2-deg1	school2-deg1	school2-deg1	school2-deg1	school2-deg1	school2-deg1	\N	\N	2	8	2	2019-06-03 08:32:25.497+00	2019-06-03 08:32:25.512+00
3	school1-deg1	school1-deg1_en	school1-deg1_fi	school1-deg1_sv	school1-deg1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._en	school1-deg1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._fi	school1-deg1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._sv	\N	14	3	7	2	2019-06-03 08:31:16.758+00	2019-06-03 08:39:35.832+00
\.


--
-- Data for Name: competence; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.competence (id, identification, name_en, description_en, url, name_fi, name_sv, description_fi, description_sv, nqf, credits, organization, created_at, updated_at) FROM stdin;
9	org2-comp2	org2-comp2	\N	\N	org2-comp2	org2-comp2	\N	\N	5	\N	5	2019-06-03 08:30:38.119+00	2019-06-03 08:30:38.137+00
8	org2-comp1	org2-comp1	\N	\N	org2-comp1	org2-comp1	\N	\N	1	\N	5	2019-06-03 08:30:26.765+00	2019-06-03 08:30:26.783+00
10	org2-comp3	org2-comp3	\N	\N	org2-comp3	org2-comp3	\N	\N	2	\N	5	2019-06-03 08:30:52.171+00	2019-06-03 08:30:52.191+00
7	org1-comp2	org1-comp2	\N	\N	org1-comp2	org1-comp2	\N	\N	4	\N	4	2019-06-03 08:30:14.434+00	2019-06-03 08:38:33.122+00
6	org1-comp1	org1-comp1_en	org1-comp1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._en	\N	org1-comp1_fi	org1-comp1_sv	org1-comp1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._fi	org1-comp1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._sv	1	4	4	2019-06-03 08:30:03.3+00	2019-06-03 08:38:33.122+00
\.


--
-- Data for Name: competencedegreelinks; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.competencedegreelinks (id, url, description_fi, description_en, description_sv, competence, academicdegree, created_at, updated_at, identification) FROM stdin;
9	\N	s1d1-o1c2	s1d1-o1c2	s1d1-o1c2	7	3	2019-06-03 08:33:26.293+00	2019-06-03 08:36:14.783+00	s1d1-o1c2
10	\N	s1d1-o2c1	s1d1-o2c1	s1d1-o2c1	8	3	2019-06-03 08:33:55.943+00	2019-06-03 08:36:14.783+00	s1d1-o2c1
8	\N	s1d1-o1c1 Vivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar.	s1d1-o1c1 Vivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar.	s1d1-o1c1 Vivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar.	6	3	2019-06-03 08:32:56.764+00	2019-06-03 08:36:42.946+00	s1d1-o1c1
11	\N	s2d1-o1c1	s2d1-o1c1	s2d1-o1c1	6	6	2019-06-03 08:34:30.247+00	2019-06-03 08:36:42.946+00	s2d1-o1c1
12	\N	s2d1-o2c3	s2d1-o2c3	s2d1-o2c3	10	6	2019-06-03 08:34:52.695+00	2019-06-03 08:34:52.71+00	s2d1-o2c3
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
13	db_model_upload_file_morph	{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"}}	object	\N	\N
4	db_model_users-permissions_permission	{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}}	object	\N	\N
6	db_model_core_store	{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}	object	\N	\N
7	db_model_nqfs	{"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
9	db_model_upload_file	{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
11	db_model_users-permissions_role	{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}}	object	\N	\N
3	db_model_academicdegrees	{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text","required":true},"description_fi":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"model":"nqf"},"school":{"model":"school","via":"academicdegrees"},"fieldofstudy":{"model":"fieldofstudy"},"competencedegreelinks":{"collection":"competencedegreelink","via":"academicdegree","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
10	db_model_fieldofstudies	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
5	db_model_competencedegreelinks	{"identification":{"type":"string"},"url":{"type":"string"},"description_fi":{"type":"text","required":true},"description_en":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"academicdegree":{"model":"academicdegree","via":"competencedegreelinks"},"competence":{"model":"competence","via":"competencedegreelinks"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
2	db_model_competence	{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"description_en":{"type":"text"},"url":{"type":"string"},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"nqf":{"model":"nqf"},"credits":{"type":"integer"},"organization":{"model":"organization","via":"competences"},"competencedegreelinks":{"collection":"competencedegreelink","via":"competence","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
12	db_model_organizations	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"competences":{"collection":"competence","via":"organization","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
14	plugin_content-manager_schema	{"generalSettings":{"search":true,"filters":true,"bulkActions":true,"pageEntries":10},"models":{"plugins":{"upload":{"file":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true}],"search":true,"collectionName":"upload_file","orm":"bookshelf","bulkActions":true,"info":{"name":"file","description":""},"globalName":"UploadFile","associations":[{"alias":"related","type":"collection","related":["Organization","School"],"nature":"manyMorphToOne","autoPopulate":true,"filter":"field"}],"label":"File","attributes":{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false}},"relations":{"related":{"alias":"related","type":"collection","related":["Organization","School"],"nature":"manyMorphToOne","autoPopulate":true,"filter":"field","description":"","label":"Related","displayedAttribute":"id"}},"editDisplay":{"availableFields":{"size":{"label":"Size","type":"string","description":"","name":"size","editable":true,"placeholder":""},"ext":{"label":"Ext","type":"string","description":"","name":"ext","editable":true,"placeholder":""},"sha256":{"label":"Sha256","type":"string","description":"","name":"sha256","editable":true,"placeholder":""},"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"hash":{"label":"Hash","type":"string","description":"","name":"hash","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"public_id":{"label":"Public_id","type":"string","description":"","name":"public_id","editable":true,"placeholder":""},"mime":{"label":"Mime","type":"string","description":"","name":"mime","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","hash","sha256","ext","mime","size","url","provider","public_id"],"relations":[]},"labelPlural":"Files","fields":{"size":{"label":"Size","description":"","type":"string","disabled":false,"name":"size","sortable":true,"searchable":true},"ext":{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true},"sha256":{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"hash":{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"public_id":{"label":"Public_id","description":"","type":"string","disabled":false,"name":"public_id","sortable":true,"searchable":true},"mime":{"label":"Mime","description":"","type":"string","disabled":false,"name":"mime","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UploadFile","sort":"ASC","options":{"timestamps":["created_at","updated_at"]},"connection":"default","defaultSort":"id"}},"users-permissions":{"permission":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true}],"search":true,"collectionName":"users-permissions_permission","orm":"bookshelf","bulkActions":true,"info":{"name":"permission","description":""},"globalName":"UsersPermissionsPermission","associations":[{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"label":"Permission","attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}},"relations":{"role":{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}},"editDisplay":{"availableFields":{"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""},"controller":{"label":"Controller","type":"string","description":"","name":"controller","editable":true,"placeholder":""},"action":{"label":"Action","type":"string","description":"","name":"action","editable":true,"placeholder":""},"enabled":{"label":"Enabled","type":"boolean","description":"","name":"enabled","editable":true,"placeholder":""},"policy":{"label":"Policy","type":"string","description":"","name":"policy","editable":true,"placeholder":""}},"displayedField":"id","fields":["type","controller","action","enabled","policy"],"relations":["role"]},"labelPlural":"Permissions","fields":{"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},"controller":{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},"action":{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},"enabled":{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true},"policy":{"label":"Policy","description":"","type":"string","disabled":false,"name":"policy","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UsersPermissionsPermission","sort":"ASC","options":{"timestamps":false},"connection":"default","defaultSort":"id"},"role":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}],"search":true,"collectionName":"users-permissions_role","orm":"bookshelf","bulkActions":true,"info":{"name":"role","description":""},"globalName":"UsersPermissionsRole","associations":[{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"},{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"label":"Role","attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}},"relations":{"permissions":{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Permissions","displayedAttribute":"type"},"users":{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Users","displayedAttribute":"username"}},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"string","description":"","name":"description","editable":true,"placeholder":""},"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","type"],"relations":["permissions","users"]},"labelPlural":"Roles","fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UsersPermissionsRole","sort":"ASC","options":{"timestamps":false},"connection":"default","defaultSort":"id"},"user":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true}],"search":true,"collectionName":"users-permissions_user","orm":"bookshelf","bulkActions":true,"info":{"name":"user","description":""},"globalName":"UsersPermissionsUser","associations":[{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"label":"User","attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}},"relations":{"role":{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}},"editDisplay":{"availableFields":{"username":{"label":"Username","type":"string","description":"","name":"username","editable":true,"placeholder":""},"email":{"label":"Email","type":"email","description":"","name":"email","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"password":{"label":"Password","type":"password","description":"","name":"password","editable":true,"placeholder":""},"confirmed":{"label":"Confirmed","type":"boolean","description":"","name":"confirmed","editable":true,"placeholder":""},"blocked":{"label":"Blocked","type":"boolean","description":"","name":"blocked","editable":true,"placeholder":""}},"displayedField":"id","fields":["username","email","provider","password","confirmed","blocked"],"relations":["role"]},"labelPlural":"Users","fields":{"username":{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},"email":{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"password":{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true},"confirmed":{"label":"Confirmed","description":"","type":"boolean","disabled":false,"name":"confirmed","sortable":true,"searchable":true},"blocked":{"label":"Blocked","description":"","type":"boolean","disabled":false,"name":"blocked","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UsersPermissionsUser","sort":"ASC","options":{"timestamps":false},"connection":"default","defaultSort":"id"}},"admin":{"administrator":{"label":"Administrator","labelPlural":"Administrators","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","editDisplay":{"availableFields":{"username":{"label":"Username","type":"string","description":"","name":"username","editable":true,"placeholder":""},"email":{"label":"Email","type":"email","description":"","name":"email","editable":true,"placeholder":""},"password":{"label":"Password","type":"password","description":"","name":"password","editable":true,"placeholder":""},"blocked":{"label":"Blocked","type":"boolean","description":"","name":"blocked","editable":true,"placeholder":""}},"displayedField":"id","fields":["username","email","password","blocked"],"relations":[]},"info":{"name":"Administrator","description":""},"connection":"default","collectionName":"strapi_administrator","attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"required":true},"blocked":{"type":"boolean","default":false,"configurable":false}},"identity":"Administrator","globalId":"AdminAdministrator","globalName":"AdminAdministrator","primaryKey":"id","associations":[],"fields":{"username":{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},"email":{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},"password":{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true},"blocked":{"label":"Blocked","description":"","type":"boolean","disabled":false,"name":"blocked","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true},{"label":"Blocked","description":"","type":"boolean","disabled":false,"name":"blocked","sortable":true,"searchable":true}],"relations":{}}}},"academicdegree":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}],"search":true,"collectionName":"academicdegrees","orm":"bookshelf","bulkActions":true,"info":{"name":"academicdegree","description":"Oppilaitosten tutkinnot"},"globalName":"Academicdegree","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"school","type":"model","model":"school","via":"academicdegrees","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"fieldofstudy","type":"model","model":"fieldofstudy","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"Academicdegree","attributes":{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text","required":true},"description_fi":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"model":"nqf"},"school":{"model":"school","via":"academicdegrees"},"fieldofstudy":{"model":"fieldofstudy"},"competencedegreelinks":{"collection":"competencedegreelink","via":"academicdegree","isVirtual":true}},"relations":{"nqf":{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Nqf","displayedAttribute":"name_en"},"school":{"alias":"school","type":"model","model":"school","via":"academicdegrees","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"School","displayedAttribute":"name_en"},"fieldofstudy":{"alias":"fieldofstudy","type":"model","model":"fieldofstudy","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Fieldofstudy","displayedAttribute":"name_en"},"competencedegreelinks":{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competencedegreelinks","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""}},"displayedField":"id","fields":["identification","name_en","name_fi","name_sv","description_en","description_fi","description_sv","url","credits"],"relations":["nqf","school","fieldofstudy","competencedegreelinks"]},"labelPlural":"Academicdegrees","fields":{"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Academicdegree","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"competence":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true}],"search":true,"collectionName":"competence","orm":"bookshelf","bulkActions":true,"info":{"name":"competence","description":"Järjestön koulutus"},"globalName":"Competence","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"organization","type":"model","model":"organization","via":"competences","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"competence","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"Competence","attributes":{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"description_en":{"type":"text"},"url":{"type":"string"},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"nqf":{"model":"nqf"},"credits":{"type":"integer"},"organization":{"model":"organization","via":"competences"},"competencedegreelinks":{"collection":"competencedegreelink","via":"competence","isVirtual":true}},"relations":{"nqf":{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Nqf","displayedAttribute":"name_en"},"organization":{"alias":"organization","type":"model","model":"organization","via":"competences","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Organization","displayedAttribute":"name_en"},"competencedegreelinks":{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"competence","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competencedegreelinks","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""}},"displayedField":"id","fields":["identification","name_en","description_en","url","name_fi","name_sv","description_fi","description_sv","credits"],"relations":["nqf","organization","competencedegreelinks"]},"labelPlural":"Competences","fields":{"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Competence","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"competencedegreelink":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true}],"search":true,"collectionName":"competencedegreelinks","orm":"bookshelf","bulkActions":true,"info":{"name":"competencedegreelink","description":"Koulutus tutkinto. "},"globalName":"Competencedegreelink","associations":[{"alias":"academicdegree","type":"model","model":"academicdegree","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"competence","type":"model","model":"competence","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true}],"label":"Competencedegreelink","attributes":{"identification":{"type":"string"},"url":{"type":"string"},"description_fi":{"type":"text","required":true},"description_en":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"academicdegree":{"model":"academicdegree","via":"competencedegreelinks"},"competence":{"model":"competence","via":"competencedegreelinks"}},"relations":{"academicdegree":{"alias":"academicdegree","type":"model","model":"academicdegree","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Academicdegree","displayedAttribute":"identification"},"competence":{"alias":"competence","type":"model","model":"competence","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Competence","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""}},"displayedField":"id","fields":["url","description_fi","description_en","description_sv","identification"],"relations":["academicdegree","competence"]},"labelPlural":"Competencedegreelinks","fields":{"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Competencedegreelink","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"fieldofstudy":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}],"search":true,"collectionName":"fieldofstudies","orm":"bookshelf","bulkActions":true,"info":{"name":"fieldofstudy","description":"Ala"},"globalName":"Fieldofstudy","associations":[],"label":"Fieldofstudy","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true}},"relations":{},"editDisplay":{"availableFields":{"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_fi","name_en","name_sv"],"relations":[]},"labelPlural":"Fieldofstudies","fields":{"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Fieldofstudy","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"nqf":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Level","description":"","type":"enumeration","disabled":false,"name":"level","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}],"search":true,"collectionName":"nqfs","orm":"bookshelf","bulkActions":true,"info":{"name":"nqf","description":"NQF taso"},"globalName":"Nqf","associations":[],"label":"Nqf","attributes":{"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true}},"relations":{},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"level":{"label":"Level","type":"enumeration","description":"","name":"level","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_sv","level"],"relations":[]},"labelPlural":"Nqfs","fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"level":{"label":"Level","description":"","type":"enumeration","disabled":false,"name":"level","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Nqf","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"organization":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true}],"search":true,"collectionName":"organizations","orm":"bookshelf","bulkActions":true,"info":{"name":"organization","description":"Järjestöt"},"globalName":"Organization","associations":[{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field"},{"alias":"competences","type":"collection","collection":"competence","via":"organization","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"Organization","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"competences":{"collection":"competence","via":"organization","isVirtual":true}},"relations":{"logo":{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field","description":"","label":"Logo","displayedAttribute":"name"},"competences":{"alias":"competences","type":"collection","collection":"competence","via":"organization","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competences","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_sv","description_fi","description_en","description_sv","url","logoUrl","logo"],"relations":["competences"]},"labelPlural":"Organizations","fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Organization","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"school":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true}],"search":true,"collectionName":"schools","orm":"bookshelf","bulkActions":true,"info":{"name":"school","description":"Oppilaitokset"},"globalName":"School","associations":[{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field"},{"alias":"academicdegrees","type":"collection","collection":"academicdegree","via":"school","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"School","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"academicdegrees":{"collection":"academicdegree","via":"school","isVirtual":true}},"relations":{"logo":{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field","description":"","label":"Logo","displayedAttribute":"name"},"academicdegrees":{"alias":"academicdegrees","type":"collection","collection":"academicdegree","via":"school","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Academicdegrees","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_sv","description_en","description_fi","description_sv","url","logoUrl","logo"],"relations":["academicdegrees"]},"labelPlural":"Schools","fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"School","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"}},"layout":{"user":{"actions":{"create":"User.create","update":"User.update","destroy":"User.destroy","deleteall":"User.destroyAll"},"attributes":{"username":{"className":"col-md-6"},"email":{"className":"col-md-6"},"resetPasswordToken":{"className":"d-none"},"role":{"className":"d-none"}}},"academicdegree":{"attributes":{}},"competence":{"attributes":{}},"competencedegreelink":{"attributes":{}},"fieldofstudy":{"attributes":{}},"nqf":{"attributes":{}},"organization":{"attributes":{}},"school":{"attributes":{}}}}	object		
1	db_model_schools	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"academicdegrees":{"collection":"academicdegree","via":"school","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
21	db_model_strapi_administrator	{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"required":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"blocked":{"type":"boolean","default":false,"configurable":false}}	object	\N	\N
8	db_model_users-permissions_user	{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
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
5	org2	org2	org2	\N	\N	\N	\N	\N	2019-06-03 08:29:23.736+00	2019-06-03 08:29:23.756+00
6	org3	org3	org3	\N	\N	\N	\N	\N	2019-06-03 08:29:33.73+00	2019-06-03 08:29:33.748+00
4	org1 has a long name that doesn't fit on one row_en	org1 sillä on pitkä nimi joka ei aina mahdu yhdelle riville_fi	org1 har ett långt namn som inte passar på en rad_sv	org1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._fi	org1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._en	org1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._sv	\N	\N	2019-06-03 08:29:14.188+00	2019-06-03 08:38:33.118+00
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.schools (id, name_en, name_fi, name_sv, description_en, description_fi, description_sv, url, "logoUrl", created_at, updated_at) FROM stdin;
8	school2	school2	school2	\N	\N	\N	\N	\N	2019-06-03 08:29:05.438+00	2019-06-03 08:29:05.456+00
9	school3	school3	school3	\N	\N	\N	\N	\N	2019-06-03 08:29:42.279+00	2019-06-03 08:29:42.301+00
7	school1  has a long name that doesn't fit on one row_sv	school1 nimi ei mahdu yhdelle riville koska se on hirmu pitkä_fi	school1  har ett långt namn som inte passar på en rad_sv	school1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._en	school1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._fi	school1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec enim lectus, luctus nec lorem id, laoreet vestibulum justo. Curabitur imperdiet ac magna eu ornare. Ut vehicula eleifend vestibulum. Mauris eget purus et libero finibus malesuada. Maecenas magna libero, pellentesque cursus varius sed, aliquam eu felis. Maecenas congue augue vehicula massa tincidunt tincidunt. Suspendisse potenti. Suspendisse vulputate nisi eget nunc interdum ultricies. Etiam urna velit, imperdiet eget sollicitudin sit amet, suscipit eget augue. Ut commodo enim nec dapibus porttitor. Donec id congue tortor, a ullamcorper metus. Vivamus vel eros vel orci auctor lobortis. Cras ac neque diam.\n\nVivamus luctus dignissim odio, sit amet tristique nisl bibendum ac. Quisque ullamcorper eros et hendrerit scelerisque. Pellentesque vehicula ex urna, ut tempus ante efficitur a. Aliquam metus nibh, vulputate a augue ac, auctor ullamcorper mi. Donec vitae facilisis ante, sagittis egestas mi. Nunc dignissim velit vitae ullamcorper suscipit. Sed posuere, est non tempor molestie, elit nibh consectetur metus, sit amet tincidunt ante nibh quis ex. Sed vestibulum at dolor vel pulvinar._sv	\N	\N	2019-06-03 08:28:57.373+00	2019-06-03 08:39:35.828+00
\.


--
-- Data for Name: strapi_administrator; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.strapi_administrator (id, username, email, password, "resetPasswordToken", blocked) FROM stdin;
1	partioadmin	partioadmin@test.com	$2a$10$ZClj1MD0FYTDZ4f.fqv8Ye90eS/2iXHmxjj1VqZ3eqHLWfCTrDFD6	\N	\N
\.


--
-- Data for Name: upload_file; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.upload_file (id, name, hash, sha256, ext, mime, size, url, provider, public_id, created_at, updated_at) FROM stdin;
1	partio_logo_rgb_musta.png	47e6cc24d26c4e5bb69f22f640d40c31	kbcAsQ3rSaLpRwyMCNxdbRE60cS_Uix1g7aixh2MqZg	.png	image/png	12.91	/uploads/47e6cc24d26c4e5bb69f22f640d40c31.png	local	\N	2019-05-29 08:12:00.005+00	2019-05-29 08:12:00.048+00
\.


--
-- Data for Name: upload_file_morph; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.upload_file_morph (id, upload_file_id, related_id, related_type, field) FROM stdin;
1	1	1	organizations	logo
\.


--
-- Data for Name: users-permissions_permission; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."users-permissions_permission" (id, type, controller, action, enabled, policy, role) FROM stdin;
1	application	academicdegree	find	f		1
2	application	academicdegree	findone	f		1
3	application	academicdegree	count	f		1
4	application	academicdegree	create	f		1
5	application	academicdegree	update	f		1
6	application	academicdegree	delete	f		1
7	application	academicdegree	destroy	f		1
8	application	competence	find	f		1
9	application	competence	findone	f		1
10	application	competence	count	f		1
11	application	competence	create	f		1
12	application	competence	delete	f		1
13	application	competence	update	f		1
14	application	competence	destroy	f		1
15	application	competencedegreelink	find	f		1
16	application	competencedegreelink	findone	f		1
17	application	competencedegreelink	count	f		1
18	application	competencedegreelink	create	f		1
19	application	competencedegreelink	update	f		1
20	application	competencedegreelink	delete	f		1
21	application	competencedegreelink	destroy	f		1
22	application	fieldofstudy	find	f		1
23	application	fieldofstudy	findone	f		1
24	application	fieldofstudy	count	f		1
25	application	fieldofstudy	create	f		1
26	application	fieldofstudy	update	f		1
27	application	fieldofstudy	delete	f		1
28	application	fieldofstudy	destroy	f		1
29	application	nqf	find	f		1
30	application	nqf	findone	f		1
31	application	nqf	count	f		1
32	application	nqf	create	f		1
33	application	nqf	update	f		1
34	application	nqf	delete	f		1
35	application	nqf	destroy	f		1
36	application	organization	find	f		1
37	application	organization	findone	f		1
38	application	organization	count	f		1
39	application	organization	create	f		1
40	application	organization	update	f		1
41	application	organization	delete	f		1
42	application	organization	destroy	f		1
43	application	school	find	f		1
44	application	school	findone	f		1
45	application	school	update	f		1
46	application	school	create	f		1
47	application	school	count	f		1
48	application	school	delete	f		1
49	application	school	destroy	f		1
50	settings-manager	settingsmanager	menu	f		1
51	settings-manager	settingsmanager	environments	f		1
52	settings-manager	settingsmanager	languages	f		1
53	settings-manager	settingsmanager	databases	f		1
54	settings-manager	settingsmanager	database	f		1
55	settings-manager	settingsmanager	databasemodel	f		1
56	settings-manager	settingsmanager	get	f		1
57	settings-manager	settingsmanager	update	f		1
58	settings-manager	settingsmanager	createlanguage	f		1
59	settings-manager	settingsmanager	deletelanguage	f		1
60	settings-manager	settingsmanager	createdatabase	f		1
61	settings-manager	settingsmanager	updatedatabase	f		1
62	settings-manager	settingsmanager	deletedatabase	f		1
63	content-type-builder	contenttypebuilder	getmodels	f		1
64	content-type-builder	contenttypebuilder	getmodel	f		1
65	content-type-builder	contenttypebuilder	getconnections	f		1
66	content-type-builder	contenttypebuilder	createmodel	f		1
67	content-type-builder	contenttypebuilder	updatemodel	f		1
68	content-type-builder	contenttypebuilder	checktableexists	f		1
69	content-type-builder	contenttypebuilder	deletemodel	f		1
70	content-manager	contentmanager	count	f		1
71	content-manager	contentmanager	update	f		1
72	content-manager	contentmanager	updatesettings	f		1
73	content-manager	contentmanager	create	f		1
74	content-manager	contentmanager	findone	f		1
75	content-manager	contentmanager	delete	f		1
76	content-manager	contentmanager	models	f		1
77	content-manager	contentmanager	find	f		1
78	content-manager	contentmanager	deleteall	f		1
79	users-permissions	auth	callback	f		1
80	users-permissions	auth	changepassword	f		1
81	users-permissions	auth	connect	t		1
82	users-permissions	auth	forgotpassword	f		1
83	users-permissions	auth	register	f		1
84	users-permissions	auth	emailconfirmation	f		1
85	users-permissions	user	find	f		1
86	users-permissions	user	me	t		1
87	users-permissions	user	findone	f		1
88	users-permissions	user	create	f		1
89	users-permissions	user	update	f		1
90	users-permissions	user	destroy	f		1
91	users-permissions	user	destroyall	f		1
92	users-permissions	userspermissions	deleteprovider	f		1
93	users-permissions	userspermissions	createrole	f		1
94	users-permissions	userspermissions	deleterole	f		1
95	users-permissions	userspermissions	getpermissions	f		1
96	users-permissions	userspermissions	getpolicies	f		1
97	users-permissions	userspermissions	getrole	f		1
98	users-permissions	userspermissions	getroles	f		1
99	users-permissions	userspermissions	getroutes	f		1
100	users-permissions	userspermissions	index	f		1
101	users-permissions	userspermissions	init	t		1
102	users-permissions	userspermissions	searchusers	f		1
103	users-permissions	userspermissions	updaterole	f		1
110	email	email	send	f		1
104	users-permissions	userspermissions	getemailtemplate	f		1
118	upload	upload	upload	f		1
173	settings-manager	settingsmanager	environments	f		2
183	settings-manager	settingsmanager	updatedatabase	f		2
237	upload	upload	getenvironments	f		2
150	application	fieldofstudy	destroy	f		2
163	application	organization	count	f		2
128	application	academicdegree	delete	f		2
140	application	competencedegreelink	findone	t		2
213	users-permissions	user	destroyall	f		2
227	users-permissions	userspermissions	updateemailtemplate	f		2
203	users-permissions	auth	connect	t		2
193	content-manager	contentmanager	find	f		2
105	users-permissions	userspermissions	updateemailtemplate	f		1
115	upload	upload	getenvironments	f		1
182	settings-manager	settingsmanager	createdatabase	f		2
172	settings-manager	settingsmanager	menu	f		2
238	upload	upload	getsettings	f		2
149	application	fieldofstudy	create	f		2
162	application	organization	findone	t		2
127	application	academicdegree	count	f		2
137	application	competencedegreelink	find	t		2
212	users-permissions	user	destroy	f		2
228	users-permissions	userspermissions	getadvancedsettings	f		2
202	users-permissions	auth	changepassword	t		2
192	content-manager	contentmanager	models	f		2
106	users-permissions	userspermissions	getadvancedsettings	f		1
117	upload	upload	getsettings	f		1
179	settings-manager	settingsmanager	update	f		2
244	upload	upload	search	f		2
146	application	fieldofstudy	count	f		2
136	application	competence	destroy	f		2
156	application	nqf	delete	f		2
169	application	school	update	f		2
126	application	academicdegree	update	f		2
189	content-type-builder	contenttypebuilder	updatemodel	f		2
209	users-permissions	user	findone	f		2
224	users-permissions	userspermissions	searchusers	f		2
218	users-permissions	userspermissions	getrole	f		2
234	email	email	getsettings	f		2
199	content-manager	contentmanager	delete	f		2
107	users-permissions	userspermissions	updateadvancedsettings	f		1
114	upload	upload	updatesettings	f		1
175	settings-manager	settingsmanager	databases	f		2
236	upload	upload	upload	f		2
145	application	fieldofstudy	findone	t		2
135	application	competence	delete	f		2
155	application	nqf	update	f		2
165	application	school	find	t		2
125	application	academicdegree	findone	t		2
185	content-type-builder	contenttypebuilder	getmodels	f		2
226	users-permissions	userspermissions	getemailtemplate	f		2
216	users-permissions	userspermissions	deleteprovider	f		2
205	users-permissions	auth	register	t		2
195	content-manager	contentmanager	findone	f		2
108	users-permissions	userspermissions	getproviders	f		1
116	upload	upload	find	f		1
184	settings-manager	settingsmanager	deletedatabase	f		2
174	settings-manager	settingsmanager	languages	f		2
240	upload	upload	find	f		2
144	application	fieldofstudy	find	t		2
134	application	competence	update	f		2
164	application	organization	destroy	f		2
154	application	nqf	create	f		2
124	application	academicdegree	create	f		2
230	users-permissions	userspermissions	getproviders	f		2
217	users-permissions	userspermissions	createrole	f		2
204	users-permissions	auth	forgotpassword	t		2
194	content-manager	contentmanager	count	f		2
109	users-permissions	userspermissions	updateproviders	f		1
119	upload	upload	findone	f		1
180	settings-manager	settingsmanager	createlanguage	f		2
241	upload	upload	findone	f		2
148	application	fieldofstudy	delete	f		2
160	application	organization	find	t		2
170	application	school	delete	f		2
129	application	academicdegree	destroy	f		2
138	application	competencedegreelink	count	f		2
190	content-type-builder	contenttypebuilder	deletemodel	f		2
210	users-permissions	user	create	f		2
219	users-permissions	userspermissions	getroles	f		2
221	users-permissions	userspermissions	init	t		2
231	users-permissions	userspermissions	updateproviders	f		2
200	content-manager	contentmanager	deleteall	f		2
111	email	email	getenvironments	f		1
121	upload	upload	destroy	f		1
177	settings-manager	settingsmanager	databasemodel	f		2
131	application	competence	findone	t		2
158	application	organization	create	f		2
151	application	nqf	find	t		2
167	application	school	count	f		2
141	application	competencedegreelink	update	f		2
187	content-type-builder	contenttypebuilder	getconnections	f		2
215	users-permissions	userspermissions	deleterole	f		2
225	users-permissions	userspermissions	updaterole	f		2
206	users-permissions	auth	emailconfirmation	t		2
235	email	email	updatesettings	f		2
196	content-manager	contentmanager	update	f		2
112	email	email	getsettings	f		1
122	upload	upload	search	f		1
178	settings-manager	settingsmanager	get	f		2
239	upload	upload	updatesettings	f		2
132	application	competence	count	f		2
159	application	organization	update	f		2
152	application	nqf	findone	t		2
168	application	school	create	f		2
142	application	competencedegreelink	delete	f		2
188	content-type-builder	contenttypebuilder	createmodel	f		2
208	users-permissions	user	me	t		2
220	users-permissions	userspermissions	getpolicies	f		2
229	users-permissions	userspermissions	updateadvancedsettings	f		2
198	content-manager	contentmanager	updatesettings	f		2
113	email	email	updatesettings	f		1
181	settings-manager	settingsmanager	deletelanguage	f		2
243	upload	upload	destroy	f		2
133	application	competence	create	f		2
161	application	organization	delete	f		2
153	application	nqf	count	f		2
171	application	school	destroy	f		2
123	application	academicdegree	find	t		2
143	application	competencedegreelink	destroy	f		2
191	content-type-builder	contenttypebuilder	checktableexists	f		2
211	users-permissions	user	update	f		2
223	users-permissions	userspermissions	getroutes	f		2
201	users-permissions	auth	callback	t		2
233	email	email	getenvironments	f		2
120	upload	upload	count	f		1
176	settings-manager	settingsmanager	database	f		2
242	upload	upload	count	f		2
147	application	fieldofstudy	update	f		2
130	application	competence	find	t		2
157	application	nqf	destroy	f		2
166	application	school	findone	t		2
139	application	competencedegreelink	create	f		2
186	content-type-builder	contenttypebuilder	getmodel	f		2
207	users-permissions	user	find	f		2
214	users-permissions	userspermissions	getpermissions	f		2
222	users-permissions	userspermissions	index	f		2
232	email	email	send	f		2
197	content-manager	contentmanager	create	f		2
\.


--
-- Data for Name: users-permissions_role; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."users-permissions_role" (id, name, description, type) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated
2	Public	Default role given to unauthenticated user.	public
\.


--
-- Data for Name: users-permissions_user; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."users-permissions_user" (id, username, email, provider, password, "resetPasswordToken", confirmed, blocked, role, created_at, updated_at) FROM stdin;
\.


--
-- Name: academicdegrees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.academicdegrees_id_seq', 6, true);


--
-- Name: competence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.competence_id_seq', 10, true);


--
-- Name: competencedegreelinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.competencedegreelinks_id_seq', 12, true);


--
-- Name: core_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.core_store_id_seq', 21, true);


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

SELECT pg_catalog.setval('public.organizations_id_seq', 6, true);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.schools_id_seq', 9, true);


--
-- Name: strapi_administrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.strapi_administrator_id_seq', 1, true);


--
-- Name: upload_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.upload_file_id_seq', 1, true);


--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.upload_file_morph_id_seq', 1, true);


--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."users-permissions_permission_id_seq"', 244, true);


--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."users-permissions_role_id_seq"', 2, true);


--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."users-permissions_user_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

