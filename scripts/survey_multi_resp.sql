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
-- Name: survey_multi_resp; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_multi_resp (
    survey_id character varying(20) NOT NULL,
    survey_multi_resp_id character varying(20) NOT NULL,
    multi_resp_title character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_multi_resp OWNER TO ofbiz;

--
-- Name: survey_multi_resp pk_survey_multi_resp; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_multi_resp
    ADD CONSTRAINT pk_survey_multi_resp PRIMARY KEY (survey_id, survey_multi_resp_id);


--
-- Name: srv_mlt_rsp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_mlt_rsp_txcrts ON survey_multi_resp USING btree (created_tx_stamp);


--
-- Name: srv_mlt_rsp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_mlt_rsp_txstmp ON survey_multi_resp USING btree (last_updated_tx_stamp);


--
-- Name: srvymrsp_srvy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvymrsp_srvy ON survey_multi_resp USING btree (survey_id);


--
-- Name: survey_multi_resp srvymrsp_srvy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_multi_resp
    ADD CONSTRAINT srvymrsp_srvy FOREIGN KEY (survey_id) REFERENCES survey(survey_id);


--
-- PostgreSQL database dump complete
--

