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
-- Name: shipment_item_feature; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_item_feature (
    shipment_id character varying(20) NOT NULL,
    shipment_item_seq_id character varying(20) NOT NULL,
    product_feature_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_item_feature OWNER TO ofbiz;

--
-- Name: shipment_item_feature pk_shipment_item_feature; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_item_feature
    ADD CONSTRAINT pk_shipment_item_feature PRIMARY KEY (shipment_id, shipment_item_seq_id, product_feature_id);


--
-- Name: shpmnt_itft_feat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_itft_feat ON shipment_item_feature USING btree (product_feature_id);


--
-- Name: shpmnt_itft_spim; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_itft_spim ON shipment_item_feature USING btree (shipment_id, shipment_item_seq_id);


--
-- Name: shpt_itm_ftr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_itm_ftr_txcrs ON shipment_item_feature USING btree (created_tx_stamp);


--
-- Name: shpt_itm_ftr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_itm_ftr_txstp ON shipment_item_feature USING btree (last_updated_tx_stamp);


--
-- Name: shipment_item_feature shpmnt_itft_feat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_item_feature
    ADD CONSTRAINT shpmnt_itft_feat FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- Name: shipment_item_feature shpmnt_itft_spim; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_item_feature
    ADD CONSTRAINT shpmnt_itft_spim FOREIGN KEY (shipment_id, shipment_item_seq_id) REFERENCES shipment_item(shipment_id, shipment_item_seq_id);


--
-- PostgreSQL database dump complete
--

