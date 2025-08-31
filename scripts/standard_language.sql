--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: standard_language; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE standard_language (
    standard_language_id character varying(20) NOT NULL,
    lang_code3t character varying(10),
    lang_code3b character varying(10),
    lang_code2 character varying(10),
    lang_name character varying(60),
    lang_family character varying(60),
    lang_charset character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.standard_language OWNER TO ofbiz;

--
-- Name: standard_language pk_standard_language; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY standard_language
    ADD CONSTRAINT pk_standard_language PRIMARY KEY (standard_language_id);


--
-- Name: stndrd_lngg_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX stndrd_lngg_txcrts ON standard_language USING btree (created_tx_stamp);


--
-- Name: stndrd_lngg_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX stndrd_lngg_txstmp ON standard_language USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

