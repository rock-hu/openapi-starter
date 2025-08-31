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
-- Name: survey_question_option; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_question_option (
    survey_question_id character varying(20) NOT NULL,
    survey_option_seq_id character varying(20) NOT NULL,
    description character varying(255),
    sequence_num numeric(20,0),
    amount_base numeric(18,2),
    amount_base_uom_id character varying(20),
    weight_factor double precision,
    duration numeric(20,0),
    duration_uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_question_option OWNER TO ofbiz;

--
-- Name: survey_question_option pk_survey_question_option; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question_option
    ADD CONSTRAINT pk_survey_question_option PRIMARY KEY (survey_question_id, survey_option_seq_id);


--
-- Name: srv_qsn_opn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_qsn_opn_txcrts ON survey_question_option USING btree (created_tx_stamp);


--
-- Name: srv_qsn_opn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_qsn_opn_txstmp ON survey_question_option USING btree (last_updated_tx_stamp);


--
-- Name: srvyqstop_srvyq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyqstop_srvyq ON survey_question_option USING btree (survey_question_id);


--
-- Name: survey_question_option srvyqstop_srvyq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question_option
    ADD CONSTRAINT srvyqstop_srvyq FOREIGN KEY (survey_question_id) REFERENCES survey_question(survey_question_id);


--
-- PostgreSQL database dump complete
--

