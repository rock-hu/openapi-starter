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
-- Name: payment_gateway_authorize_net; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_authorize_net (
    payment_gateway_config_id character varying(20) NOT NULL,
    transaction_url character varying(255),
    certificate_alias character varying(255),
    api_version character varying(60),
    delimited_data character varying(60),
    delimiter_char character varying(60),
    cp_version character varying(60),
    cp_market_type character varying(60),
    cp_device_type character varying(60),
    method character varying(60),
    email_customer character varying(60),
    email_merchant character varying(60),
    test_mode character varying(60),
    relay_response character varying(60),
    tran_key character varying(255),
    user_id character varying(255),
    pwd character varying(255),
    trans_description character varying(255),
    duplicate_window numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_authorize_net OWNER TO ofbiz;

--
-- Name: payment_gateway_authorize_net pk_payment_gateway_authorize_n; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_authorize_net
    ADD CONSTRAINT pk_payment_gateway_authorize_n PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgan_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgan_pgc ON payment_gateway_authorize_net USING btree (payment_gateway_config_id);


--
-- Name: pmt_gtw_atz_nt_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_atz_nt_txp ON payment_gateway_authorize_net USING btree (last_updated_tx_stamp);


--
-- Name: pmt_gtw_atz_nt_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_atz_nt_txs ON payment_gateway_authorize_net USING btree (created_tx_stamp);


--
-- Name: payment_gateway_authorize_net pgan_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_authorize_net
    ADD CONSTRAINT pgan_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

