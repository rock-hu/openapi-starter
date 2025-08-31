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
-- Name: shipment_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_item (
    shipment_id character varying(20) NOT NULL,
    shipment_item_seq_id character varying(20) NOT NULL,
    product_id character varying(20),
    quantity numeric(18,6),
    shipment_content_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_item OWNER TO ofbiz;

--
-- Name: shipment_item pk_shipment_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_item
    ADD CONSTRAINT pk_shipment_item PRIMARY KEY (shipment_id, shipment_item_seq_id);


--
-- Name: shpmnt_itm_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_itm_prod ON shipment_item USING btree (product_id);


--
-- Name: shpmnt_itm_shpmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_itm_shpmt ON shipment_item USING btree (shipment_id);


--
-- Name: shpmnt_itm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_itm_txcrts ON shipment_item USING btree (created_tx_stamp);


--
-- Name: shpmnt_itm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_itm_txstmp ON shipment_item USING btree (last_updated_tx_stamp);


--
-- Name: shipment_item shpmnt_itm_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_item
    ADD CONSTRAINT shpmnt_itm_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: shipment_item shpmnt_itm_shpmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_item
    ADD CONSTRAINT shpmnt_itm_shpmt FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id);


--
-- PostgreSQL database dump complete
--

