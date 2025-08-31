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
-- Name: payment_gateway_cyber_source; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_cyber_source (
    payment_gateway_config_id character varying(20) NOT NULL,
    merchant_id character varying(255),
    api_version character varying(60),
    production character varying(60),
    keys_dir character varying(255),
    keys_file character varying(255),
    log_enabled character varying(60),
    log_dir character varying(255),
    log_file character varying(255),
    log_size numeric(20,0),
    merchant_descr character varying(255),
    merchant_contact character varying(255),
    auto_bill character varying(60),
    enable_dav character(1),
    fraud_score character(1),
    ignore_avs character varying(60),
    disable_bill_avs character(1),
    avs_decline_codes character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_cyber_source OWNER TO ofbiz;

--
-- Name: payment_gateway_cyber_source pk_payment_gateway_cyber_sourc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_cyber_source
    ADD CONSTRAINT pk_payment_gateway_cyber_sourc PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgcs_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgcs_pgc ON payment_gateway_cyber_source USING btree (payment_gateway_config_id);


--
-- Name: pmt_gtw_cbr_src_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_cbr_src_tp ON payment_gateway_cyber_source USING btree (last_updated_tx_stamp);


--
-- Name: pmt_gtw_cbr_src_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_cbr_src_ts ON payment_gateway_cyber_source USING btree (created_tx_stamp);


--
-- Name: payment_gateway_cyber_source pgcs_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_cyber_source
    ADD CONSTRAINT pgcs_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

