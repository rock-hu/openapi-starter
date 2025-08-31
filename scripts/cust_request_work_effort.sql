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
-- Name: cust_request_work_effort; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_work_effort (
    cust_request_id character varying(20) NOT NULL,
    work_effort_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_work_effort OWNER TO ofbiz;

--
-- Name: cust_request_work_effort pk_cust_request_work_effort; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_work_effort
    ADD CONSTRAINT pk_cust_request_work_effort PRIMARY KEY (cust_request_id, work_effort_id);


--
-- Name: cst_rqt_wrk_eft_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_wrk_eft_tp ON cust_request_work_effort USING btree (last_updated_tx_stamp);


--
-- Name: cst_rqt_wrk_eft_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_wrk_eft_ts ON cust_request_work_effort USING btree (created_tx_stamp);


--
-- Name: cstreq_wf_creq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cstreq_wf_creq ON cust_request_work_effort USING btree (cust_request_id);


--
-- Name: cstreq_wf_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cstreq_wf_weff ON cust_request_work_effort USING btree (work_effort_id);


--
-- Name: cust_request_work_effort cstreq_wf_creq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_work_effort
    ADD CONSTRAINT cstreq_wf_creq FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- Name: cust_request_work_effort cstreq_wf_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_work_effort
    ADD CONSTRAINT cstreq_wf_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

