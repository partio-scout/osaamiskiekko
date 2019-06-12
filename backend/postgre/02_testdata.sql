--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3 (Debian 11.3-1.pgdg90+1)
-- Dumped by pg_dump version 11.3 (Debian 11.3-1.pgdg90+1)

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
1	db_model_schools	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"academicdegrees":{"collection":"academicdegree","via":"school","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
9	db_model_upload_file	{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
13	db_model_upload_file_morph	{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"}}	object	\N	\N
14	plugin_content-manager_schema	{"generalSettings":{"search":true,"filters":true,"bulkActions":true,"pageEntries":10},"models":{"plugins":{"upload":{"file":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true}],"search":true,"collectionName":"upload_file","orm":"bookshelf","bulkActions":true,"info":{"name":"file","description":""},"globalName":"UploadFile","associations":[{"alias":"related","type":"collection","related":["Organization","School"],"nature":"manyMorphToOne","autoPopulate":true,"filter":"field"}],"label":"File","attributes":{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false}},"relations":{"related":{"alias":"related","type":"collection","related":["Organization","School"],"nature":"manyMorphToOne","autoPopulate":true,"filter":"field","description":"","label":"Related","displayedAttribute":"id"}},"editDisplay":{"availableFields":{"size":{"label":"Size","type":"string","description":"","name":"size","editable":true,"placeholder":""},"ext":{"label":"Ext","type":"string","description":"","name":"ext","editable":true,"placeholder":""},"sha256":{"label":"Sha256","type":"string","description":"","name":"sha256","editable":true,"placeholder":""},"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"hash":{"label":"Hash","type":"string","description":"","name":"hash","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"public_id":{"label":"Public_id","type":"string","description":"","name":"public_id","editable":true,"placeholder":""},"mime":{"label":"Mime","type":"string","description":"","name":"mime","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","hash","sha256","ext","mime","size","url","provider","public_id"],"relations":[]},"labelPlural":"Files","fields":{"size":{"label":"Size","description":"","type":"string","disabled":false,"name":"size","sortable":true,"searchable":true},"ext":{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true},"sha256":{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"hash":{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"public_id":{"label":"Public_id","description":"","type":"string","disabled":false,"name":"public_id","sortable":true,"searchable":true},"mime":{"label":"Mime","description":"","type":"string","disabled":false,"name":"mime","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UploadFile","sort":"ASC","options":{"timestamps":["created_at","updated_at"]},"connection":"default","defaultSort":"id"}},"users-permissions":{"permission":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true}],"search":true,"collectionName":"users-permissions_permission","orm":"bookshelf","bulkActions":true,"info":{"name":"permission","description":""},"globalName":"UsersPermissionsPermission","associations":[{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"label":"Permission","attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}},"relations":{"role":{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}},"editDisplay":{"availableFields":{"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""},"controller":{"label":"Controller","type":"string","description":"","name":"controller","editable":true,"placeholder":""},"action":{"label":"Action","type":"string","description":"","name":"action","editable":true,"placeholder":""},"enabled":{"label":"Enabled","type":"boolean","description":"","name":"enabled","editable":true,"placeholder":""},"policy":{"label":"Policy","type":"string","description":"","name":"policy","editable":true,"placeholder":""}},"displayedField":"id","fields":["type","controller","action","enabled","policy"],"relations":["role"]},"labelPlural":"Permissions","fields":{"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},"controller":{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},"action":{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},"enabled":{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true},"policy":{"label":"Policy","description":"","type":"string","disabled":false,"name":"policy","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UsersPermissionsPermission","sort":"ASC","options":{"timestamps":false},"connection":"default","defaultSort":"id"},"role":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}],"search":true,"collectionName":"users-permissions_role","orm":"bookshelf","bulkActions":true,"info":{"name":"role","description":""},"globalName":"UsersPermissionsRole","associations":[{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"},{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"label":"Role","attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}},"relations":{"permissions":{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Permissions","displayedAttribute":"type"},"users":{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Users","displayedAttribute":"username"}},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"string","description":"","name":"description","editable":true,"placeholder":""},"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","type"],"relations":["permissions","users"]},"labelPlural":"Roles","fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UsersPermissionsRole","sort":"ASC","options":{"timestamps":false},"connection":"default","defaultSort":"id"},"user":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true}],"search":true,"collectionName":"users-permissions_user","orm":"bookshelf","bulkActions":true,"info":{"name":"user","description":""},"globalName":"UsersPermissionsUser","associations":[{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"label":"User","attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}},"relations":{"role":{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}},"editDisplay":{"availableFields":{"username":{"label":"Username","type":"string","description":"","name":"username","editable":true,"placeholder":""},"email":{"label":"Email","type":"email","description":"","name":"email","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"password":{"label":"Password","type":"password","description":"","name":"password","editable":true,"placeholder":""},"confirmed":{"label":"Confirmed","type":"boolean","description":"","name":"confirmed","editable":true,"placeholder":""},"blocked":{"label":"Blocked","type":"boolean","description":"","name":"blocked","editable":true,"placeholder":""}},"displayedField":"id","fields":["username","email","provider","password","confirmed","blocked"],"relations":["role"]},"labelPlural":"Users","fields":{"username":{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},"email":{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"password":{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true},"confirmed":{"label":"Confirmed","description":"","type":"boolean","disabled":false,"name":"confirmed","sortable":true,"searchable":true},"blocked":{"label":"Blocked","description":"","type":"boolean","disabled":false,"name":"blocked","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"UsersPermissionsUser","sort":"ASC","options":{"timestamps":false},"connection":"default","defaultSort":"id"}}},"academicdegree":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}],"search":true,"collectionName":"academicdegrees","orm":"bookshelf","bulkActions":true,"info":{"name":"academicdegree","description":"Oppilaitosten tutkinnot"},"globalName":"Academicdegree","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"school","type":"model","model":"school","via":"academicdegrees","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"fieldofstudy","type":"model","model":"fieldofstudy","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"Academicdegree","attributes":{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text","required":true},"description_fi":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"model":"nqf"},"school":{"model":"school","via":"academicdegrees"},"fieldofstudy":{"model":"fieldofstudy"},"competencedegreelinks":{"collection":"competencedegreelink","via":"academicdegree","isVirtual":true}},"relations":{"nqf":{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Nqf","displayedAttribute":"name_en"},"school":{"alias":"school","type":"model","model":"school","via":"academicdegrees","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"School","displayedAttribute":"name_en"},"fieldofstudy":{"alias":"fieldofstudy","type":"model","model":"fieldofstudy","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Fieldofstudy","displayedAttribute":"name_en"},"competencedegreelinks":{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"academicdegree","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competencedegreelinks","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""}},"displayedField":"id","fields":["identification","name_en","name_fi","name_sv","description_en","description_fi","description_sv","url","credits"],"relations":["nqf","school","fieldofstudy","competencedegreelinks"]},"labelPlural":"Academicdegrees","fields":{"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Academicdegree","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"competence":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true}],"search":true,"collectionName":"competence","orm":"bookshelf","bulkActions":true,"info":{"name":"competence","description":"Järjestön koulutus"},"globalName":"Competence","associations":[{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true},{"alias":"organization","type":"model","model":"organization","via":"competences","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"competence","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"Competence","attributes":{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"description_en":{"type":"text"},"url":{"type":"string"},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"nqf":{"model":"nqf"},"credits":{"type":"integer"},"organization":{"model":"organization","via":"competences"},"competencedegreelinks":{"collection":"competencedegreelink","via":"competence","isVirtual":true}},"relations":{"nqf":{"alias":"nqf","type":"model","model":"nqf","nature":"oneWay","autoPopulate":true,"dominant":true,"description":"","label":"Nqf","displayedAttribute":"name_en"},"organization":{"alias":"organization","type":"model","model":"organization","via":"competences","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Organization","displayedAttribute":"name_en"},"competencedegreelinks":{"alias":"competencedegreelinks","type":"collection","collection":"competencedegreelink","via":"competence","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competencedegreelinks","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"credits":{"label":"Credits","type":"integer","description":"","name":"credits","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""}},"displayedField":"id","fields":["identification","name_en","description_en","url","name_fi","name_sv","description_fi","description_sv","credits"],"relations":["nqf","organization","competencedegreelinks"]},"labelPlural":"Competences","fields":{"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"credits":{"label":"Credits","description":"","type":"integer","disabled":false,"name":"credits","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Competence","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"competencedegreelink":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true}],"search":true,"collectionName":"competencedegreelinks","orm":"bookshelf","bulkActions":true,"info":{"name":"competencedegreelink","description":"Koulutus tutkinto. "},"globalName":"Competencedegreelink","associations":[{"alias":"academicdegree","type":"model","model":"academicdegree","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true},{"alias":"competence","type":"model","model":"competence","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true}],"label":"Competencedegreelink","attributes":{"identification":{"type":"string"},"url":{"type":"string"},"description_fi":{"type":"text","required":true},"description_en":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"academicdegree":{"model":"academicdegree","via":"competencedegreelinks"},"competence":{"model":"competence","via":"competencedegreelinks"}},"relations":{"academicdegree":{"alias":"academicdegree","type":"model","model":"academicdegree","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Academicdegree","displayedAttribute":"identification"},"competence":{"alias":"competence","type":"model","model":"competence","via":"competencedegreelinks","nature":"manyToOne","autoPopulate":true,"dominant":true,"description":"","label":"Competence","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"identification":{"label":"Identification","type":"string","description":"","name":"identification","editable":true,"placeholder":""}},"displayedField":"id","fields":["url","description_fi","description_en","description_sv","identification"],"relations":["academicdegree","competence"]},"labelPlural":"Competencedegreelinks","fields":{"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"identification":{"label":"Identification","description":"","type":"string","disabled":false,"name":"identification","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Competencedegreelink","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"fieldofstudy":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}],"search":true,"collectionName":"fieldofstudies","orm":"bookshelf","bulkActions":true,"info":{"name":"fieldofstudy","description":"Ala"},"globalName":"Fieldofstudy","associations":[],"label":"Fieldofstudy","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true}},"relations":{},"editDisplay":{"availableFields":{"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_fi","name_en","name_sv"],"relations":[]},"labelPlural":"Fieldofstudies","fields":{"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Fieldofstudy","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"nqf":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Level","description":"","type":"enumeration","disabled":false,"name":"level","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true}],"search":true,"collectionName":"nqfs","orm":"bookshelf","bulkActions":true,"info":{"name":"nqf","description":"NQF taso"},"globalName":"Nqf","associations":[],"label":"Nqf","attributes":{"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true}},"relations":{},"editDisplay":{"availableFields":{"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"level":{"label":"Level","type":"enumeration","description":"","name":"level","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_sv","level"],"relations":[]},"labelPlural":"Nqfs","fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"level":{"label":"Level","description":"","type":"enumeration","disabled":false,"name":"level","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Nqf","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"organization":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true}],"search":true,"collectionName":"organizations","orm":"bookshelf","bulkActions":true,"info":{"name":"organization","description":"Järjestöt"},"globalName":"Organization","associations":[{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field"},{"alias":"competences","type":"collection","collection":"competence","via":"organization","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"Organization","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"competences":{"collection":"competence","via":"organization","isVirtual":true}},"relations":{"logo":{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field","description":"","label":"Logo","displayedAttribute":"name"},"competences":{"alias":"competences","type":"collection","collection":"competence","via":"organization","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Competences","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_sv","description_fi","description_en","description_sv","url","logoUrl","logo"],"relations":["competences"]},"labelPlural":"Organizations","fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"Organization","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"school":{"pageEntries":10,"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true}],"search":true,"collectionName":"schools","orm":"bookshelf","bulkActions":true,"info":{"name":"school","description":"Oppilaitokset"},"globalName":"School","associations":[{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field"},{"alias":"academicdegrees","type":"collection","collection":"academicdegree","via":"school","nature":"oneToMany","autoPopulate":true,"dominant":true}],"label":"School","attributes":{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text"},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"academicdegrees":{"collection":"academicdegree","via":"school","isVirtual":true}},"relations":{"logo":{"alias":"logo","type":"model","model":"file","via":"related","nature":"oneToManyMorph","autoPopulate":true,"dominant":true,"plugin":"upload","filter":"field","description":"","label":"Logo","displayedAttribute":"name"},"academicdegrees":{"alias":"academicdegrees","type":"collection","collection":"academicdegree","via":"school","nature":"oneToMany","autoPopulate":true,"dominant":true,"description":"","label":"Academicdegrees","displayedAttribute":"identification"}},"editDisplay":{"availableFields":{"logoUrl":{"label":"LogoUrl","type":"string","description":"","name":"logoUrl","editable":true,"placeholder":""},"description_sv":{"label":"Description_sv","type":"text","description":"","name":"description_sv","editable":true,"placeholder":""},"description_fi":{"label":"Description_fi","type":"text","description":"","name":"description_fi","editable":true,"placeholder":""},"logo":{"description":"","editable":true,"label":"Logo","multiple":false,"name":"logo","placeholder":"","type":"file","disabled":false},"description_en":{"label":"Description_en","type":"text","description":"","name":"description_en","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"name_sv":{"label":"Name_sv","type":"string","description":"","name":"name_sv","editable":true,"placeholder":""},"name_fi":{"label":"Name_fi","type":"string","description":"","name":"name_fi","editable":true,"placeholder":""},"name_en":{"label":"Name_en","type":"string","description":"","name":"name_en","editable":true,"placeholder":""}},"displayedField":"id","fields":["name_en","name_fi","name_sv","description_en","description_fi","description_sv","url","logoUrl","logo"],"relations":["academicdegrees"]},"labelPlural":"Schools","fields":{"name_en":{"label":"Name_en","description":"","type":"string","disabled":false,"name":"name_en","sortable":true,"searchable":true},"name_fi":{"label":"Name_fi","description":"","type":"string","disabled":false,"name":"name_fi","sortable":true,"searchable":true},"name_sv":{"label":"Name_sv","description":"","type":"string","disabled":false,"name":"name_sv","sortable":true,"searchable":true},"description_en":{"label":"Description_en","description":"","type":"text","disabled":false,"name":"description_en","sortable":true,"searchable":true},"description_fi":{"label":"Description_fi","description":"","type":"text","disabled":false,"name":"description_fi","sortable":true,"searchable":true},"description_sv":{"label":"Description_sv","description":"","type":"text","disabled":false,"name":"description_sv","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"logoUrl":{"label":"LogoUrl","description":"","type":"string","disabled":false,"name":"logoUrl","sortable":true,"searchable":true}},"filters":true,"primaryKey":"id","globalId":"School","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"connection":"default","defaultSort":"id"},"page":{"label":"Page","labelPlural":"Pages","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"path_identifier":{"label":"Path_identifier","type":"string","description":"","name":"path_identifier","editable":true,"placeholder":""},"title_en":{"label":"Title_en","type":"string","description":"","name":"title_en","editable":true,"placeholder":""},"title_fi":{"label":"Title_fi","type":"string","description":"","name":"title_fi","editable":true,"placeholder":""},"title_sv":{"label":"Title_sv","type":"string","description":"","name":"title_sv","editable":true,"placeholder":""},"text_en":{"label":"Text_en","type":"text","description":"","name":"text_en","editable":true,"placeholder":""},"text_fi":{"label":"Text_fi","type":"text","description":"","name":"text_fi","editable":true,"placeholder":""},"text_sv":{"label":"Text_sv","type":"text","description":"","name":"text_sv","editable":true,"placeholder":""}},"displayedField":"id","fields":["path_identifier","title_en","title_fi","title_sv","text_en","text_fi","text_sv"],"relations":[]},"info":{"name":"page","description":"Muiden sivujen sisältö"},"connection":"default","collectionName":"pages","attributes":{"path_identifier":{"unique":true,"required":true,"type":"string"},"title_en":{"type":"string"},"title_fi":{"type":"string"},"title_sv":{"type":"string"},"text_en":{"type":"text"},"text_fi":{"type":"text"},"text_sv":{"type":"text"}},"globalId":"Page","globalName":"Page","primaryKey":"id","associations":[],"fields":{"path_identifier":{"label":"Path_identifier","description":"","type":"string","disabled":false,"name":"path_identifier","sortable":true,"searchable":true},"title_en":{"label":"Title_en","description":"","type":"string","disabled":false,"name":"title_en","sortable":true,"searchable":true},"title_fi":{"label":"Title_fi","description":"","type":"string","disabled":false,"name":"title_fi","sortable":true,"searchable":true},"title_sv":{"label":"Title_sv","description":"","type":"string","disabled":false,"name":"title_sv","sortable":true,"searchable":true},"text_en":{"label":"Text_en","description":"","type":"text","disabled":false,"name":"text_en","sortable":true,"searchable":true},"text_fi":{"label":"Text_fi","description":"","type":"text","disabled":false,"name":"text_fi","sortable":true,"searchable":true},"text_sv":{"label":"Text_sv","description":"","type":"text","disabled":false,"name":"text_sv","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Path_identifier","description":"","type":"string","disabled":false,"name":"path_identifier","sortable":true,"searchable":true},{"label":"Title_en","description":"","type":"string","disabled":false,"name":"title_en","sortable":true,"searchable":true},{"label":"Title_fi","description":"","type":"string","disabled":false,"name":"title_fi","sortable":true,"searchable":true},{"label":"Title_sv","description":"","type":"string","disabled":false,"name":"title_sv","sortable":true,"searchable":true}],"relations":{}}},"layout":{"user":{"actions":{"create":"User.create","update":"User.update","destroy":"User.destroy","deleteall":"User.destroyAll"},"attributes":{"username":{"className":"col-md-6"},"email":{"className":"col-md-6"},"resetPasswordToken":{"className":"d-none"},"role":{"className":"d-none"}}},"academicdegree":{"attributes":{}},"competence":{"attributes":{}},"competencedegreelink":{"attributes":{}},"fieldofstudy":{"attributes":{}},"nqf":{"attributes":{}},"organization":{"attributes":{}},"school":{"attributes":{}},"page":{"attributes":{"text_en":{"appearance":"WYSIWYG"},"text_fi":{"appearance":"WYSIWYG"},"text_sv":{"appearance":"WYSIWYG"}}}}}	object		
12	db_model_organizations	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_en":{"type":"text"},"description_sv":{"type":"text"},"url":{"type":"string"},"logo":{"model":"file","via":"related","plugin":"upload"},"logoUrl":{"type":"string"},"competences":{"collection":"competence","via":"organization","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
5	db_model_competencedegreelinks	{"identification":{"type":"string"},"url":{"type":"string"},"description_fi":{"type":"text","required":true},"description_en":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"academicdegree":{"model":"academicdegree","via":"competencedegreelinks"},"competence":{"model":"competence","via":"competencedegreelinks"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
7	db_model_nqfs	{"level":{"enum":["1","2","3","4","5","6","7","8"],"type":"enumeration","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
8	db_model_users-permissions_user	{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}}	object	\N	\N
6	db_model_core_store	{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}	object	\N	\N
3	db_model_academicdegrees	{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_en":{"type":"text","required":true},"description_fi":{"type":"text","required":true},"description_sv":{"type":"text","required":true},"url":{"type":"string"},"credits":{"type":"integer"},"nqf":{"model":"nqf"},"school":{"model":"school","via":"academicdegrees"},"fieldofstudy":{"model":"fieldofstudy"},"competencedegreelinks":{"collection":"competencedegreelink","via":"academicdegree","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
2	db_model_competence	{"identification":{"type":"string","required":true},"name_en":{"type":"string","required":true},"description_en":{"type":"text"},"url":{"type":"string"},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"description_fi":{"type":"text"},"description_sv":{"type":"text"},"nqf":{"model":"nqf"},"credits":{"type":"integer"},"organization":{"model":"organization","via":"competences"},"competencedegreelinks":{"collection":"competencedegreelink","via":"competence","isVirtual":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
4	db_model_users-permissions_permission	{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}}	object	\N	\N
10	db_model_fieldofstudies	{"name_en":{"type":"string","required":true},"name_fi":{"type":"string","required":true},"name_sv":{"type":"string","required":true},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
11	db_model_users-permissions_role	{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}}	object	\N	\N
21	db_model_pages	{"path_identifier":{"unique":true,"required":true,"type":"string"},"title_en":{"type":"string"},"title_fi":{"type":"string"},"title_sv":{"type":"string"},"text_en":{"type":"text"},"text_fi":{"type":"text"},"text_sv":{"type":"text"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
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
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.pages (id, path_identifier, title_en, title_fi, title_sv, text_en, text_fi, text_sv, created_at, updated_at) FROM stdin;
1	tietoa	Information	Tietoa	Information	Information page	Tietoa -sivu	Informationssida	2019-06-12 09:19:45.712+00	2019-06-12 09:19:45.734+00
2	otayhteytta	Really really really really really really really really really really long title!	Ota yhteyttä		Contact page	Ota yhteyttä -sivu	Contact page	2019-06-12 09:21:49.709+00	2019-06-12 09:21:49.722+00
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
352	application	page	find	t		1
353	application	page	findone	t		1
354	application	page	create	t		1
355	application	page	update	t		1
356	application	page	destroy	t		1
357	application	page	count	t		1
358	application	page	findone	f		2
359	application	page	find	f		2
360	application	page	count	f		2
361	application	page	create	f		2
362	application	page	update	f		2
363	application	page	destroy	f		2
364	application	page	find	f		3
365	application	page	findone	f		3
366	application	page	count	f		3
367	application	page	create	f		3
368	application	page	update	f		3
369	application	page	destroy	f		3
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
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.pages_id_seq', 2, true);


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.schools_id_seq', 9, true);


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

SELECT pg_catalog.setval('public."users-permissions_permission_id_seq"', 369, true);


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

