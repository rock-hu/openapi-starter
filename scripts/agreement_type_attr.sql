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
-- Name: agreement_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_type_attr (
    agreement_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_type_attr OWNER TO ofbiz;

--
-- Name: agreement_type_attr pk_agreement_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_type_attr
    ADD CONSTRAINT pk_agreement_type_attr PRIMARY KEY (agreement_type_id, attr_name);


--
-- Name: agrmnt_type_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_type_attr ON agreement_type_attr USING btree (agreement_type_id);


--
-- Name: agrmt_tp_atr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmt_tp_atr_txcrs ON agreement_type_attr USING btree (created_tx_stamp);


--
-- Name: agrmt_tp_atr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmt_tp_atr_txstp ON agreement_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: agreement_type_attr agrmnt_type_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_type_attr
    ADD CONSTRAINT agrmnt_type_attr FOREIGN KEY (agreement_type_id) REFERENCES agreement_type(agreement_type_id);


--
-- PostgreSQL database dump complete
--

