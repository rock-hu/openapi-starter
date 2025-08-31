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
-- Name: facility_carrier_shipment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_carrier_shipment (
    facility_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    shipment_method_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_carrier_shipment OWNER TO ofbiz;

--
-- Name: facility_carrier_shipment pk_facility_carrier_shipment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_carrier_shipment
    ADD CONSTRAINT pk_facility_carrier_shipment PRIMARY KEY (facility_id, party_id, role_type_id, shipment_method_type_id);


--
-- Name: facility_csh_csm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_csh_csm ON facility_carrier_shipment USING btree (shipment_method_type_id, party_id, role_type_id);


--
-- Name: facility_csh_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_csh_fac ON facility_carrier_shipment USING btree (facility_id);


--
-- Name: facility_csh_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_csh_pty ON facility_carrier_shipment USING btree (party_id);


--
-- Name: facility_csh_stp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_csh_stp ON facility_carrier_shipment USING btree (shipment_method_type_id);


--
-- Name: fct_crr_shpt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_crr_shpt_txcrs ON facility_carrier_shipment USING btree (created_tx_stamp);


--
-- Name: fct_crr_shpt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_crr_shpt_txstp ON facility_carrier_shipment USING btree (last_updated_tx_stamp);


--
-- Name: facility_carrier_shipment facility_csh_csm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_carrier_shipment
    ADD CONSTRAINT facility_csh_csm FOREIGN KEY (shipment_method_type_id, party_id, role_type_id) REFERENCES carrier_shipment_method(shipment_method_type_id, party_id, role_type_id);


--
-- Name: facility_carrier_shipment facility_csh_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_carrier_shipment
    ADD CONSTRAINT facility_csh_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: facility_carrier_shipment facility_csh_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_carrier_shipment
    ADD CONSTRAINT facility_csh_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: facility_carrier_shipment facility_csh_stp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_carrier_shipment
    ADD CONSTRAINT facility_csh_stp FOREIGN KEY (shipment_method_type_id) REFERENCES shipment_method_type(shipment_method_type_id);


--
-- PostgreSQL database dump complete
--

