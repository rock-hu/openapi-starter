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
-- Name: shipment_gateway_ups; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_gateway_ups (
    shipment_gateway_config_id character varying(20) NOT NULL,
    connect_url character varying(255),
    connect_timeout numeric(20,0),
    shipper_number character varying(255),
    bill_shipper_account_number character varying(255),
    access_license_number character varying(255),
    access_user_id character varying(255),
    access_password character varying(255),
    save_cert_info character varying(60),
    save_cert_path character varying(255),
    shipper_pickup_type character varying(60),
    customer_classification character varying(60),
    max_estimate_weight numeric(18,6),
    min_estimate_weight numeric(18,6),
    cod_allow_cod character varying(255),
    cod_surcharge_amount numeric(18,6),
    cod_surcharge_currency_uom_id character varying(60),
    cod_surcharge_apply_to_package character varying(60),
    cod_funds_code character varying(60),
    default_return_label_memo character varying(255),
    default_return_label_subject character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_gateway_ups OWNER TO ofbiz;

--
-- Name: shipment_gateway_ups pk_shipment_gateway_ups; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_ups
    ADD CONSTRAINT pk_shipment_gateway_ups PRIMARY KEY (shipment_gateway_config_id);


--
-- Name: sgups_sgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgups_sgc ON shipment_gateway_ups USING btree (shipment_gateway_config_id);


--
-- Name: shpt_gtw_ups_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_gtw_ups_txcrs ON shipment_gateway_ups USING btree (created_tx_stamp);


--
-- Name: shpt_gtw_ups_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_gtw_ups_txstp ON shipment_gateway_ups USING btree (last_updated_tx_stamp);


--
-- Name: shipment_gateway_ups sgups_sgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_ups
    ADD CONSTRAINT sgups_sgc FOREIGN KEY (shipment_gateway_config_id) REFERENCES shipment_gateway_config(shipment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

