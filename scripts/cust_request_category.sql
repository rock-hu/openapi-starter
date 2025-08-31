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
-- Name: cust_request_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_category (
    cust_request_category_id character varying(20) NOT NULL,
    cust_request_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_category OWNER TO ofbiz;

--
-- Name: cust_request_category pk_cust_request_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_category
    ADD CONSTRAINT pk_cust_request_category PRIMARY KEY (cust_request_category_id);


--
-- Name: cst_rqt_ctr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_ctr_txcrts ON cust_request_category USING btree (created_tx_stamp);


--
-- Name: cst_rqt_ctr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_ctr_txstmp ON cust_request_category USING btree (last_updated_tx_stamp);


--
-- Name: cust_rqct_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_rqct_type ON cust_request_category USING btree (cust_request_type_id);


--
-- Name: cust_request_category cust_rqct_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_category
    ADD CONSTRAINT cust_rqct_type FOREIGN KEY (cust_request_type_id) REFERENCES cust_request_type(cust_request_type_id);


--
-- PostgreSQL database dump complete
--

