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
-- Name: payment_gateway_orbital; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_orbital (
    payment_gateway_config_id character varying(20) NOT NULL,
    username character varying(60),
    connection_password character varying(255),
    merchant_id character varying(255),
    engine_class character varying(255),
    host_name character varying(255),
    port numeric(20,0),
    host_name_failover character varying(255),
    port_failover numeric(20,0),
    connection_timeout_seconds numeric(20,0),
    read_timeout_seconds numeric(20,0),
    authorization_u_r_i character varying(255),
    sdk_version character varying(60),
    ssl_socket_factory character varying(60),
    response_type character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_orbital OWNER TO ofbiz;

--
-- Name: payment_gateway_orbital pk_payment_gateway_orbital; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_orbital
    ADD CONSTRAINT pk_payment_gateway_orbital PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgorb_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgorb_pgc ON payment_gateway_orbital USING btree (payment_gateway_config_id);


--
-- Name: pmt_gtw_orbl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_orbl_txcrs ON payment_gateway_orbital USING btree (created_tx_stamp);


--
-- Name: pmt_gtw_orbl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_orbl_txstp ON payment_gateway_orbital USING btree (last_updated_tx_stamp);


--
-- Name: payment_gateway_orbital pgorb_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_orbital
    ADD CONSTRAINT pgorb_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

