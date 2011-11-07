--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    login character varying(255),
    crypted_password character varying(255) NOT NULL,
    password_salt character varying(255) NOT NULL,
    persistence_token character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE artists (
    id integer NOT NULL,
    name character varying(1000),
    bio text,
    photo_url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE artists_id_seq OWNED BY artists.id;


--
-- Name: releases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE releases (
    id integer NOT NULL,
    catalogue_number character varying(255),
    title character varying(1000),
    duration character varying(255),
    track_listing text,
    release_date date,
    cover_art_url character varying(255),
    release_url character varying(1000),
    itunes_url character varying(255),
    mp3_sample_url character varying(255),
    description text,
    reviews text,
    artist_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    publisher character varying(255),
    published boolean DEFAULT true
);


--
-- Name: releases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE releases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE releases_id_seq OWNED BY releases.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE artists ALTER COLUMN id SET DEFAULT nextval('artists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE releases ALTER COLUMN id SET DEFAULT nextval('releases_id_seq'::regclass);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: artists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: releases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY releases
    ADD CONSTRAINT releases_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20100118094040');

INSERT INTO schema_migrations (version) VALUES ('20100118095808');

INSERT INTO schema_migrations (version) VALUES ('20100119165327');

INSERT INTO schema_migrations (version) VALUES ('20100716215014');

INSERT INTO schema_migrations (version) VALUES ('20100802163044');

INSERT INTO schema_migrations (version) VALUES ('20111106235230');