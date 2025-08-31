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
-- Name: agreement_item_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_item_type (
    agreement_item_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_item_type OWNER TO ofbiz;

--
-- Name: agreement_item_type pk_agreement_item_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_item_type
    ADD CONSTRAINT pk_agreement_item_type PRIMARY KEY (agreement_item_type_id);


--
-- Name: agrmnt_typepar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_typepar ON agreement_item_type USING btree (parent_type_id);


--
-- Name: agrmt_itm_tp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmt_itm_tp_txcrs ON agreement_item_type USING btree (created_tx_stamp);


--
-- Name: agrmt_itm_tp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmt_itm_tp_txstp ON agreement_item_type USING btree (last_updated_tx_stamp);


--
-- Name: agreement_item_type agrmnt_typepar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_item_type
    ADD CONSTRAINT agrmnt_typepar FOREIGN KEY (parent_type_id) REFERENCES agreement_item_type(agreement_item_type_id);


--
-- PostgreSQL database dump complete
--

