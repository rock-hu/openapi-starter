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
-- Name: facility_contact_mech; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_contact_mech (
    facility_id character varying(20) NOT NULL,
    contact_mech_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    extension character varying(10),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_contact_mech OWNER TO ofbiz;

--
-- Name: facility_contact_mech pk_facility_contact_mech; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_contact_mech
    ADD CONSTRAINT pk_facility_contact_mech PRIMARY KEY (facility_id, contact_mech_id, from_date);


--
-- Name: facil_cmech_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facil_cmech_cmech ON facility_contact_mech USING btree (contact_mech_id);


--
-- Name: facil_cmech_facil; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facil_cmech_facil ON facility_contact_mech USING btree (facility_id);


--
-- Name: fct_cntt_mch_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_cntt_mch_txcrs ON facility_contact_mech USING btree (created_tx_stamp);


--
-- Name: fct_cntt_mch_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_cntt_mch_txstp ON facility_contact_mech USING btree (last_updated_tx_stamp);


--
-- Name: facility_contact_mech facil_cmech_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_contact_mech
    ADD CONSTRAINT facil_cmech_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: facility_contact_mech facil_cmech_facil; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_contact_mech
    ADD CONSTRAINT facil_cmech_facil FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- PostgreSQL database dump complete
--

