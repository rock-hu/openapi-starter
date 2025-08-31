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
-- Name: survey; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey (
    survey_id character varying(20) NOT NULL,
    survey_name character varying(100),
    description character varying(255),
    comments character varying(255),
    submit_caption character varying(60),
    response_service character varying(255),
    is_anonymous character(1),
    allow_multiple character(1),
    allow_update character(1),
    acro_form_content_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey OWNER TO ofbiz;

--
-- Name: survey pk_survey; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey
    ADD CONSTRAINT pk_survey PRIMARY KEY (survey_id);


--
-- Name: survey_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX survey_txcrts ON survey USING btree (created_tx_stamp);


--
-- Name: survey_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX survey_txstmp ON survey USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

