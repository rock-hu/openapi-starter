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
-- Name: survey_trigger; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_trigger (
    survey_id character varying(20) NOT NULL,
    survey_appl_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_trigger OWNER TO ofbiz;

--
-- Name: survey_trigger pk_survey_trigger; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_trigger
    ADD CONSTRAINT pk_survey_trigger PRIMARY KEY (survey_id, survey_appl_type_id, from_date);


--
-- Name: srv_trggr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_trggr_txcrts ON survey_trigger USING btree (created_tx_stamp);


--
-- Name: srv_trggr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_trggr_txstmp ON survey_trigger USING btree (last_updated_tx_stamp);


--
-- Name: srvytrg_srvy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvytrg_srvy ON survey_trigger USING btree (survey_id);


--
-- Name: srvytrg_srvyapt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvytrg_srvyapt ON survey_trigger USING btree (survey_appl_type_id);


--
-- Name: survey_trigger srvytrg_srvy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_trigger
    ADD CONSTRAINT srvytrg_srvy FOREIGN KEY (survey_id) REFERENCES survey(survey_id);


--
-- Name: survey_trigger srvytrg_srvyapt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_trigger
    ADD CONSTRAINT srvytrg_srvyapt FOREIGN KEY (survey_appl_type_id) REFERENCES survey_appl_type(survey_appl_type_id);


--
-- PostgreSQL database dump complete
--

