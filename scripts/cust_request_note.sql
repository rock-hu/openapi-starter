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
-- Name: cust_request_note; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_note (
    cust_request_id character varying(20) NOT NULL,
    note_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_note OWNER TO ofbiz;

--
-- Name: cust_request_note pk_cust_request_note; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_note
    ADD CONSTRAINT pk_cust_request_note PRIMARY KEY (cust_request_id, note_id);


--
-- Name: crq_cr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crq_cr ON cust_request_note USING btree (cust_request_id);


--
-- Name: crq_note; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crq_note ON cust_request_note USING btree (note_id);


--
-- Name: cst_rqst_nt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqst_nt_txcrts ON cust_request_note USING btree (created_tx_stamp);


--
-- Name: cst_rqst_nt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqst_nt_txstmp ON cust_request_note USING btree (last_updated_tx_stamp);


--
-- Name: cust_request_note crq_cr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_note
    ADD CONSTRAINT crq_cr FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- Name: cust_request_note crq_note; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_note
    ADD CONSTRAINT crq_note FOREIGN KEY (note_id) REFERENCES note_data(note_id);


--
-- PostgreSQL database dump complete
--

