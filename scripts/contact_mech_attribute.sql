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
-- Name: contact_mech_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_mech_attribute (
    contact_mech_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_mech_attribute OWNER TO ofbiz;

--
-- Name: contact_mech_attribute pk_contact_mech_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_attribute
    ADD CONSTRAINT pk_contact_mech_attribute PRIMARY KEY (contact_mech_id, attr_name);


--
-- Name: cnt_mch_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_mch_attt_txcrs ON contact_mech_attribute USING btree (created_tx_stamp);


--
-- Name: cnt_mch_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_mch_attt_txstp ON contact_mech_attribute USING btree (last_updated_tx_stamp);


--
-- Name: cont_mech_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cont_mech_attr ON contact_mech_attribute USING btree (contact_mech_id);


--
-- Name: contact_mech_attribute cont_mech_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_attribute
    ADD CONSTRAINT cont_mech_attr FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- PostgreSQL database dump complete
--

