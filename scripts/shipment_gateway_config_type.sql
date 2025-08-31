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
-- Name: shipment_gateway_config_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_gateway_config_type (
    shipment_gateway_conf_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_gateway_config_type OWNER TO ofbiz;

--
-- Name: shipment_gateway_config_type pk_shipment_gateway_config_typ; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_config_type
    ADD CONSTRAINT pk_shipment_gateway_config_typ PRIMARY KEY (shipment_gateway_conf_type_id);


--
-- Name: sgct_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgct_par ON shipment_gateway_config_type USING btree (parent_type_id);


--
-- Name: sht_gtw_cng_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sht_gtw_cng_tp_txp ON shipment_gateway_config_type USING btree (last_updated_tx_stamp);


--
-- Name: sht_gtw_cng_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sht_gtw_cng_tp_txs ON shipment_gateway_config_type USING btree (created_tx_stamp);


--
-- Name: shipment_gateway_config_type sgct_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_gateway_config_type
    ADD CONSTRAINT sgct_par FOREIGN KEY (parent_type_id) REFERENCES shipment_gateway_config_type(shipment_gateway_conf_type_id);


--
-- PostgreSQL database dump complete
--

