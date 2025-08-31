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
-- Name: carrier_shipment_method; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE carrier_shipment_method (
    shipment_method_type_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    sequence_number numeric(20,0),
    carrier_service_code character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.carrier_shipment_method OWNER TO ofbiz;

--
-- Name: carrier_shipment_method pk_carrier_shipment_method; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY carrier_shipment_method
    ADD CONSTRAINT pk_carrier_shipment_method PRIMARY KEY (shipment_method_type_id, party_id, role_type_id);


--
-- Name: carr_shmeth_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX carr_shmeth_party ON carrier_shipment_method USING btree (party_id);


--
-- Name: carr_shmeth_prole; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX carr_shmeth_prole ON carrier_shipment_method USING btree (party_id, role_type_id);


--
-- Name: carr_shmeth_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX carr_shmeth_type ON carrier_shipment_method USING btree (shipment_method_type_id);


--
-- Name: crr_shpt_mtd_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crr_shpt_mtd_txcrs ON carrier_shipment_method USING btree (created_tx_stamp);


--
-- Name: crr_shpt_mtd_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crr_shpt_mtd_txstp ON carrier_shipment_method USING btree (last_updated_tx_stamp);


--
-- Name: carrier_shipment_method carr_shmeth_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY carrier_shipment_method
    ADD CONSTRAINT carr_shmeth_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: carrier_shipment_method carr_shmeth_prole; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY carrier_shipment_method
    ADD CONSTRAINT carr_shmeth_prole FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: carrier_shipment_method carr_shmeth_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY carrier_shipment_method
    ADD CONSTRAINT carr_shmeth_type FOREIGN KEY (shipment_method_type_id) REFERENCES shipment_method_type(shipment_method_type_id);


--
-- PostgreSQL database dump complete
--

