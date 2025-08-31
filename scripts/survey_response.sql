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
-- Name: survey_response; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_response (
    survey_response_id character varying(20) NOT NULL,
    survey_id character varying(20),
    party_id character varying(20),
    response_date timestamp with time zone,
    last_modified_date timestamp with time zone,
    reference_id character varying(255),
    general_feedback text,
    order_id character varying(20),
    order_item_seq_id character varying(20),
    status_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_response OWNER TO ofbiz;

--
-- Name: survey_response pk_survey_response; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_response
    ADD CONSTRAINT pk_survey_response PRIMARY KEY (survey_response_id);


--
-- Name: srv_rspns_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_rspns_txcrts ON survey_response USING btree (created_tx_stamp);


--
-- Name: srv_rspns_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_rspns_txstmp ON survey_response USING btree (last_updated_tx_stamp);


--
-- Name: srvyrsp_srvy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyrsp_srvy ON survey_response USING btree (survey_id);


--
-- Name: srvyrsp_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvyrsp_stts ON survey_response USING btree (status_id);


--
-- Name: survey_response srvyrsp_srvy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_response
    ADD CONSTRAINT srvyrsp_srvy FOREIGN KEY (survey_id) REFERENCES survey(survey_id);


--
-- Name: survey_response srvyrsp_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_response
    ADD CONSTRAINT srvyrsp_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

