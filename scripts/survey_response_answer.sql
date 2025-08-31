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
-- Name: survey_response_answer; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_response_answer (
    survey_response_id character varying(20) NOT NULL,
    survey_question_id character varying(20) NOT NULL,
    survey_multi_resp_col_id character varying(20) NOT NULL,
    survey_multi_resp_id character varying(20),
    boolean_response character(1),
    currency_response numeric(18,2),
    float_response double precision,
    numeric_response numeric(20,0),
    text_response text,
    survey_option_seq_id character varying(20),
    content_id character varying(20),
    answered_date timestamp with time zone,
    amount_base numeric(18,2),
    amount_base_uom_id character varying(20),
    weight_factor double precision,
    duration numeric(20,0),
    duration_uom_id character varying(20),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_response_answer OWNER TO ofbiz;

--
-- Name: survey_response_answer pk_survey_response_answer; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_response_answer
    ADD CONSTRAINT pk_survey_response_answer PRIMARY KEY (survey_response_id, survey_question_id, survey_multi_resp_col_id);


--
-- Name: srv_rsps_anr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_rsps_anr_txcrs ON survey_response_answer USING btree (created_tx_stamp);


--
-- Name: srv_rsps_anr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_rsps_anr_txstp ON survey_response_answer USING btree (last_updated_tx_stamp);


--
-- Name: srvyrspa_cont; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyrspa_cont ON survey_response_answer USING btree (content_id);


--
-- Name: srvyrspa_opt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyrspa_opt ON survey_response_answer USING btree (survey_question_id, survey_option_seq_id);


--
-- Name: srvyrspa_svqu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyrspa_svqu ON survey_response_answer USING btree (survey_question_id);


--
-- Name: srvyrspa_svrsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyrspa_svrsp ON survey_response_answer USING btree (survey_response_id);


--
-- Name: survey_response_answer srvyrspa_cont; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_response_answer
    ADD CONSTRAINT srvyrspa_cont FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: survey_response_answer srvyrspa_opt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_response_answer
    ADD CONSTRAINT srvyrspa_opt FOREIGN KEY (survey_question_id, survey_option_seq_id) REFERENCES survey_question_option(survey_question_id, survey_option_seq_id);


--
-- Name: survey_response_answer srvyrspa_svqu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_response_answer
    ADD CONSTRAINT srvyrspa_svqu FOREIGN KEY (survey_question_id) REFERENCES survey_question(survey_question_id);


--
-- Name: survey_response_answer srvyrspa_svrsp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_response_answer
    ADD CONSTRAINT srvyrspa_svrsp FOREIGN KEY (survey_response_id) REFERENCES survey_response(survey_response_id);


--
-- PostgreSQL database dump complete
--

