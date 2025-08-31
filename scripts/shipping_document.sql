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
-- Name: shipping_document; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipping_document (
    document_id character varying(20) NOT NULL,
    shipment_id character varying(20),
    shipment_item_seq_id character varying(20),
    shipment_package_seq_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipping_document OWNER TO ofbiz;

--
-- Name: shipping_document pk_shipping_document; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipping_document
    ADD CONSTRAINT pk_shipping_document PRIMARY KEY (document_id);


--
-- Name: shpng_doc_doc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpng_doc_doc ON shipping_document USING btree (document_id);


--
-- Name: shpng_doc_shpkg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpng_doc_shpkg ON shipping_document USING btree (shipment_id, shipment_package_seq_id);


--
-- Name: shpng_doc_smitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpng_doc_smitm ON shipping_document USING btree (shipment_id, shipment_item_seq_id);


--
-- Name: shppng_dcmt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shppng_dcmt_txcrts ON shipping_document USING btree (created_tx_stamp);


--
-- Name: shppng_dcmt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shppng_dcmt_txstmp ON shipping_document USING btree (last_updated_tx_stamp);


--
-- Name: shipping_document shpng_doc_doc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipping_document
    ADD CONSTRAINT shpng_doc_doc FOREIGN KEY (document_id) REFERENCES document(document_id);


--
-- Name: shipping_document shpng_doc_shpkg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipping_document
    ADD CONSTRAINT shpng_doc_shpkg FOREIGN KEY (shipment_id, shipment_package_seq_id) REFERENCES shipment_package(shipment_id, shipment_package_seq_id);


--
-- Name: shipping_document shpng_doc_smitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipping_document
    ADD CONSTRAINT shpng_doc_smitm FOREIGN KEY (shipment_id, shipment_item_seq_id) REFERENCES shipment_item(shipment_id, shipment_item_seq_id);


--
-- PostgreSQL database dump complete
--

