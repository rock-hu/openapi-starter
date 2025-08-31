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
-- Name: contact_mech_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_mech_type_attr (
    contact_mech_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_mech_type_attr OWNER TO ofbiz;

--
-- Name: contact_mech_type_attr pk_contact_mech_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_type_attr
    ADD CONSTRAINT pk_contact_mech_type_attr PRIMARY KEY (contact_mech_type_id, attr_name);


--
-- Name: cnt_mch_tp_atr_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_mch_tp_atr_txp ON contact_mech_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: cnt_mch_tp_atr_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_mch_tp_atr_txs ON contact_mech_type_attr USING btree (created_tx_stamp);


--
-- Name: cont_mech_typ_atr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cont_mech_typ_atr ON contact_mech_type_attr USING btree (contact_mech_type_id);


--
-- Name: contact_mech_type_attr cont_mech_typ_atr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_type_attr
    ADD CONSTRAINT cont_mech_typ_atr FOREIGN KEY (contact_mech_type_id) REFERENCES contact_mech_type(contact_mech_type_id);


--
-- PostgreSQL database dump complete
--

