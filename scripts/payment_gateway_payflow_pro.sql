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
-- Name: payment_gateway_payflow_pro; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_payflow_pro (
    payment_gateway_config_id character varying(20) NOT NULL,
    certs_path character varying(255),
    host_address character varying(255),
    host_port numeric(20,0),
    timeout numeric(20,0),
    proxy_address character varying(255),
    proxy_port numeric(20,0),
    proxy_logon character varying(255),
    proxy_password character varying(255),
    vendor character varying(60),
    user_id character varying(60),
    pwd character varying(255),
    partner character varying(60),
    check_avs character(1),
    check_cvv2 character(1),
    pre_auth character(1),
    enable_transmit character varying(255),
    log_file_name character varying(255),
    logging_level numeric(20,0),
    max_log_file_size numeric(20,0),
    stack_trace_on character(1),
    redirect_url character varying(255),
    return_url character varying(255),
    cancel_return_url character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_payflow_pro OWNER TO ofbiz;

--
-- Name: payment_gateway_payflow_pro pk_payment_gateway_payflow_pro; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_payflow_pro
    ADD CONSTRAINT pk_payment_gateway_payflow_pro PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgpf_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgpf_pgc ON payment_gateway_payflow_pro USING btree (payment_gateway_config_id);


--
-- Name: pmt_gtw_pfw_pr_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_pfw_pr_txp ON payment_gateway_payflow_pro USING btree (last_updated_tx_stamp);


--
-- Name: pmt_gtw_pfw_pr_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_pfw_pr_txs ON payment_gateway_payflow_pro USING btree (created_tx_stamp);


--
-- Name: payment_gateway_payflow_pro pgpf_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_payflow_pro
    ADD CONSTRAINT pgpf_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

