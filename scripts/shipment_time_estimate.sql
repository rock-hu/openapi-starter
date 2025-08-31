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
-- Name: shipment_time_estimate; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_time_estimate (
    shipment_method_type_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    geo_id_to character varying(20) NOT NULL,
    geo_id_from character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    lead_time numeric(18,6),
    lead_time_uom_id character varying(20),
    sequence_number numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_time_estimate OWNER TO ofbiz;

--
-- Name: shipment_time_estimate pk_shipment_time_estimate; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_time_estimate
    ADD CONSTRAINT pk_shipment_time_estimate PRIMARY KEY (shipment_method_type_id, party_id, role_type_id, geo_id_to, geo_id_from, from_date);


--
-- Name: shipt_est_geo_from; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shipt_est_geo_from ON shipment_time_estimate USING btree (geo_id_from);


--
-- Name: shipt_est_geo_to; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shipt_est_geo_to ON shipment_time_estimate USING btree (geo_id_to);


--
-- Name: shipt_est_method; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shipt_est_method ON shipment_time_estimate USING btree (shipment_method_type_id, party_id, role_type_id);


--
-- Name: shipt_est_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shipt_est_uom ON shipment_time_estimate USING btree (lead_time_uom_id);


--
-- Name: shpmt_tm_est_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_tm_est_txcrs ON shipment_time_estimate USING btree (created_tx_stamp);


--
-- Name: shpmt_tm_est_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_tm_est_txstp ON shipment_time_estimate USING btree (last_updated_tx_stamp);


--
-- Name: shipment_time_estimate shipt_est_geo_from; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_time_estimate
    ADD CONSTRAINT shipt_est_geo_from FOREIGN KEY (geo_id_from) REFERENCES geo(geo_id);


--
-- Name: shipment_time_estimate shipt_est_geo_to; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_time_estimate
    ADD CONSTRAINT shipt_est_geo_to FOREIGN KEY (geo_id_to) REFERENCES geo(geo_id);


--
-- Name: shipment_time_estimate shipt_est_method; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_time_estimate
    ADD CONSTRAINT shipt_est_method FOREIGN KEY (shipment_method_type_id, party_id, role_type_id) REFERENCES carrier_shipment_method(shipment_method_type_id, party_id, role_type_id);


--
-- Name: shipment_time_estimate shipt_est_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_time_estimate
    ADD CONSTRAINT shipt_est_uom FOREIGN KEY (lead_time_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

