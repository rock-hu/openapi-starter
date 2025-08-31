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
-- Name: contact_mech_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_mech_type (
    contact_mech_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_mech_type OWNER TO ofbiz;

--
-- Name: contact_mech_type pk_contact_mech_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_type
    ADD CONSTRAINT pk_contact_mech_type PRIMARY KEY (contact_mech_type_id);


--
-- Name: cntt_mch_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_mch_tp_txcrts ON contact_mech_type USING btree (created_tx_stamp);


--
-- Name: cntt_mch_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_mch_tp_txstmp ON contact_mech_type USING btree (last_updated_tx_stamp);


--
-- Name: cont_mech_typ_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cont_mech_typ_par ON contact_mech_type USING btree (parent_type_id);


--
-- Name: contact_mech_type cont_mech_typ_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_type
    ADD CONSTRAINT cont_mech_typ_par FOREIGN KEY (parent_type_id) REFERENCES contact_mech_type(contact_mech_type_id);


--
-- PostgreSQL database dump complete
--

