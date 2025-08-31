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
-- Name: survey_question_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_question_category (
    survey_question_category_id character varying(20) NOT NULL,
    parent_category_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_question_category OWNER TO ofbiz;

--
-- Name: survey_question_category pk_survey_question_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question_category
    ADD CONSTRAINT pk_survey_question_category PRIMARY KEY (survey_question_category_id);


--
-- Name: srv_qsn_ctr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_qsn_ctr_txcrts ON survey_question_category USING btree (created_tx_stamp);


--
-- Name: srv_qsn_ctr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_qsn_ctr_txstmp ON survey_question_category USING btree (last_updated_tx_stamp);


--
-- Name: srvyqstct_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyqstct_par ON survey_question_category USING btree (parent_category_id);


--
-- Name: survey_question_category srvyqstct_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question_category
    ADD CONSTRAINT srvyqstct_par FOREIGN KEY (parent_category_id) REFERENCES survey_question_category(survey_question_category_id);


--
-- PostgreSQL database dump complete
--

