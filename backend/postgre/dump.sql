--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

-- DROP DATABASE mydb;




--
-- Drop roles
--

-- DROP ROLE myuser;


--
-- Roles
--

-- CREATE ROLE myuser;
ALTER ROLE myuser WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md554fdba1dac1d18ce9c2d57a03502a8ff';






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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: myuser
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO myuser;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: myuser
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: myuser
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: myuser
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

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
-- Name: mydb; Type: DATABASE; Schema: -; Owner: myuser
--

-- CREATE DATABASE mydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE mydb OWNER TO myuser;

\connect mydb

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
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: core_store; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.core_store (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.core_store OWNER TO myuser;

--
-- Name: core_store_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.core_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_store_id_seq OWNER TO myuser;

--
-- Name: core_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.core_store_id_seq OWNED BY public.core_store.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.organizations (
    id integer NOT NULL,
    name character varying(255),
    description text,
    url character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.organizations OWNER TO myuser;

--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.organizations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizations_id_seq OWNER TO myuser;

--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.organizations_id_seq OWNED BY public.organizations.id;


--
-- Name: upload_file; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.upload_file (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    hash character varying(255) NOT NULL,
    sha256 character varying(255),
    ext character varying(255),
    mime character varying(255) NOT NULL,
    size character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    provider character varying(255) NOT NULL,
    public_id character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.upload_file OWNER TO myuser;

--
-- Name: upload_file_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.upload_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_file_id_seq OWNER TO myuser;

--
-- Name: upload_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.upload_file_id_seq OWNED BY public.upload_file.id;


--
-- Name: upload_file_morph; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.upload_file_morph (
    id integer NOT NULL,
    upload_file_id integer,
    related_id integer,
    related_type text,
    field text
);


ALTER TABLE public.upload_file_morph OWNER TO myuser;

--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.upload_file_morph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_file_morph_id_seq OWNER TO myuser;

--
-- Name: upload_file_morph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.upload_file_morph_id_seq OWNED BY public.upload_file_morph.id;


--
-- Name: users-permissions_permission; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."users-permissions_permission" (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    controller character varying(255) NOT NULL,
    action character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    policy character varying(255),
    role integer
);


ALTER TABLE public."users-permissions_permission" OWNER TO myuser;

--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public."users-permissions_permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-permissions_permission_id_seq" OWNER TO myuser;

--
-- Name: users-permissions_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public."users-permissions_permission_id_seq" OWNED BY public."users-permissions_permission".id;


--
-- Name: users-permissions_role; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."users-permissions_role" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255)
);


ALTER TABLE public."users-permissions_role" OWNER TO myuser;

--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public."users-permissions_role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-permissions_role_id_seq" OWNER TO myuser;

--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public."users-permissions_role_id_seq" OWNED BY public."users-permissions_role".id;


--
-- Name: users-permissions_user; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."users-permissions_user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    provider character varying(255),
    password character varying(255),
    "resetPasswordToken" character varying(255),
    confirmed boolean,
    blocked boolean,
    role integer
);


ALTER TABLE public."users-permissions_user" OWNER TO myuser;

--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public."users-permissions_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users-permissions_user_id_seq" OWNER TO myuser;

--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public."users-permissions_user_id_seq" OWNED BY public."users-permissions_user".id;


--
-- Name: core_store id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.core_store ALTER COLUMN id SET DEFAULT nextval('public.core_store_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


--
-- Name: upload_file id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.upload_file ALTER COLUMN id SET DEFAULT nextval('public.upload_file_id_seq'::regclass);


--
-- Name: upload_file_morph id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.upload_file_morph ALTER COLUMN id SET DEFAULT nextval('public.upload_file_morph_id_seq'::regclass);


--
-- Name: users-permissions_permission id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."users-permissions_permission" ALTER COLUMN id SET DEFAULT nextval('public."users-permissions_permission_id_seq"'::regclass);


--
-- Name: users-permissions_role id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."users-permissions_role" ALTER COLUMN id SET DEFAULT nextval('public."users-permissions_role_id_seq"'::regclass);


--
-- Name: users-permissions_user id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."users-permissions_user" ALTER COLUMN id SET DEFAULT nextval('public."users-permissions_user_id_seq"'::regclass);


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
14	db_model_organizations	{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
5	db_model_upload_file	{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false},"created_at":{"type":"timestamp"},"updated_at":{"type":"timestampUpdate"}}	object	\N	\N
4	db_model_users-permissions_role	{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}}	object	\N	\N
2	db_model_core_store	{"key":{"type":"string"},"value":{"type":"text"},"type":{"type":"string"},"environment":{"type":"string"},"tag":{"type":"string"}}	object	\N	\N
1	db_model_users-permissions_permission	{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}}	object	\N	\N
3	db_model_users-permissions_user	{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}}	object	\N	\N
6	db_model_upload_file_morph	{"upload_file_id":{"type":"integer"},"related_id":{"type":"integer"},"related_type":{"type":"text"},"field":{"type":"text"}}	object	\N	\N
7	plugin_content-manager_schema	{"generalSettings":{"search":true,"filters":true,"bulkActions":true,"pageEntries":10},"models":{"plugins":{"upload":{"file":{"label":"File","labelPlural":"Files","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":["created_at","updated_at"]},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"hash":{"label":"Hash","type":"string","description":"","name":"hash","editable":true,"placeholder":""},"sha256":{"label":"Sha256","type":"string","description":"","name":"sha256","editable":true,"placeholder":""},"ext":{"label":"Ext","type":"string","description":"","name":"ext","editable":true,"placeholder":""},"mime":{"label":"Mime","type":"string","description":"","name":"mime","editable":true,"placeholder":""},"size":{"label":"Size","type":"string","description":"","name":"size","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"public_id":{"label":"Public_id","type":"string","description":"","name":"public_id","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","hash","sha256","ext","mime","size","url","provider","public_id"],"relations":[]},"info":{"name":"file","description":""},"connection":"default","collectionName":"upload_file","attributes":{"name":{"type":"string","configurable":false,"required":true},"hash":{"type":"string","configurable":false,"required":true},"sha256":{"type":"string","configurable":false},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"string","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"provider":{"type":"string","configurable":false,"required":true},"public_id":{"type":"string","configurable":false},"related":{"collection":"*","filter":"field","configurable":false}},"globalId":"UploadFile","globalName":"UploadFile","primaryKey":"id","associations":[{"alias":"related","type":"collection","related":[],"nature":"manyMorphToMany","autoPopulate":true,"filter":"field"}],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"hash":{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},"sha256":{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},"ext":{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true},"mime":{"label":"Mime","description":"","type":"string","disabled":false,"name":"mime","sortable":true,"searchable":true},"size":{"label":"Size","description":"","type":"string","disabled":false,"name":"size","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"public_id":{"label":"Public_id","description":"","type":"string","disabled":false,"name":"public_id","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Hash","description":"","type":"string","disabled":false,"name":"hash","sortable":true,"searchable":true},{"label":"Sha256","description":"","type":"string","disabled":false,"name":"sha256","sortable":true,"searchable":true},{"label":"Ext","description":"","type":"string","disabled":false,"name":"ext","sortable":true,"searchable":true}],"relations":{"related":{"alias":"related","type":"collection","related":[],"nature":"manyMorphToMany","autoPopulate":true,"filter":"field","description":"","label":"Related","displayedAttribute":"id"}}}},"users-permissions":{"permission":{"label":"Permission","labelPlural":"Permissions","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""},"controller":{"label":"Controller","type":"string","description":"","name":"controller","editable":true,"placeholder":""},"action":{"label":"Action","type":"string","description":"","name":"action","editable":true,"placeholder":""},"enabled":{"label":"Enabled","type":"boolean","description":"","name":"enabled","editable":true,"placeholder":""},"policy":{"label":"Policy","type":"string","description":"","name":"policy","editable":true,"placeholder":""}},"displayedField":"id","fields":["type","controller","action","enabled","policy"],"relations":["role"]},"info":{"name":"permission","description":""},"connection":"default","collectionName":"users-permissions_permission","attributes":{"type":{"type":"string","required":true,"configurable":false},"controller":{"type":"string","required":true,"configurable":false},"action":{"type":"string","required":true,"configurable":false},"enabled":{"type":"boolean","required":true,"configurable":false},"policy":{"type":"string","configurable":false},"role":{"model":"role","via":"permissions","plugin":"users-permissions","configurable":false}},"globalId":"UsersPermissionsPermission","globalName":"UsersPermissionsPermission","primaryKey":"id","associations":[{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},"controller":{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},"action":{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},"enabled":{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true},"policy":{"label":"Policy","description":"","type":"string","disabled":false,"name":"policy","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true},{"label":"Controller","description":"","type":"string","disabled":false,"name":"controller","sortable":true,"searchable":true},{"label":"Action","description":"","type":"string","disabled":false,"name":"action","sortable":true,"searchable":true},{"label":"Enabled","description":"","type":"boolean","disabled":false,"name":"enabled","sortable":true,"searchable":true}],"relations":{"role":{"alias":"role","type":"model","model":"role","via":"permissions","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}}},"role":{"label":"Role","labelPlural":"Roles","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"string","description":"","name":"description","editable":true,"placeholder":""},"type":{"label":"Type","type":"string","description":"","name":"type","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","type"],"relations":["permissions","users"]},"info":{"name":"role","description":""},"connection":"default","collectionName":"users-permissions_role","attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"collection":"permission","via":"role","plugin":"users-permissions","configurable":false,"isVirtual":true},"users":{"collection":"user","via":"role","configurable":false,"plugin":"users-permissions","isVirtual":true}},"globalId":"UsersPermissionsRole","globalName":"UsersPermissionsRole","primaryKey":"id","associations":[{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"},{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},"type":{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"string","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Type","description":"","type":"string","disabled":false,"name":"type","sortable":true,"searchable":true}],"relations":{"permissions":{"alias":"permissions","type":"collection","collection":"permission","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Permissions","displayedAttribute":"type"},"users":{"alias":"users","type":"collection","collection":"user","via":"role","nature":"oneToMany","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Users","displayedAttribute":"username"}}},"user":{"label":"User","labelPlural":"Users","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"timestamps":false},"editDisplay":{"availableFields":{"username":{"label":"Username","type":"string","description":"","name":"username","editable":true,"placeholder":""},"email":{"label":"Email","type":"email","description":"","name":"email","editable":true,"placeholder":""},"provider":{"label":"Provider","type":"string","description":"","name":"provider","editable":true,"placeholder":""},"password":{"label":"Password","type":"password","description":"","name":"password","editable":true,"placeholder":""},"confirmed":{"label":"Confirmed","type":"boolean","description":"","name":"confirmed","editable":true,"placeholder":""},"blocked":{"label":"Blocked","type":"boolean","description":"","name":"blocked","editable":true,"placeholder":""}},"displayedField":"id","fields":["username","email","provider","password","confirmed","blocked"],"relations":["role"]},"info":{"name":"user","description":""},"connection":"default","collectionName":"users-permissions_user","attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"model":"role","via":"users","plugin":"users-permissions","configurable":false}},"globalId":"UsersPermissionsUser","globalName":"UsersPermissionsUser","primaryKey":"id","associations":[{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions"}],"fields":{"username":{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},"email":{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},"provider":{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},"password":{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true},"confirmed":{"label":"Confirmed","description":"","type":"boolean","disabled":false,"name":"confirmed","sortable":true,"searchable":true},"blocked":{"label":"Blocked","description":"","type":"boolean","disabled":false,"name":"blocked","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Username","description":"","type":"string","disabled":false,"name":"username","sortable":true,"searchable":true},{"label":"Email","description":"","type":"email","disabled":false,"name":"email","sortable":true,"searchable":true},{"label":"Provider","description":"","type":"string","disabled":false,"name":"provider","sortable":true,"searchable":true},{"label":"Password","description":"","type":"password","disabled":false,"name":"password","sortable":true,"searchable":true}],"relations":{"role":{"alias":"role","type":"model","model":"role","via":"users","nature":"manyToOne","autoPopulate":true,"dominant":true,"plugin":"users-permissions","description":"","label":"Role","displayedAttribute":"name"}}}}},"organization":{"label":"Organization","labelPlural":"Organizations","orm":"bookshelf","search":true,"filters":true,"bulkActions":true,"pageEntries":10,"defaultSort":"id","sort":"ASC","options":{"increments":true,"timestamps":["created_at","updated_at"],"comment":""},"editDisplay":{"availableFields":{"name":{"label":"Name","type":"string","description":"","name":"name","editable":true,"placeholder":""},"description":{"label":"Description","type":"text","description":"","name":"description","editable":true,"placeholder":""},"url":{"label":"Url","type":"string","description":"","name":"url","editable":true,"placeholder":""}},"displayedField":"id","fields":["name","description","url"],"relations":[]},"info":{"name":"organization","description":"organisaation datamalli"},"connection":"default","collectionName":"organizations","attributes":{"name":{"type":"string"},"description":{"type":"text"},"url":{"type":"string"}},"globalId":"Organization","globalName":"Organization","primaryKey":"id","associations":[],"fields":{"name":{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},"description":{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},"url":{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true}},"listDisplay":[{"name":"id","label":"Id","type":"string","sortable":true,"searchable":true},{"label":"Name","description":"","type":"string","disabled":false,"name":"name","sortable":true,"searchable":true},{"label":"Description","description":"","type":"text","disabled":false,"name":"description","sortable":true,"searchable":true},{"label":"Url","description":"","type":"string","disabled":false,"name":"url","sortable":true,"searchable":true}],"relations":{}}},"layout":{"user":{"actions":{"create":"User.create","update":"User.update","destroy":"User.destroy","deleteall":"User.destroyAll"},"attributes":{"username":{"className":"col-md-6"},"email":{"className":"col-md-6"},"resetPasswordToken":{"className":"d-none"},"role":{"className":"d-none"}}},"organization":{"attributes":{}}}}	object		
\.


--
-- Data for Name: organizations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public.organizations (id, name, description, url, created_at, updated_at) FROM stdin;
1	Haaga-Helia	Haaga-Helia is a strongly business orientated university of applied sciences in Finland. Through education, research and development, we prepare professionals for business and services. We focus on co-operation, entrepreneurship, innovation and internationality.	http://www.haaga-helia.fi/en/frontpage	2019-04-26 08:43:24.592+00	2019-04-26 08:43:24.61+00
2	Metropolia	Metropolia Ammatti­korkeakoulu - Osaamista ja oivallusta tulevaisuuden tekemiseen\n	https://www.metropolia.fi/	2019-04-26 08:43:50.741+00	2019-04-26 08:43:50.754+00
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
151	content-manager	contentmanager	models	f		3
161	content-type-builder	contenttypebuilder	getmodel	f		3
171	email	email	updatesettings	f		3
181	settings-manager	settingsmanager	deletelanguage	f		3
191	upload	upload	findone	f		3
201	users-permissions	user	find	f		3
211	users-permissions	userspermissions	getpermissions	f		3
221	users-permissions	userspermissions	updateemailtemplate	f		3
102	settings-manager	settingsmanager	databasemodel	f		2
112	upload	upload	getenvironments	f		2
122	users-permissions	auth	connect	t		2
132	users-permissions	user	destroyall	f		2
142	users-permissions	userspermissions	init	t		2
152	content-manager	contentmanager	find	f		3
162	content-type-builder	contenttypebuilder	getconnections	f		3
172	settings-manager	settingsmanager	menu	f		3
182	settings-manager	settingsmanager	createdatabase	f		3
192	upload	upload	count	f		3
202	users-permissions	user	me	t		3
212	users-permissions	userspermissions	getpolicies	f		3
222	users-permissions	userspermissions	getadvancedsettings	f		3
103	settings-manager	settingsmanager	get	f		2
113	upload	upload	getsettings	f		2
123	users-permissions	auth	forgotpassword	f		2
133	users-permissions	userspermissions	createrole	f		2
143	users-permissions	userspermissions	searchusers	f		2
153	content-manager	contentmanager	count	f		3
163	content-type-builder	contenttypebuilder	createmodel	f		3
173	settings-manager	settingsmanager	environments	f		3
183	settings-manager	settingsmanager	updatedatabase	f		3
193	upload	upload	destroy	f		3
203	users-permissions	user	findone	f		3
213	users-permissions	userspermissions	getrole	f		3
223	users-permissions	userspermissions	updateadvancedsettings	f		3
104	settings-manager	settingsmanager	update	f		2
114	upload	upload	updatesettings	f		2
124	users-permissions	auth	register	f		2
134	users-permissions	userspermissions	deleteprovider	f		2
144	users-permissions	userspermissions	updaterole	f		2
154	content-manager	contentmanager	findone	f		3
164	content-type-builder	contenttypebuilder	updatemodel	f		3
174	settings-manager	settingsmanager	languages	f		3
184	settings-manager	settingsmanager	deletedatabase	f		3
194	upload	upload	search	f		3
204	users-permissions	user	create	f		3
214	users-permissions	userspermissions	getroles	f		3
224	users-permissions	userspermissions	getproviders	f		3
105	settings-manager	settingsmanager	createlanguage	f		2
115	upload	upload	find	f		2
125	users-permissions	auth	emailconfirmation	f		2
135	users-permissions	userspermissions	deleterole	f		2
145	users-permissions	userspermissions	getemailtemplate	f		2
155	content-manager	contentmanager	create	f		3
165	content-type-builder	contenttypebuilder	deletemodel	f		3
175	settings-manager	settingsmanager	databases	f		3
185	settings-manager	settingsmanager	autoreload	t		3
195	users-permissions	auth	callback	t		3
205	users-permissions	user	update	f		3
215	users-permissions	userspermissions	getroutes	f		3
225	users-permissions	userspermissions	updateproviders	f		3
106	settings-manager	settingsmanager	deletelanguage	f		2
116	upload	upload	findone	f		2
126	users-permissions	user	find	f		2
136	users-permissions	userspermissions	getpermissions	f		2
146	users-permissions	userspermissions	updateemailtemplate	f		2
156	content-manager	contentmanager	update	f		3
166	content-type-builder	contenttypebuilder	autoreload	t		3
176	settings-manager	settingsmanager	database	f		3
186	upload	upload	upload	f		3
196	users-permissions	auth	changepassword	t		3
206	users-permissions	user	destroy	f		3
216	users-permissions	userspermissions	index	f		3
107	settings-manager	settingsmanager	createdatabase	f		2
117	upload	upload	count	f		2
127	users-permissions	user	me	t		2
137	users-permissions	userspermissions	getpolicies	f		2
147	users-permissions	userspermissions	getadvancedsettings	f		2
157	content-manager	contentmanager	updatesettings	f		3
167	content-type-builder	contenttypebuilder	checktableexists	f		3
177	settings-manager	settingsmanager	databasemodel	f		3
187	upload	upload	getenvironments	f		3
197	users-permissions	auth	connect	t		3
207	users-permissions	user	destroyall	f		3
217	users-permissions	userspermissions	init	t		3
108	settings-manager	settingsmanager	updatedatabase	f		2
118	upload	upload	destroy	f		2
128	users-permissions	user	findone	f		2
138	users-permissions	userspermissions	getrole	f		2
148	users-permissions	userspermissions	updateadvancedsettings	f		2
158	content-manager	contentmanager	delete	f		3
168	email	email	send	f		3
178	settings-manager	settingsmanager	get	f		3
188	upload	upload	getsettings	f		3
198	users-permissions	auth	forgotpassword	t		3
208	users-permissions	userspermissions	createrole	f		3
218	users-permissions	userspermissions	searchusers	f		3
109	settings-manager	settingsmanager	deletedatabase	f		2
119	upload	upload	search	f		2
129	users-permissions	user	create	f		2
139	users-permissions	userspermissions	getroles	f		2
149	users-permissions	userspermissions	getproviders	f		2
159	content-manager	contentmanager	deleteall	f		3
169	email	email	getenvironments	f		3
179	settings-manager	settingsmanager	update	f		3
189	upload	upload	updatesettings	f		3
199	users-permissions	auth	register	t		3
209	users-permissions	userspermissions	deleteprovider	f		3
219	users-permissions	userspermissions	updaterole	f		3
110	settings-manager	settingsmanager	autoreload	t		2
120	users-permissions	auth	callback	f		2
130	users-permissions	user	update	f		2
140	users-permissions	userspermissions	getroutes	f		2
150	users-permissions	userspermissions	updateproviders	f		2
160	content-type-builder	contenttypebuilder	getmodels	f		3
170	email	email	getsettings	f		3
180	settings-manager	settingsmanager	createlanguage	f		3
190	upload	upload	find	f		3
200	users-permissions	auth	emailconfirmation	t		3
210	users-permissions	userspermissions	deleterole	f		3
220	users-permissions	userspermissions	getemailtemplate	f		3
226	application	organization	find	t		1
227	application	organization	findone	t		1
228	application	organization	count	t		1
229	application	organization	create	t		1
230	application	organization	update	t		1
231	application	organization	findone	f		2
232	application	organization	find	f		2
233	application	organization	count	f		2
234	application	organization	create	f		2
235	application	organization	destroy	t		1
236	application	organization	update	f		2
237	application	organization	destroy	f		2
238	application	organization	find	f		3
239	application	organization	findone	f		3
240	application	organization	count	f		3
241	application	organization	create	f		3
242	application	organization	update	f		3
243	application	organization	destroy	f		3
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
-- Name: core_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.core_store_id_seq', 14, true);


--
-- Name: organizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public.organizations_id_seq', 2, true);


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

SELECT pg_catalog.setval('public."users-permissions_permission_id_seq"', 243, true);


--
-- Name: users-permissions_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."users-permissions_role_id_seq"', 3, true);


--
-- Name: users-permissions_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myuser
--

SELECT pg_catalog.setval('public."users-permissions_user_id_seq"', 1, true);


--
-- Name: core_store core_store_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.core_store
    ADD CONSTRAINT core_store_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: upload_file_morph upload_file_morph_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.upload_file_morph
    ADD CONSTRAINT upload_file_morph_pkey PRIMARY KEY (id);


--
-- Name: upload_file upload_file_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.upload_file
    ADD CONSTRAINT upload_file_pkey PRIMARY KEY (id);


--
-- Name: users-permissions_permission users-permissions_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."users-permissions_permission"
    ADD CONSTRAINT "users-permissions_permission_pkey" PRIMARY KEY (id);


--
-- Name: users-permissions_role users-permissions_role_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."users-permissions_role"
    ADD CONSTRAINT "users-permissions_role_pkey" PRIMARY KEY (id);


--
-- Name: users-permissions_user users-permissions_user_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."users-permissions_user"
    ADD CONSTRAINT "users-permissions_user_pkey" PRIMARY KEY (id);


--
-- Name: search_core_store_environment; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_core_store_environment ON public.core_store USING gin (environment public.gin_trgm_ops);


--
-- Name: search_core_store_key; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_core_store_key ON public.core_store USING gin (key public.gin_trgm_ops);


--
-- Name: search_core_store_tag; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_core_store_tag ON public.core_store USING gin (tag public.gin_trgm_ops);


--
-- Name: search_core_store_type; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_core_store_type ON public.core_store USING gin (type public.gin_trgm_ops);


--
-- Name: search_core_store_value; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_core_store_value ON public.core_store USING gin (value public.gin_trgm_ops);


--
-- Name: search_organizations_description; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_description ON public.organizations USING gin (description public.gin_trgm_ops);


--
-- Name: search_organizations_name; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_name ON public.organizations USING gin (name public.gin_trgm_ops);


--
-- Name: search_organizations_url; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_url ON public.organizations USING gin (url public.gin_trgm_ops);


--
-- Name: search_upload_file_ext; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_ext ON public.upload_file USING gin (ext public.gin_trgm_ops);


--
-- Name: search_upload_file_hash; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_hash ON public.upload_file USING gin (hash public.gin_trgm_ops);


--
-- Name: search_upload_file_mime; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_mime ON public.upload_file USING gin (mime public.gin_trgm_ops);


--
-- Name: search_upload_file_morph_field; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_morph_field ON public.upload_file_morph USING gin (field public.gin_trgm_ops);


--
-- Name: search_upload_file_morph_related_type; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_morph_related_type ON public.upload_file_morph USING gin (related_type public.gin_trgm_ops);


--
-- Name: search_upload_file_name; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_name ON public.upload_file USING gin (name public.gin_trgm_ops);


--
-- Name: search_upload_file_provider; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_provider ON public.upload_file USING gin (provider public.gin_trgm_ops);


--
-- Name: search_upload_file_public_id; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_public_id ON public.upload_file USING gin (public_id public.gin_trgm_ops);


--
-- Name: search_upload_file_sha256; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_sha256 ON public.upload_file USING gin (sha256 public.gin_trgm_ops);


--
-- Name: search_upload_file_size; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_size ON public.upload_file USING gin (size public.gin_trgm_ops);


--
-- Name: search_upload_file_url; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_upload_file_url ON public.upload_file USING gin (url public.gin_trgm_ops);


--
-- Name: search_users_permissions_permission_action; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_permission_action ON public."users-permissions_permission" USING gin (action public.gin_trgm_ops);


--
-- Name: search_users_permissions_permission_controller; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_permission_controller ON public."users-permissions_permission" USING gin (controller public.gin_trgm_ops);


--
-- Name: search_users_permissions_permission_policy; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_permission_policy ON public."users-permissions_permission" USING gin (policy public.gin_trgm_ops);


--
-- Name: search_users_permissions_permission_type; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_permission_type ON public."users-permissions_permission" USING gin (type public.gin_trgm_ops);


--
-- Name: search_users_permissions_role_description; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_role_description ON public."users-permissions_role" USING gin (description public.gin_trgm_ops);


--
-- Name: search_users_permissions_role_name; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_role_name ON public."users-permissions_role" USING gin (name public.gin_trgm_ops);


--
-- Name: search_users_permissions_role_type; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_role_type ON public."users-permissions_role" USING gin (type public.gin_trgm_ops);


--
-- Name: search_users_permissions_user_provider; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_user_provider ON public."users-permissions_user" USING gin (provider public.gin_trgm_ops);


--
-- Name: search_users_permissions_user_resetpasswordtoken; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_user_resetpasswordtoken ON public."users-permissions_user" USING gin ("resetPasswordToken" public.gin_trgm_ops);


--
-- Name: search_users_permissions_user_username; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_users_permissions_user_username ON public."users-permissions_user" USING gin (username public.gin_trgm_ops);


--
-- PostgreSQL database dump complete
--

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: myuser
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO myuser;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: myuser
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

