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
-- Name: requirement_cust_request; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE requirement_cust_request (
    cust_request_id character varying(20) NOT NULL,
    cust_request_item_seq_id character varying(20) NOT NULL,
    requirement_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.requirement_cust_request OWNER TO ofbiz;

--
-- Name: requirement_cust_request pk_requirement_cust_request; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_cust_request
    ADD CONSTRAINT pk_requirement_cust_request PRIMARY KEY (cust_request_id, cust_request_item_seq_id, requirement_id);


--
-- Name: req_csreq_critm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_csreq_critm ON requirement_cust_request USING btree (cust_request_id, cust_request_item_seq_id);


--
-- Name: req_csreq_req; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_csreq_req ON requirement_cust_request USING btree (requirement_id);


--
-- Name: rqrt_cst_rqt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rqrt_cst_rqt_txcrs ON requirement_cust_request USING btree (created_tx_stamp);


--
-- Name: rqrt_cst_rqt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rqrt_cst_rqt_txstp ON requirement_cust_request USING btree (last_updated_tx_stamp);


--
-- Name: requirement_cust_request req_csreq_critm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_cust_request
    ADD CONSTRAINT req_csreq_critm FOREIGN KEY (cust_request_id, cust_request_item_seq_id) REFERENCES cust_request_item(cust_request_id, cust_request_item_seq_id);


--
-- Name: requirement_cust_request req_csreq_req; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_cust_request
    ADD CONSTRAINT req_csreq_req FOREIGN KEY (requirement_id) REFERENCES requirement(requirement_id);


--
-- PostgreSQL database dump complete
--

