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
-- Name: payment_gateway_secure_pay; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_secure_pay (
    payment_gateway_config_id character varying(20) NOT NULL,
    merchant_id character varying(255),
    pwd character varying(255),
    server_u_r_l character varying(255),
    process_timeout numeric(20,0),
    enable_amount_round character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_secure_pay OWNER TO ofbiz;

--
-- Name: payment_gateway_secure_pay pk_payment_gateway_secure_pay; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_secure_pay
    ADD CONSTRAINT pk_payment_gateway_secure_pay PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgscp_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgscp_pgc ON payment_gateway_secure_pay USING btree (payment_gateway_config_id);


--
-- Name: pmt_gtw_scr_p_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_scr_p_txcs ON payment_gateway_secure_pay USING btree (created_tx_stamp);


--
-- Name: pmt_gtw_scr_p_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_scr_p_txsp ON payment_gateway_secure_pay USING btree (last_updated_tx_stamp);


--
-- Name: payment_gateway_secure_pay pgscp_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_secure_pay
    ADD CONSTRAINT pgscp_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

