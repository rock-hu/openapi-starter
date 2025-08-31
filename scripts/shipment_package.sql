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
-- Name: shipment_package; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_package (
    shipment_id character varying(20) NOT NULL,
    shipment_package_seq_id character varying(20) NOT NULL,
    shipment_box_type_id character varying(20),
    date_created timestamp with time zone,
    box_length numeric(18,6),
    box_height numeric(18,6),
    box_width numeric(18,6),
    dimension_uom_id character varying(20),
    weight numeric(18,6),
    weight_uom_id character varying(20),
    insured_value numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_package OWNER TO ofbiz;

--
-- Name: shipment_package pk_shipment_package; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package
    ADD CONSTRAINT pk_shipment_package PRIMARY KEY (shipment_id, shipment_package_seq_id);


--
-- Name: shpkg_bxtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpkg_bxtyp ON shipment_package USING btree (shipment_box_type_id);


--
-- Name: shpkg_duom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpkg_duom ON shipment_package USING btree (dimension_uom_id);


--
-- Name: shpkg_shpmnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpkg_shpmnt ON shipment_package USING btree (shipment_id);


--
-- Name: shpkg_wuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpkg_wuom ON shipment_package USING btree (weight_uom_id);


--
-- Name: shpmnt_pckg_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_pckg_txcrts ON shipment_package USING btree (created_tx_stamp);


--
-- Name: shpmnt_pckg_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_pckg_txstmp ON shipment_package USING btree (last_updated_tx_stamp);


--
-- Name: shipment_package shpkg_bxtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package
    ADD CONSTRAINT shpkg_bxtyp FOREIGN KEY (shipment_box_type_id) REFERENCES shipment_box_type(shipment_box_type_id);


--
-- Name: shipment_package shpkg_duom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package
    ADD CONSTRAINT shpkg_duom FOREIGN KEY (dimension_uom_id) REFERENCES uom(uom_id);


--
-- Name: shipment_package shpkg_shpmnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package
    ADD CONSTRAINT shpkg_shpmnt FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id);


--
-- Name: shipment_package shpkg_wuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package
    ADD CONSTRAINT shpkg_wuom FOREIGN KEY (weight_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

