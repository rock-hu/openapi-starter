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
-- Name: return_contact_mech; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE return_contact_mech (
    return_id character varying(20) NOT NULL,
    contact_mech_purpose_type_id character varying(20) NOT NULL,
    contact_mech_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.return_contact_mech OWNER TO ofbiz;

--
-- Name: return_contact_mech pk_return_contact_mech; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_contact_mech
    ADD CONSTRAINT pk_return_contact_mech PRIMARY KEY (return_id, contact_mech_purpose_type_id, contact_mech_id);


--
-- Name: return_cmech_cm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX return_cmech_cm ON return_contact_mech USING btree (contact_mech_id);


--
-- Name: return_cmech_cmpt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX return_cmech_cmpt ON return_contact_mech USING btree (contact_mech_purpose_type_id);


--
-- Name: return_cmech_hdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX return_cmech_hdr ON return_contact_mech USING btree (return_id);


--
-- Name: rtn_cntt_mch_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_cntt_mch_txcrs ON return_contact_mech USING btree (created_tx_stamp);


--
-- Name: rtn_cntt_mch_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_cntt_mch_txstp ON return_contact_mech USING btree (last_updated_tx_stamp);


--
-- Name: return_contact_mech return_cmech_cm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_contact_mech
    ADD CONSTRAINT return_cmech_cm FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: return_contact_mech return_cmech_cmpt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_contact_mech
    ADD CONSTRAINT return_cmech_cmpt FOREIGN KEY (contact_mech_purpose_type_id) REFERENCES contact_mech_purpose_type(contact_mech_purpose_type_id);


--
-- Name: return_contact_mech return_cmech_hdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_contact_mech
    ADD CONSTRAINT return_cmech_hdr FOREIGN KEY (return_id) REFERENCES return_header(return_id);


--
-- PostgreSQL database dump complete
--

