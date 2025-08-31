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
-- Name: shipment_contact_mech_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_contact_mech_type (
    shipment_contact_mech_type_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_contact_mech_type OWNER TO ofbiz;

--
-- Name: shipment_contact_mech_type pk_shipment_contact_mech_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_contact_mech_type
    ADD CONSTRAINT pk_shipment_contact_mech_type PRIMARY KEY (shipment_contact_mech_type_id);


--
-- Name: sht_cnt_mch_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sht_cnt_mch_tp_txp ON shipment_contact_mech_type USING btree (last_updated_tx_stamp);


--
-- Name: sht_cnt_mch_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sht_cnt_mch_tp_txs ON shipment_contact_mech_type USING btree (created_tx_stamp);


--
-- PostgreSQL database dump complete
--

