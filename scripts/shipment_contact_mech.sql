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
-- Name: shipment_contact_mech; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_contact_mech (
    shipment_id character varying(20) NOT NULL,
    shipment_contact_mech_type_id character varying(20) NOT NULL,
    contact_mech_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_contact_mech OWNER TO ofbiz;

--
-- Name: shipment_contact_mech pk_shipment_contact_mech; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_contact_mech
    ADD CONSTRAINT pk_shipment_contact_mech PRIMARY KEY (shipment_id, shipment_contact_mech_type_id);


--
-- Name: shpmt_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_cmech ON shipment_contact_mech USING btree (shipment_id);


--
-- Name: shpmt_cmech_cm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_cmech_cm ON shipment_contact_mech USING btree (contact_mech_id);


--
-- Name: shpmt_cmech_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_cmech_type ON shipment_contact_mech USING btree (shipment_contact_mech_type_id);


--
-- Name: shpt_cnt_mch_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_cnt_mch_txcrs ON shipment_contact_mech USING btree (created_tx_stamp);


--
-- Name: shpt_cnt_mch_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_cnt_mch_txstp ON shipment_contact_mech USING btree (last_updated_tx_stamp);


--
-- Name: shipment_contact_mech shpmt_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_contact_mech
    ADD CONSTRAINT shpmt_cmech FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id);


--
-- Name: shipment_contact_mech shpmt_cmech_cm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_contact_mech
    ADD CONSTRAINT shpmt_cmech_cm FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: shipment_contact_mech shpmt_cmech_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_contact_mech
    ADD CONSTRAINT shpmt_cmech_type FOREIGN KEY (shipment_contact_mech_type_id) REFERENCES shipment_contact_mech_type(shipment_contact_mech_type_id);


--
-- PostgreSQL database dump complete
--

