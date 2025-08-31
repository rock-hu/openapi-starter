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
-- Name: carrier_shipment_box_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE carrier_shipment_box_type (
    shipment_box_type_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    packaging_type_code character varying(20),
    oversize_code character varying(10),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.carrier_shipment_box_type OWNER TO ofbiz;

--
-- Name: carrier_shipment_box_type pk_carrier_shipment_box_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY carrier_shipment_box_type
    ADD CONSTRAINT pk_carrier_shipment_box_type PRIMARY KEY (shipment_box_type_id, party_id);


--
-- Name: carr_shbx_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX carr_shbx_party ON carrier_shipment_box_type USING btree (party_id);


--
-- Name: carr_shbx_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX carr_shbx_type ON carrier_shipment_box_type USING btree (shipment_box_type_id);


--
-- Name: crr_sht_bx_tp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crr_sht_bx_tp_txcs ON carrier_shipment_box_type USING btree (created_tx_stamp);


--
-- Name: crr_sht_bx_tp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crr_sht_bx_tp_txsp ON carrier_shipment_box_type USING btree (last_updated_tx_stamp);


--
-- Name: carrier_shipment_box_type carr_shbx_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY carrier_shipment_box_type
    ADD CONSTRAINT carr_shbx_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: carrier_shipment_box_type carr_shbx_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY carrier_shipment_box_type
    ADD CONSTRAINT carr_shbx_type FOREIGN KEY (shipment_box_type_id) REFERENCES shipment_box_type(shipment_box_type_id);


--
-- PostgreSQL database dump complete
--

