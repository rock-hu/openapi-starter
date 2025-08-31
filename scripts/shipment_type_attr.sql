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
-- Name: shipment_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_type_attr (
    shipment_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_type_attr OWNER TO ofbiz;

--
-- Name: shipment_type_attr pk_shipment_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_type_attr
    ADD CONSTRAINT pk_shipment_type_attr PRIMARY KEY (shipment_type_id, attr_name);


--
-- Name: shpmnt_typatr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_typatr ON shipment_type_attr USING btree (shipment_type_id);


--
-- Name: shpmt_tp_atr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_tp_atr_txcrs ON shipment_type_attr USING btree (created_tx_stamp);


--
-- Name: shpmt_tp_atr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_tp_atr_txstp ON shipment_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: shipment_type_attr shpmnt_typatr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_type_attr
    ADD CONSTRAINT shpmnt_typatr FOREIGN KEY (shipment_type_id) REFERENCES shipment_type(shipment_type_id);


--
-- PostgreSQL database dump complete
--

