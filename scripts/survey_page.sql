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
-- Name: survey_page; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_page (
    survey_id character varying(20) NOT NULL,
    survey_page_seq_id character varying(20) NOT NULL,
    page_name character varying(100),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_page OWNER TO ofbiz;

--
-- Name: survey_page pk_survey_page; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_page
    ADD CONSTRAINT pk_survey_page PRIMARY KEY (survey_id, survey_page_seq_id);


--
-- Name: srvypage_srvy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvypage_srvy ON survey_page USING btree (survey_id);


--
-- Name: survey_page_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX survey_page_txcrts ON survey_page USING btree (created_tx_stamp);


--
-- Name: survey_page_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX survey_page_txstmp ON survey_page USING btree (last_updated_tx_stamp);


--
-- Name: survey_page srvypage_srvy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_page
    ADD CONSTRAINT srvypage_srvy FOREIGN KEY (survey_id) REFERENCES survey(survey_id);


--
-- PostgreSQL database dump complete
--

