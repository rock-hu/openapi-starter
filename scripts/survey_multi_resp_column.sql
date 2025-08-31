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
-- Name: survey_multi_resp_column; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE survey_multi_resp_column (
    survey_id character varying(20) NOT NULL,
    survey_multi_resp_id character varying(20) NOT NULL,
    survey_multi_resp_col_id character varying(20) NOT NULL,
    column_title character varying(100),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.survey_multi_resp_column OWNER TO ofbiz;

--
-- Name: survey_multi_resp_column pk_survey_multi_resp_column; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_multi_resp_column
    ADD CONSTRAINT pk_survey_multi_resp_column PRIMARY KEY (survey_id, survey_multi_resp_id, survey_multi_resp_col_id);


--
-- Name: srv_mlt_rsp_cln_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_mlt_rsp_cln_tp ON survey_multi_resp_column USING btree (last_updated_tx_stamp);


--
-- Name: srv_mlt_rsp_cln_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srv_mlt_rsp_cln_ts ON survey_multi_resp_column USING btree (created_tx_stamp);


--
-- Name: srvymrspcl_smresp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvymrspcl_smresp ON survey_multi_resp_column USING btree (survey_id, survey_multi_resp_id);


--
-- Name: survey_multi_resp_column srvymrspcl_smresp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY survey_multi_resp_column
    ADD CONSTRAINT srvymrspcl_smresp FOREIGN KEY (survey_id, survey_multi_resp_id) REFERENCES survey_multi_resp(survey_id, survey_multi_resp_id);


--
-- PostgreSQL database dump complete
--

