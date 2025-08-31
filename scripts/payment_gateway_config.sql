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
-- Name: payment_gateway_config; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_config (
    payment_gateway_config_id character varying(20) NOT NULL,
    payment_gateway_config_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_config OWNER TO ofbiz;

--
-- Name: payment_gateway_config pk_payment_gateway_config; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_config
    ADD CONSTRAINT pk_payment_gateway_config PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgc_pgct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgc_pgct ON payment_gateway_config USING btree (payment_gateway_config_type_id);


--
-- Name: pmt_gtw_cng_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_cng_txcrts ON payment_gateway_config USING btree (created_tx_stamp);


--
-- Name: pmt_gtw_cng_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_cng_txstmp ON payment_gateway_config USING btree (last_updated_tx_stamp);


--
-- Name: payment_gateway_config pgc_pgct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_config
    ADD CONSTRAINT pgc_pgct FOREIGN KEY (payment_gateway_config_type_id) REFERENCES payment_gateway_config_type(payment_gateway_config_type_id);


--
-- PostgreSQL database dump complete
--

