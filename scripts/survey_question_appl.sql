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
-- Name: survey_question_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_question_appl (
    survey_id character varying(20) NOT NULL,
    survey_question_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    survey_page_seq_id character varying(20),
    survey_multi_resp_id character varying(20),
    survey_multi_resp_col_id character varying(20),
    required_field character(1),
    sequence_num numeric(20,0),
    external_field_ref character varying(255),
    with_survey_question_id character varying(20),
    with_survey_option_seq_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_question_appl OWNER TO ofbiz;

--
-- Name: survey_question_appl pk_survey_question_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question_appl
    ADD CONSTRAINT pk_survey_question_appl PRIMARY KEY (survey_id, survey_question_id, from_date);


--
-- Name: srv_qsn_apl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_qsn_apl_txcrts ON survey_question_appl USING btree (created_tx_stamp);


--
-- Name: srv_qsn_apl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_qsn_apl_txstmp ON survey_question_appl USING btree (last_updated_tx_stamp);


--
-- Name: srvyqstapl_srvy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyqstapl_srvy ON survey_question_appl USING btree (survey_id);


--
-- Name: srvyqstapl_srvyq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyqstapl_srvyq ON survey_question_appl USING btree (survey_question_id);


--
-- Name: srvyqstapl_svqo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyqstapl_svqo ON survey_question_appl USING btree (with_survey_question_id, with_survey_option_seq_id);


--
-- Name: survey_question_appl srvyqstapl_srvy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question_appl
    ADD CONSTRAINT srvyqstapl_srvy FOREIGN KEY (survey_id) REFERENCES survey(survey_id);


--
-- Name: survey_question_appl srvyqstapl_srvyq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question_appl
    ADD CONSTRAINT srvyqstapl_srvyq FOREIGN KEY (survey_question_id) REFERENCES survey_question(survey_question_id);


--
-- Name: survey_question_appl srvyqstapl_svqo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_question_appl
    ADD CONSTRAINT srvyqstapl_svqo FOREIGN KEY (with_survey_question_id, with_survey_option_seq_id) REFERENCES survey_question_option(survey_question_id, survey_option_seq_id);


--
-- PostgreSQL database dump complete
--

