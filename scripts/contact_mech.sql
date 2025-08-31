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
-- Name: contact_mech; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_mech (
    contact_mech_id character varying(20) NOT NULL,
    contact_mech_type_id character varying(20),
    info_string character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_mech OWNER TO ofbiz;

--
-- Name: contact_mech pk_contact_mech; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech
    ADD CONSTRAINT pk_contact_mech PRIMARY KEY (contact_mech_id);


--
-- Name: cntct_mch_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntct_mch_txcrts ON contact_mech USING btree (created_tx_stamp);


--
-- Name: cntct_mch_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntct_mch_txstmp ON contact_mech USING btree (last_updated_tx_stamp);


--
-- Name: cont_mech_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cont_mech_type ON contact_mech USING btree (contact_mech_type_id);


--
-- Name: info_string_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX info_string_idx ON contact_mech USING btree (info_string);


--
-- Name: contact_mech cont_mech_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_mech
    ADD CONSTRAINT cont_mech_type FOREIGN KEY (contact_mech_type_id) REFERENCES contact_mech_type(contact_mech_type_id);


--
-- PostgreSQL database dump complete
--

