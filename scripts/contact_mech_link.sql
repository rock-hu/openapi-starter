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
-- Name: contact_mech_link; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_mech_link (
    contact_mech_id_from character varying(20) NOT NULL,
    contact_mech_id_to character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_mech_link OWNER TO ofbiz;

--
-- Name: contact_mech_link pk_contact_mech_link; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_link
    ADD CONSTRAINT pk_contact_mech_link PRIMARY KEY (contact_mech_id_from, contact_mech_id_to);


--
-- Name: cntt_mch_lnk_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_mch_lnk_txcrs ON contact_mech_link USING btree (created_tx_stamp);


--
-- Name: cntt_mch_lnk_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_mch_lnk_txstp ON contact_mech_link USING btree (last_updated_tx_stamp);


--
-- Name: cont_mech_fcmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cont_mech_fcmech ON contact_mech_link USING btree (contact_mech_id_from);


--
-- Name: cont_mech_tcmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cont_mech_tcmech ON contact_mech_link USING btree (contact_mech_id_to);


--
-- Name: contact_mech_link cont_mech_fcmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_link
    ADD CONSTRAINT cont_mech_fcmech FOREIGN KEY (contact_mech_id_from) REFERENCES contact_mech(contact_mech_id);


--
-- Name: contact_mech_link cont_mech_tcmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech_link
    ADD CONSTRAINT cont_mech_tcmech FOREIGN KEY (contact_mech_id_to) REFERENCES contact_mech(contact_mech_id);


--
-- PostgreSQL database dump complete
--

