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
-- Name: shipment_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_attribute (
    shipment_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_attribute OWNER TO ofbiz;

--
-- Name: shipment_attribute pk_shipment_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_attribute
    ADD CONSTRAINT pk_shipment_attribute PRIMARY KEY (shipment_id, attr_name);


--
-- Name: shpmnt_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_attr ON shipment_attribute USING btree (shipment_id);


--
-- Name: shpmt_attrt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_attrt_txcrts ON shipment_attribute USING btree (created_tx_stamp);


--
-- Name: shpmt_attrt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_attrt_txstmp ON shipment_attribute USING btree (last_updated_tx_stamp);


--
-- Name: shipment_attribute shpmnt_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_attribute
    ADD CONSTRAINT shpmnt_attr FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id);


--
-- PostgreSQL database dump complete
--

