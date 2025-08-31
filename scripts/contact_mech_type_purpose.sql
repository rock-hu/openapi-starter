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
-- Name: contact_mech_type_purpose; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_mech_type_purpose (
    contact_mech_type_id character varying(20) NOT NULL,
    contact_mech_purpose_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_mech_type_purpose OWNER TO ofbiz;

--
-- Name: contact_mech_type_purpose pk_contact_mech_type_purpose; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_type_purpose
    ADD CONSTRAINT pk_contact_mech_type_purpose PRIMARY KEY (contact_mech_type_id, contact_mech_purpose_type_id);


--
-- Name: cnt_mch_tp_prs_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_mch_tp_prs_txp ON contact_mech_type_purpose USING btree (last_updated_tx_stamp);


--
-- Name: cnt_mch_tp_prs_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_mch_tp_prs_txs ON contact_mech_type_purpose USING btree (created_tx_stamp);


--
-- Name: cont_mech_tp_prptp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cont_mech_tp_prptp ON contact_mech_type_purpose USING btree (contact_mech_purpose_type_id);


--
-- Name: cont_mech_tp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cont_mech_tp_type ON contact_mech_type_purpose USING btree (contact_mech_type_id);


--
-- Name: contact_mech_type_purpose cont_mech_tp_prptp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_type_purpose
    ADD CONSTRAINT cont_mech_tp_prptp FOREIGN KEY (contact_mech_purpose_type_id) REFERENCES contact_mech_purpose_type(contact_mech_purpose_type_id);


--
-- Name: contact_mech_type_purpose cont_mech_tp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_type_purpose
    ADD CONSTRAINT cont_mech_tp_type FOREIGN KEY (contact_mech_type_id) REFERENCES contact_mech_type(contact_mech_type_id);


--
-- PostgreSQL database dump complete
--

