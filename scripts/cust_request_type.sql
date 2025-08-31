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
-- Name: cust_request_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_type (
    cust_request_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    party_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_type OWNER TO ofbiz;

--
-- Name: cust_request_type pk_cust_request_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_type
    ADD CONSTRAINT pk_cust_request_type PRIMARY KEY (cust_request_type_id);


--
-- Name: cst_rqst_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqst_tp_txcrts ON cust_request_type USING btree (created_tx_stamp);


--
-- Name: cst_rqst_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqst_tp_txstmp ON cust_request_type USING btree (last_updated_tx_stamp);


--
-- Name: cust_pty_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_pty_party ON cust_request_type USING btree (party_id);


--
-- Name: cust_req_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_type_par ON cust_request_type USING btree (parent_type_id);


--
-- Name: cust_request_type cust_pty_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_type
    ADD CONSTRAINT cust_pty_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: cust_request_type cust_req_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_type
    ADD CONSTRAINT cust_req_type_par FOREIGN KEY (parent_type_id) REFERENCES cust_request_type(cust_request_type_id);


--
-- PostgreSQL database dump complete
--

