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
-- Name: payment_gateway_config_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_config_type (
    payment_gateway_config_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_config_type OWNER TO ofbiz;

--
-- Name: payment_gateway_config_type pk_payment_gateway_config_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_config_type
    ADD CONSTRAINT pk_payment_gateway_config_type PRIMARY KEY (payment_gateway_config_type_id);


--
-- Name: pgct_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgct_par ON payment_gateway_config_type USING btree (parent_type_id);


--
-- Name: pmt_gtw_cng_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_cng_tp_txp ON payment_gateway_config_type USING btree (last_updated_tx_stamp);


--
-- Name: pmt_gtw_cng_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_cng_tp_txs ON payment_gateway_config_type USING btree (created_tx_stamp);


--
-- Name: payment_gateway_config_type pgct_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_config_type
    ADD CONSTRAINT pgct_par FOREIGN KEY (parent_type_id) REFERENCES payment_gateway_config_type(payment_gateway_config_type_id);


--
-- PostgreSQL database dump complete
--

