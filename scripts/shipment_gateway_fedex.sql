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
-- Name: shipment_gateway_fedex; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_gateway_fedex (
    shipment_gateway_config_id character varying(20) NOT NULL,
    connect_url character varying(255),
    connect_soap_url character varying(255),
    connect_timeout numeric(20,0),
    access_account_nbr character varying(255),
    access_meter_number character varying(255),
    access_user_key character varying(255),
    access_user_pwd character varying(255),
    label_image_type character varying(60),
    default_dropoff_type character varying(255),
    default_packaging_type character varying(255),
    template_shipment character varying(255),
    template_subscription character varying(255),
    rate_estimate_template character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_gateway_fedex OWNER TO ofbiz;

--
-- Name: shipment_gateway_fedex pk_shipment_gateway_fedex; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_fedex
    ADD CONSTRAINT pk_shipment_gateway_fedex PRIMARY KEY (shipment_gateway_config_id);


--
-- Name: sgfed_sgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgfed_sgc ON shipment_gateway_fedex USING btree (shipment_gateway_config_id);


--
-- Name: shpt_gtw_fdx_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_gtw_fdx_txcrs ON shipment_gateway_fedex USING btree (created_tx_stamp);


--
-- Name: shpt_gtw_fdx_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_gtw_fdx_txstp ON shipment_gateway_fedex USING btree (last_updated_tx_stamp);


--
-- Name: shipment_gateway_fedex sgfed_sgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_fedex
    ADD CONSTRAINT sgfed_sgc FOREIGN KEY (shipment_gateway_config_id) REFERENCES shipment_gateway_config(shipment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

