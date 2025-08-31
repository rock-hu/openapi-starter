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
-- Name: product_meter_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_meter_type (
    product_meter_type_id character varying(20) NOT NULL,
    description character varying(255),
    default_uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_meter_type OWNER TO ofbiz;

--
-- Name: product_meter_type pk_product_meter_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_meter_type
    ADD CONSTRAINT pk_product_meter_type PRIMARY KEY (product_meter_type_id);


--
-- Name: prdt_mtr_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_mtr_tp_txcrts ON product_meter_type USING btree (created_tx_stamp);


--
-- Name: prdt_mtr_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_mtr_tp_txstmp ON product_meter_type USING btree (last_updated_tx_stamp);


--
-- Name: prodmtrtp_duom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodmtrtp_duom ON product_meter_type USING btree (default_uom_id);


--
-- Name: product_meter_type prodmtrtp_duom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_meter_type
    ADD CONSTRAINT prodmtrtp_duom FOREIGN KEY (default_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

