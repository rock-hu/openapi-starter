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
-- Name: cust_request_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_attribute (
    cust_request_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_attribute OWNER TO ofbiz;

--
-- Name: cust_request_attribute pk_cust_request_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_attribute
    ADD CONSTRAINT pk_cust_request_attribute PRIMARY KEY (cust_request_id, attr_name);


--
-- Name: cst_rqt_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_attt_txcrs ON cust_request_attribute USING btree (created_tx_stamp);


--
-- Name: cst_rqt_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_attt_txstp ON cust_request_attribute USING btree (last_updated_tx_stamp);


--
-- Name: cust_req_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_attr ON cust_request_attribute USING btree (cust_request_id);


--
-- Name: cust_request_attribute cust_req_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_attribute
    ADD CONSTRAINT cust_req_attr FOREIGN KEY (cust_request_id) REFERENCES cust_request(cust_request_id);


--
-- PostgreSQL database dump complete
--

