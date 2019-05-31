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
-- Name: academicdegrees; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.academicdegrees (
    id integer NOT NULL,
    identification character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL,
    name_fi character varying(255) NOT NULL,
    name_sv character varying(255) NOT NULL,
    description_en text NOT NULL,
    description_fi text NOT NULL,
    description_sv text NOT NULL,
    url character varying(255),
    credits integer,
    nqf integer,
    school integer,
    fieldofstudy integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.academicdegrees OWNER TO myuser;

--
-- Name: academicdegrees_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.academicdegrees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.academicdegrees_id_seq OWNER TO myuser;

--
-- Name: academicdegrees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.academicdegrees_id_seq OWNED BY public.academicdegrees.id;


--
-- Name: competence; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.competence (
    id integer NOT NULL,
    identification character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL,
    description_en text,
    url character varying(255),
    name_fi character varying(255) NOT NULL,
    name_sv character varying(255) NOT NULL,
    description_fi text,
    description_sv text,
    nqf integer,
    credits integer,
    organization integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.competence OWNER TO myuser;

--
-- Name: competence_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.competence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competence_id_seq OWNER TO myuser;

--
-- Name: competence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.competence_id_seq OWNED BY public.competence.id;


--
-- Name: competencedegreelinks; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.competencedegreelinks (
    id integer NOT NULL,
    url character varying(255),
    description_fi text NOT NULL,
    description_en text NOT NULL,
    description_sv text NOT NULL,
    competence integer,
    academicdegree integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    identification character varying(255)
);


ALTER TABLE public.competencedegreelinks OWNER TO myuser;

--
-- Name: competencedegreelinks_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.competencedegreelinks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competencedegreelinks_id_seq OWNER TO myuser;

--
-- Name: competencedegreelinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.competencedegreelinks_id_seq OWNED BY public.competencedegreelinks.id;


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
-- Name: fieldofstudies; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.fieldofstudies (
    id integer NOT NULL,
    name_fi character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL,
    name_sv character varying(255) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.fieldofstudies OWNER TO myuser;

--
-- Name: fieldofstudies_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.fieldofstudies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fieldofstudies_id_seq OWNER TO myuser;

--
-- Name: fieldofstudies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.fieldofstudies_id_seq OWNED BY public.fieldofstudies.id;


--
-- Name: nqfs; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.nqfs (
    id integer NOT NULL,
    name_en character varying(255) NOT NULL,
    name_fi character varying(255) NOT NULL,
    name_sv character varying(255) NOT NULL,
    level character varying(255) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.nqfs OWNER TO myuser;

--
-- Name: nqfs_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.nqfs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nqfs_id_seq OWNER TO myuser;

--
-- Name: nqfs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.nqfs_id_seq OWNED BY public.nqfs.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.organizations (
    id integer NOT NULL,
    name_en character varying(255) NOT NULL,
    name_fi character varying(255) NOT NULL,
    name_sv character varying(255) NOT NULL,
    description_fi text,
    description_en text,
    description_sv text,
    url character varying(255),
    "logoUrl" character varying(255),
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
-- Name: schools; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public.schools (
    id integer NOT NULL,
    name_en character varying(255) NOT NULL,
    name_fi character varying(255) NOT NULL,
    name_sv character varying(255) NOT NULL,
    description_en text,
    description_fi text,
    description_sv text,
    url character varying(255),
    "logoUrl" character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.schools OWNER TO myuser;

--
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: myuser
--

CREATE SEQUENCE public.schools_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schools_id_seq OWNER TO myuser;

--
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myuser
--

ALTER SEQUENCE public.schools_id_seq OWNED BY public.schools.id;


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
-- Name: academicdegrees id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.academicdegrees ALTER COLUMN id SET DEFAULT nextval('public.academicdegrees_id_seq'::regclass);


--
-- Name: competence id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.competence ALTER COLUMN id SET DEFAULT nextval('public.competence_id_seq'::regclass);


--
-- Name: competencedegreelinks id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.competencedegreelinks ALTER COLUMN id SET DEFAULT nextval('public.competencedegreelinks_id_seq'::regclass);


--
-- Name: core_store id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.core_store ALTER COLUMN id SET DEFAULT nextval('public.core_store_id_seq'::regclass);


--
-- Name: fieldofstudies id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.fieldofstudies ALTER COLUMN id SET DEFAULT nextval('public.fieldofstudies_id_seq'::regclass);


--
-- Name: nqfs id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.nqfs ALTER COLUMN id SET DEFAULT nextval('public.nqfs_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.organizations ALTER COLUMN id SET DEFAULT nextval('public.organizations_id_seq'::regclass);


--
-- Name: schools id; Type: DEFAULT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.schools ALTER COLUMN id SET DEFAULT nextval('public.schools_id_seq'::regclass);


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
-- Name: academicdegrees academicdegrees_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.academicdegrees
    ADD CONSTRAINT academicdegrees_pkey PRIMARY KEY (id);


--
-- Name: competence competence_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.competence
    ADD CONSTRAINT competence_pkey PRIMARY KEY (id);


--
-- Name: competencedegreelinks competencedegreelinks_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.competencedegreelinks
    ADD CONSTRAINT competencedegreelinks_pkey PRIMARY KEY (id);


--
-- Name: core_store core_store_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.core_store
    ADD CONSTRAINT core_store_pkey PRIMARY KEY (id);


--
-- Name: fieldofstudies fieldofstudies_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.fieldofstudies
    ADD CONSTRAINT fieldofstudies_pkey PRIMARY KEY (id);


--
-- Name: nqfs nqfs_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.nqfs
    ADD CONSTRAINT nqfs_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


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
-- Name: search_academicdegrees_description_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_academicdegrees_description_en ON public.academicdegrees USING gin (description_en public.gin_trgm_ops);


--
-- Name: search_academicdegrees_description_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_academicdegrees_description_fi ON public.academicdegrees USING gin (description_fi public.gin_trgm_ops);


--
-- Name: search_academicdegrees_description_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_academicdegrees_description_sv ON public.academicdegrees USING gin (description_sv public.gin_trgm_ops);


--
-- Name: search_academicdegrees_identification; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_academicdegrees_identification ON public.academicdegrees USING gin (identification public.gin_trgm_ops);


--
-- Name: search_academicdegrees_name_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_academicdegrees_name_en ON public.academicdegrees USING gin (name_en public.gin_trgm_ops);


--
-- Name: search_academicdegrees_name_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_academicdegrees_name_fi ON public.academicdegrees USING gin (name_fi public.gin_trgm_ops);


--
-- Name: search_academicdegrees_name_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_academicdegrees_name_sv ON public.academicdegrees USING gin (name_sv public.gin_trgm_ops);


--
-- Name: search_academicdegrees_url; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_academicdegrees_url ON public.academicdegrees USING gin (url public.gin_trgm_ops);


--
-- Name: search_competence_description_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competence_description_en ON public.competence USING gin (description_en public.gin_trgm_ops);


--
-- Name: search_competence_description_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competence_description_fi ON public.competence USING gin (description_fi public.gin_trgm_ops);


--
-- Name: search_competence_description_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competence_description_sv ON public.competence USING gin (description_sv public.gin_trgm_ops);


--
-- Name: search_competence_identification; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competence_identification ON public.competence USING gin (identification public.gin_trgm_ops);


--
-- Name: search_competence_name_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competence_name_en ON public.competence USING gin (name_en public.gin_trgm_ops);


--
-- Name: search_competence_name_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competence_name_fi ON public.competence USING gin (name_fi public.gin_trgm_ops);


--
-- Name: search_competence_name_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competence_name_sv ON public.competence USING gin (name_sv public.gin_trgm_ops);


--
-- Name: search_competence_url; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competence_url ON public.competence USING gin (url public.gin_trgm_ops);


--
-- Name: search_competencedegreelinks_description_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competencedegreelinks_description_en ON public.competencedegreelinks USING gin (description_en public.gin_trgm_ops);


--
-- Name: search_competencedegreelinks_description_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competencedegreelinks_description_fi ON public.competencedegreelinks USING gin (description_fi public.gin_trgm_ops);


--
-- Name: search_competencedegreelinks_description_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competencedegreelinks_description_sv ON public.competencedegreelinks USING gin (description_sv public.gin_trgm_ops);


--
-- Name: search_competencedegreelinks_identification; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competencedegreelinks_identification ON public.competencedegreelinks USING gin (identification public.gin_trgm_ops);


--
-- Name: search_competencedegreelinks_url; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_competencedegreelinks_url ON public.competencedegreelinks USING gin (url public.gin_trgm_ops);


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
-- Name: search_fieldofstudies_name_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_fieldofstudies_name_en ON public.fieldofstudies USING gin (name_en public.gin_trgm_ops);


--
-- Name: search_fieldofstudies_name_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_fieldofstudies_name_fi ON public.fieldofstudies USING gin (name_fi public.gin_trgm_ops);


--
-- Name: search_fieldofstudies_name_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_fieldofstudies_name_sv ON public.fieldofstudies USING gin (name_sv public.gin_trgm_ops);


--
-- Name: search_nqfs_name_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_nqfs_name_en ON public.nqfs USING gin (name_en public.gin_trgm_ops);


--
-- Name: search_nqfs_name_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_nqfs_name_fi ON public.nqfs USING gin (name_fi public.gin_trgm_ops);


--
-- Name: search_nqfs_name_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_nqfs_name_sv ON public.nqfs USING gin (name_sv public.gin_trgm_ops);


--
-- Name: search_organizations_description_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_description_en ON public.organizations USING gin (description_en public.gin_trgm_ops);


--
-- Name: search_organizations_description_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_description_fi ON public.organizations USING gin (description_fi public.gin_trgm_ops);


--
-- Name: search_organizations_description_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_description_sv ON public.organizations USING gin (description_sv public.gin_trgm_ops);


--
-- Name: search_organizations_logourl; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_logourl ON public.organizations USING gin ("logoUrl" public.gin_trgm_ops);


--
-- Name: search_organizations_name_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_name_en ON public.organizations USING gin (name_en public.gin_trgm_ops);


--
-- Name: search_organizations_name_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_name_fi ON public.organizations USING gin (name_fi public.gin_trgm_ops);


--
-- Name: search_organizations_name_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_name_sv ON public.organizations USING gin (name_sv public.gin_trgm_ops);


--
-- Name: search_organizations_url; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_organizations_url ON public.organizations USING gin (url public.gin_trgm_ops);


--
-- Name: search_schools_description_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_schools_description_en ON public.schools USING gin (description_en public.gin_trgm_ops);


--
-- Name: search_schools_description_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_schools_description_fi ON public.schools USING gin (description_fi public.gin_trgm_ops);


--
-- Name: search_schools_description_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_schools_description_sv ON public.schools USING gin (description_sv public.gin_trgm_ops);


--
-- Name: search_schools_logourl; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_schools_logourl ON public.schools USING gin ("logoUrl" public.gin_trgm_ops);


--
-- Name: search_schools_name_en; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_schools_name_en ON public.schools USING gin (name_en public.gin_trgm_ops);


--
-- Name: search_schools_name_fi; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_schools_name_fi ON public.schools USING gin (name_fi public.gin_trgm_ops);


--
-- Name: search_schools_name_sv; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_schools_name_sv ON public.schools USING gin (name_sv public.gin_trgm_ops);


--
-- Name: search_schools_url; Type: INDEX; Schema: public; Owner: myuser
--

CREATE INDEX search_schools_url ON public.schools USING gin (url public.gin_trgm_ops);


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

