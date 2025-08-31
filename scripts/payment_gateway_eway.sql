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
-- Name: payment_gateway_eway; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_gateway_eway (
    payment_gateway_config_id character varying(20) NOT NULL,
    customer_id character varying(255),
    refund_pwd character varying(255),
    test_mode character varying(60),
    enable_cvn character varying(60),
    enable_beagle character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_gateway_eway OWNER TO ofbiz;

--
-- Name: payment_gateway_eway pk_payment_gateway_eway; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_eway
    ADD CONSTRAINT pk_payment_gateway_eway PRIMARY KEY (payment_gateway_config_id);


--
-- Name: pgew_pgc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pgew_pgc ON payment_gateway_eway USING btree (payment_gateway_config_id);


--
-- Name: pmnt_gtw_ew_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_gtw_ew_txcrts ON payment_gateway_eway USING btree (created_tx_stamp);


--
-- Name: pmnt_gtw_ew_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_gtw_ew_txstmp ON payment_gateway_eway USING btree (last_updated_tx_stamp);


--
-- Name: payment_gateway_eway pgew_pgc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_gateway_eway
    ADD CONSTRAINT pgew_pgc FOREIGN KEY (payment_gateway_config_id) REFERENCES payment_gateway_config(payment_gateway_config_id);


--
-- PostgreSQL database dump complete
--

