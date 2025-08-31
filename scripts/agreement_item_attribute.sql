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
-- Name: agreement_item_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_item_attribute (
    agreement_id character varying(20) NOT NULL,
    agreement_item_seq_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_item_attribute OWNER TO ofbiz;

--
-- Name: agreement_item_attribute pk_agreement_item_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_item_attribute
    ADD CONSTRAINT pk_agreement_item_attribute PRIMARY KEY (agreement_id, agreement_item_seq_id, attr_name);


--
-- Name: agrmnt_item_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_item_attr ON agreement_item_attribute USING btree (agreement_id, agreement_item_seq_id);


--
-- Name: agrt_itm_attt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_itm_attt_txcs ON agreement_item_attribute USING btree (created_tx_stamp);


--
-- Name: agrt_itm_attt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_itm_attt_txsp ON agreement_item_attribute USING btree (last_updated_tx_stamp);


--
-- Name: agreement_item_attribute agrmnt_item_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_item_attribute
    ADD CONSTRAINT agrmnt_item_attr FOREIGN KEY (agreement_id, agreement_item_seq_id) REFERENCES agreement_item(agreement_id, agreement_item_seq_id);


--
-- PostgreSQL database dump complete
--

