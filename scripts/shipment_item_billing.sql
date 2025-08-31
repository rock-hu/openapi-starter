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
-- Name: shipment_item_billing; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_item_billing (
    shipment_id character varying(20) NOT NULL,
    shipment_item_seq_id character varying(20) NOT NULL,
    invoice_id character varying(20) NOT NULL,
    invoice_item_seq_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_item_billing OWNER TO ofbiz;

--
-- Name: shipment_item_billing pk_shipment_item_billing; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_item_billing
    ADD CONSTRAINT pk_shipment_item_billing PRIMARY KEY (shipment_id, shipment_item_seq_id, invoice_id, invoice_item_seq_id);


--
-- Name: shpmnt_itbl_inim; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_itbl_inim ON shipment_item_billing USING btree (invoice_id, invoice_item_seq_id);


--
-- Name: shpmnt_itbl_spim; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_itbl_spim ON shipment_item_billing USING btree (shipment_id, shipment_item_seq_id);


--
-- Name: shpt_itm_blg_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_itm_blg_txcrs ON shipment_item_billing USING btree (created_tx_stamp);


--
-- Name: shpt_itm_blg_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_itm_blg_txstp ON shipment_item_billing USING btree (last_updated_tx_stamp);


--
-- Name: shipment_item_billing shpmnt_itbl_inim; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_item_billing
    ADD CONSTRAINT shpmnt_itbl_inim FOREIGN KEY (invoice_id, invoice_item_seq_id) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- Name: shipment_item_billing shpmnt_itbl_spim; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_item_billing
    ADD CONSTRAINT shpmnt_itbl_spim FOREIGN KEY (shipment_id, shipment_item_seq_id) REFERENCES shipment_item(shipment_id, shipment_item_seq_id);


--
-- PostgreSQL database dump complete
--

