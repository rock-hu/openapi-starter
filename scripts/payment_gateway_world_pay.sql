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
-- Name: payment_gateway_world_pay; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_world_pay (
    payment_gateway_config_id character varying(20) NOT NULL,
    redirect_url character varying(255),
    inst_id character varying(255),
    auth_mode character(1),
    fix_contact character(1),
    hide_contact character(1),
    hide_currency character(1),
    lang_id character varying(60),
    no_language_menu character(1),
    with_delivery character(1),
    test_mode numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_world_pay OWNER TO ofbiz;

--
-- Name: payment_gateway_world_pay pk_payment_gateway_world_pay; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_world_pay
    ADD CONSTRAINT pk_payment_gateway_world_pay PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgwp_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgwp_pgc ON payment_gateway_world_pay USING btree (payment_gateway_config_id);


--
-- Name: pmt_gtw_wrd_p_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_wrd_p_txcs ON payment_gateway_world_pay USING btree (created_tx_stamp);


--
-- Name: pmt_gtw_wrd_p_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_wrd_p_txsp ON payment_gateway_world_pay USING btree (last_updated_tx_stamp);


--
-- Name: payment_gateway_world_pay pgwp_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_world_pay
    ADD CONSTRAINT pgwp_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

