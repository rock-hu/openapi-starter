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
-- Name: invoice_contact_mech; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_contact_mech (
    invoice_id character varying(20) NOT NULL,
    contact_mech_purpose_type_id character varying(20) NOT NULL,
    contact_mech_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_contact_mech OWNER TO ofbiz;

--
-- Name: invoice_contact_mech pk_invoice_contact_mech; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_contact_mech
    ADD CONSTRAINT pk_invoice_contact_mech PRIMARY KEY (invoice_id, contact_mech_purpose_type_id, contact_mech_id);


--
-- Name: inc_cntt_mch_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_cntt_mch_txcrs ON invoice_contact_mech USING btree (created_tx_stamp);


--
-- Name: inc_cntt_mch_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_cntt_mch_txstp ON invoice_contact_mech USING btree (last_updated_tx_stamp);


--
-- Name: invoice_cmech_cm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_cmech_cm ON invoice_contact_mech USING btree (contact_mech_id);


--
-- Name: invoice_cmech_cmpt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_cmech_cmpt ON invoice_contact_mech USING btree (contact_mech_purpose_type_id);


--
-- Name: invoice_cmech_hdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_cmech_hdr ON invoice_contact_mech USING btree (invoice_id);


--
-- Name: invoice_contact_mech invoice_cmech_cm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_contact_mech
    ADD CONSTRAINT invoice_cmech_cm FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: invoice_contact_mech invoice_cmech_cmpt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_contact_mech
    ADD CONSTRAINT invoice_cmech_cmpt FOREIGN KEY (contact_mech_purpose_type_id) REFERENCES contact_mech_purpose_type(contact_mech_purpose_type_id);


--
-- Name: invoice_contact_mech invoice_cmech_hdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_contact_mech
    ADD CONSTRAINT invoice_cmech_hdr FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);


--
-- PostgreSQL database dump complete
--

