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
-- Name: payment_gateway_pay_pal; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_pay_pal (
    payment_gateway_config_id character varying(20) NOT NULL,
    business_email character varying(255),
    api_user_name character varying(60),
    api_password character varying(60),
    api_signature character varying(60),
    api_environment character varying(60),
    notify_url character varying(255),
    return_url character varying(255),
    cancel_return_url character varying(255),
    image_url character varying(255),
    confirm_template character varying(255),
    redirect_url character varying(255),
    confirm_url character varying(255),
    shipping_callback_url character varying(2000),
    require_confirmed_shipping character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_pay_pal OWNER TO ofbiz;

--
-- Name: payment_gateway_pay_pal pk_payment_gateway_pay_pal; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_pay_pal
    ADD CONSTRAINT pk_payment_gateway_pay_pal PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgpp_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgpp_pgc ON payment_gateway_pay_pal USING btree (payment_gateway_config_id);


--
-- Name: pmt_gtw_p_pl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_p_pl_txcrs ON payment_gateway_pay_pal USING btree (created_tx_stamp);


--
-- Name: pmt_gtw_p_pl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_gtw_p_pl_txstp ON payment_gateway_pay_pal USING btree (last_updated_tx_stamp);


--
-- Name: payment_gateway_pay_pal pgpp_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_pay_pal
    ADD CONSTRAINT pgpp_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

