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
-- Name: party_contact_mech; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_contact_mech (
    party_id character varying(20) NOT NULL,
    contact_mech_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    role_type_id character varying(20),
    allow_solicitation character(1),
    extension character varying(255),
    verified character(1),
    comments character varying(255),
    years_with_contact_mech numeric(20,0),
    months_with_contact_mech numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_contact_mech OWNER TO ofbiz;

--
-- Name: party_contact_mech pk_party_contact_mech; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_contact_mech
    ADD CONSTRAINT pk_party_contact_mech PRIMARY KEY (party_id, contact_mech_id, from_date);


--
-- Name: party_cmech_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_cmech_cmech ON party_contact_mech USING btree (contact_mech_id);


--
-- Name: party_cmech_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_cmech_party ON party_contact_mech USING btree (party_id);


--
-- Name: party_cmech_prole; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_cmech_prole ON party_contact_mech USING btree (party_id, role_type_id);


--
-- Name: party_cmech_role; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_cmech_role ON party_contact_mech USING btree (role_type_id);


--
-- Name: prt_cntt_mch_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cntt_mch_txcrs ON party_contact_mech USING btree (created_tx_stamp);


--
-- Name: prt_cntt_mch_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cntt_mch_txstp ON party_contact_mech USING btree (last_updated_tx_stamp);


--
-- Name: party_contact_mech party_cmech_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_contact_mech
    ADD CONSTRAINT party_cmech_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: party_contact_mech party_cmech_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_contact_mech
    ADD CONSTRAINT party_cmech_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_contact_mech party_cmech_prole; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_contact_mech
    ADD CONSTRAINT party_cmech_prole FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: party_contact_mech party_cmech_role; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_contact_mech
    ADD CONSTRAINT party_cmech_role FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- PostgreSQL database dump complete
--

