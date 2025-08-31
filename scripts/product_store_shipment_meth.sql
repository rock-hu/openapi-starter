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
-- Name: product_store_shipment_meth; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_shipment_meth (
    product_store_ship_meth_id character varying(20) NOT NULL,
    product_store_id character varying(20),
    shipment_method_type_id character varying(20),
    party_id character varying(20),
    role_type_id character varying(20),
    company_party_id character varying(20),
    min_weight numeric(18,6),
    max_weight numeric(18,6),
    min_size numeric(18,6),
    max_size numeric(18,6),
    min_total numeric(18,2),
    max_total numeric(18,2),
    allow_usps_addr character(1),
    require_usps_addr character(1),
    allow_company_addr character(1),
    require_company_addr character(1),
    include_no_charge_items character(1),
    include_feature_group character varying(20),
    exclude_feature_group character varying(20),
    include_geo_id character varying(20),
    exclude_geo_id character varying(20),
    service_name character varying(255),
    config_props character varying(255),
    shipment_custom_method_id character varying(20),
    shipment_gateway_config_id character varying(20),
    sequence_number numeric(20,0),
    allowance_percent numeric(18,6),
    minimum_price numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_shipment_meth OWNER TO ofbiz;

--
-- Name: product_store_shipment_meth pk_product_store_shipment_meth; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_shipment_meth
    ADD CONSTRAINT pk_product_store_shipment_meth PRIMARY KEY (product_store_ship_meth_id);


--
-- Name: prds_sm_cus_met; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_sm_cus_met ON product_store_shipment_meth USING btree (shipment_custom_method_id);


--
-- Name: prds_sm_sgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prds_sm_sgc ON product_store_shipment_meth USING btree (shipment_gateway_config_id);


--
-- Name: prt_str_sht_mth_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_sht_mth_tp ON product_store_shipment_meth USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_sht_mth_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_sht_mth_ts ON product_store_shipment_meth USING btree (created_tx_stamp);


--
-- Name: shipmentmethodtype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shipmentmethodtype ON product_store_shipment_meth USING btree (shipment_method_type_id);


--
-- Name: product_store_shipment_meth prds_sm_cus_met; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_shipment_meth
    ADD CONSTRAINT prds_sm_cus_met FOREIGN KEY (shipment_custom_method_id) REFERENCES custom_method(custom_method_id);


--
-- Name: product_store_shipment_meth prds_sm_sgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_shipment_meth
    ADD CONSTRAINT prds_sm_sgc FOREIGN KEY (shipment_gateway_config_id) REFERENCES shipment_gateway_config(shipment_gateway_config_id);


--
-- Name: product_store_shipment_meth shipmentmethodtype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_shipment_meth
    ADD CONSTRAINT shipmentmethodtype FOREIGN KEY (shipment_method_type_id) REFERENCES shipment_method_type(shipment_method_type_id);


--
-- PostgreSQL database dump complete
--

