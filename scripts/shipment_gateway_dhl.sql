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
-- Name: shipment_gateway_dhl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_gateway_dhl (
    shipment_gateway_config_id character varying(20) NOT NULL,
    connect_url character varying(255),
    connect_timeout numeric(20,0),
    head_version character varying(60),
    head_action character varying(255),
    access_user_id character varying(255),
    access_password character varying(255),
    access_account_nbr character varying(255),
    access_shipping_key character varying(255),
    label_image_format character varying(60),
    rate_estimate_template character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_gateway_dhl OWNER TO ofbiz;

--
-- Name: shipment_gateway_dhl pk_shipment_gateway_dhl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_dhl
    ADD CONSTRAINT pk_shipment_gateway_dhl PRIMARY KEY (shipment_gateway_config_id);


--
-- Name: sgdhl_sgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgdhl_sgc ON shipment_gateway_dhl USING btree (shipment_gateway_config_id);


--
-- Name: shpt_gtw_dhl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_gtw_dhl_txcrs ON shipment_gateway_dhl USING btree (created_tx_stamp);


--
-- Name: shpt_gtw_dhl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_gtw_dhl_txstp ON shipment_gateway_dhl USING btree (last_updated_tx_stamp);


--
-- Name: shipment_gateway_dhl sgdhl_sgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_dhl
    ADD CONSTRAINT sgdhl_sgc FOREIGN KEY (shipment_gateway_config_id) REFERENCES shipment_gateway_config(shipment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

