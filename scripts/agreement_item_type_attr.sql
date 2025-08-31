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
-- Name: agreement_item_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_item_type_attr (
    agreement_item_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_item_type_attr OWNER TO ofbiz;

--
-- Name: agreement_item_type_attr pk_agreement_item_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_item_type_attr
    ADD CONSTRAINT pk_agreement_item_type_attr PRIMARY KEY (agreement_item_type_id, attr_name);


--
-- Name: agrmnt_item_typatr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_item_typatr ON agreement_item_type_attr USING btree (agreement_item_type_id);


--
-- Name: agt_itm_tp_atr_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agt_itm_tp_atr_txp ON agreement_item_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: agt_itm_tp_atr_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agt_itm_tp_atr_txs ON agreement_item_type_attr USING btree (created_tx_stamp);


--
-- Name: agreement_item_type_attr agrmnt_item_typatr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_item_type_attr
    ADD CONSTRAINT agrmnt_item_typatr FOREIGN KEY (agreement_item_type_id) REFERENCES agreement_item_type(agreement_item_type_id);


--
-- PostgreSQL database dump complete
--

