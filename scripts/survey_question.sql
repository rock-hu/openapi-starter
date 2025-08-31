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
-- Name: survey_question; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_question (
    survey_question_id character varying(20) NOT NULL,
    survey_question_category_id character varying(20),
    survey_question_type_id character varying(20),
    description character varying(255),
    question text,
    hint text,
    enum_type_id character varying(20),
    geo_id character varying(20),
    format_string character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_question OWNER TO ofbiz;

--
-- Name: survey_question pk_survey_question; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question
    ADD CONSTRAINT pk_survey_question PRIMARY KEY (survey_question_id);


--
-- Name: srv_qstn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_qstn_txcrts ON survey_question USING btree (created_tx_stamp);


--
-- Name: srv_qstn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_qstn_txstmp ON survey_question USING btree (last_updated_tx_stamp);


--
-- Name: srvyqst_geo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyqst_geo ON survey_question USING btree (geo_id);


--
-- Name: srvyqst_srvyqtct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyqst_srvyqtct ON survey_question USING btree (survey_question_category_id);


--
-- Name: srvyqst_srvyqtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyqst_srvyqtp ON survey_question USING btree (survey_question_type_id);


--
-- Name: survey_question srvyqst_geo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question
    ADD CONSTRAINT srvyqst_geo FOREIGN KEY (geo_id) REFERENCES geo(geo_id);


--
-- Name: survey_question srvyqst_srvyqtct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question
    ADD CONSTRAINT srvyqst_srvyqtct FOREIGN KEY (survey_question_category_id) REFERENCES survey_question_category(survey_question_category_id);


--
-- Name: survey_question srvyqst_srvyqtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question
    ADD CONSTRAINT srvyqst_srvyqtp FOREIGN KEY (survey_question_type_id) REFERENCES survey_question_type(survey_question_type_id);


--
-- PostgreSQL database dump complete
--

