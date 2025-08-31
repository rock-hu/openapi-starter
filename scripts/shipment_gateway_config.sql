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
-- Name: shipment_gateway_config; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_gateway_config (
    shipment_gateway_config_id character varying(20) NOT NULL,
    shipment_gateway_conf_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_gateway_config OWNER TO ofbiz;

--
-- Name: shipment_gateway_config pk_shipment_gateway_config; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_config
    ADD CONSTRAINT pk_shipment_gateway_config PRIMARY KEY (shipment_gateway_config_id);


--
-- Name: sgc_sgct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgc_sgct ON shipment_gateway_config USING btree (shipment_gateway_conf_type_id);


--
-- Name: shpt_gtw_cng_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_gtw_cng_txcrs ON shipment_gateway_config USING btree (created_tx_stamp);


--
-- Name: shpt_gtw_cng_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_gtw_cng_txstp ON shipment_gateway_config USING btree (last_updated_tx_stamp);


--
-- Name: shipment_gateway_config sgc_sgct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_config
    ADD CONSTRAINT sgc_sgct FOREIGN KEY (shipment_gateway_conf_type_id) REFERENCES shipment_gateway_config_type(shipment_gateway_conf_type_id);


--
-- PostgreSQL database dump complete
--

