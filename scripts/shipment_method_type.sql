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
-- Name: shipment_method_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_method_type (
    shipment_method_type_id character varying(20) NOT NULL,
    description character varying(255),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_method_type OWNER TO ofbiz;

--
-- Name: shipment_method_type pk_shipment_method_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_method_type
    ADD CONSTRAINT pk_shipment_method_type PRIMARY KEY (shipment_method_type_id);


--
-- Name: shpmt_mtd_tp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_mtd_tp_txcrs ON shipment_method_type USING btree (created_tx_stamp);


--
-- Name: shpmt_mtd_tp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_mtd_tp_txstp ON shipment_method_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

