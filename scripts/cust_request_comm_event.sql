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
-- Name: cust_request_comm_event; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_comm_event (
    cust_request_id character varying(20) NOT NULL,
    communication_event_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_comm_event OWNER TO ofbiz;

--
-- Name: cust_request_comm_event pk_cust_request_comm_event; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_comm_event
    ADD CONSTRAINT pk_cust_request_comm_event PRIMARY KEY (cust_request_id, communication_event_id);


--
-- Name: cst_rqt_cmm_evt_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_cmm_evt_tp ON cust_request_comm_event USING btree (last_updated_tx_stamp);


--
-- Name: cst_rqt_cmm_evt_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_cmm_evt_ts ON cust_request_comm_event USING btree (created_tx_stamp);


--
-- Name: custreq_cev_cev; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX custreq_cev_cev ON cust_request_comm_event USING btree (communication_event_id);


--
-- Name: custreq_cev_crq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX custreq_cev_crq ON cust_request_comm_event USING btree (cust_request_id);


--
-- Name: cust_request_comm_event custreq_cev_cev; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_comm_event
    ADD CONSTRAINT custreq_cev_cev FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: cust_request_comm_event custreq_cev_crq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_comm_event
    ADD CONSTRAINT custreq_cev_crq FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- PostgreSQL database dump complete
--

