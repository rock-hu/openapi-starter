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
-- Name: product_store_vendor_shipment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_vendor_shipment (
    product_store_id character varying(20) NOT NULL,
    vendor_party_id character varying(20) NOT NULL,
    shipment_method_type_id character varying(20) NOT NULL,
    carrier_party_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_vendor_shipment OWNER TO ofbiz;

--
-- Name: product_store_vendor_shipment pk_product_store_vendor_shipme; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_shipment
    ADD CONSTRAINT pk_product_store_vendor_shipme PRIMARY KEY (product_store_id, vendor_party_id, shipment_method_type_id, carrier_party_id);


--
-- Name: prdstrvsh_cpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrvsh_cpty ON product_store_vendor_shipment USING btree (carrier_party_id);


--
-- Name: prdstrvsh_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrvsh_prds ON product_store_vendor_shipment USING btree (product_store_id);


--
-- Name: prdstrvsh_shmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrvsh_shmt ON product_store_vendor_shipment USING btree (shipment_method_type_id);


--
-- Name: prdstrvsh_vpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrvsh_vpty ON product_store_vendor_shipment USING btree (vendor_party_id);


--
-- Name: prt_str_vnr_sht_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_vnr_sht_tp ON product_store_vendor_shipment USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_vnr_sht_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_vnr_sht_ts ON product_store_vendor_shipment USING btree (created_tx_stamp);


--
-- Name: product_store_vendor_shipment prdstrvsh_cpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_shipment
    ADD CONSTRAINT prdstrvsh_cpty FOREIGN KEY (carrier_party_id) REFERENCES party(party_id);


--
-- Name: product_store_vendor_shipment prdstrvsh_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_shipment
    ADD CONSTRAINT prdstrvsh_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: product_store_vendor_shipment prdstrvsh_shmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_shipment
    ADD CONSTRAINT prdstrvsh_shmt FOREIGN KEY (shipment_method_type_id) REFERENCES shipment_method_type(shipment_method_type_id);


--
-- Name: product_store_vendor_shipment prdstrvsh_vpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_shipment
    ADD CONSTRAINT prdstrvsh_vpty FOREIGN KEY (vendor_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

