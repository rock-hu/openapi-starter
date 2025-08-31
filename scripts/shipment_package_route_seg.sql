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
-- Name: shipment_package_route_seg; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_package_route_seg (
    shipment_id character varying(20) NOT NULL,
    shipment_package_seq_id character varying(20) NOT NULL,
    shipment_route_segment_id character varying(20) NOT NULL,
    tracking_code character varying(60),
    box_number character varying(60),
    label_image bytea,
    label_intl_sign_image bytea,
    label_html text,
    label_printed character(1),
    international_invoice bytea,
    package_transport_cost numeric(18,2),
    package_service_cost numeric(18,2),
    package_other_cost numeric(18,2),
    cod_amount numeric(18,2),
    insured_amount numeric(18,2),
    currency_uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_package_route_seg OWNER TO ofbiz;

--
-- Name: shipment_package_route_seg pk_shipment_package_route_seg; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package_route_seg
    ADD CONSTRAINT pk_shipment_package_route_seg PRIMARY KEY (shipment_id, shipment_package_seq_id, shipment_route_segment_id);


--
-- Name: shpkrtsg_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpkrtsg_cuom ON shipment_package_route_seg USING btree (currency_uom_id);


--
-- Name: shpkrtsg_rtsg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpkrtsg_rtsg ON shipment_package_route_seg USING btree (shipment_id, shipment_route_segment_id);


--
-- Name: shpkrtsg_shpkg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpkrtsg_shpkg ON shipment_package_route_seg USING btree (shipment_id, shipment_package_seq_id);


--
-- Name: sht_pcg_rt_sg_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sht_pcg_rt_sg_txcs ON shipment_package_route_seg USING btree (created_tx_stamp);


--
-- Name: sht_pcg_rt_sg_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sht_pcg_rt_sg_txsp ON shipment_package_route_seg USING btree (last_updated_tx_stamp);


--
-- Name: shipment_package_route_seg shpkrtsg_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package_route_seg
    ADD CONSTRAINT shpkrtsg_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: shipment_package_route_seg shpkrtsg_rtsg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package_route_seg
    ADD CONSTRAINT shpkrtsg_rtsg FOREIGN KEY (shipment_id, shipment_route_segment_id) REFERENCES shipment_route_segment(shipment_id, shipment_route_segment_id);


--
-- Name: shipment_package_route_seg shpkrtsg_shpkg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_package_route_seg
    ADD CONSTRAINT shpkrtsg_shpkg FOREIGN KEY (shipment_id, shipment_package_seq_id) REFERENCES shipment_package(shipment_id, shipment_package_seq_id);


--
-- PostgreSQL database dump complete
--

