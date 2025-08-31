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
-- Name: payment_gateway_sage_pay; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_sage_pay (
    payment_gateway_config_id character varying(20) NOT NULL,
    vendor character varying(60),
    production_host character varying(60),
    testing_host character varying(60),
    sage_pay_mode character varying(60),
    protocol_version character varying(10),
    authentication_trans_type character varying(60),
    authentication_url character varying(255),
    authorise_trans_type character varying(60),
    authorise_url character varying(255),
    release_trans_type character varying(60),
    release_url character varying(255),
    void_url character varying(255),
    refund_url character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_sage_pay OWNER TO ofbiz;

--
-- Name: payment_gateway_sage_pay pk_payment_gateway_sage_pay; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_sage_pay
    ADD CONSTRAINT pk_payment_gateway_sage_pay PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgsp_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgsp_pgc ON payment_gateway_sage_pay USING btree (payment_gateway_config_id);


--
-- Name: pmt_gtw_sg_p_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_sg_p_txcrs ON payment_gateway_sage_pay USING btree (created_tx_stamp);


--
-- Name: pmt_gtw_sg_p_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_sg_p_txstp ON payment_gateway_sage_pay USING btree (last_updated_tx_stamp);


--
-- Name: payment_gateway_sage_pay pgsp_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_sage_pay
    ADD CONSTRAINT pgsp_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

