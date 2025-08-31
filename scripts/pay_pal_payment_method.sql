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
-- Name: pay_pal_payment_method; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE pay_pal_payment_method (
    payment_method_id character varying(20) NOT NULL,
    payer_id character varying(20),
    express_checkout_token character varying(60),
    payer_status character varying(60),
    avs_addr character(1),
    avs_zip character(1),
    correlation_id character varying(20),
    contact_mech_id character varying(20),
    transaction_id character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.pay_pal_payment_method OWNER TO ofbiz;

--
-- Name: pay_pal_payment_method pk_pay_pal_payment_method; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY pay_pal_payment_method
    ADD CONSTRAINT pk_pay_pal_payment_method PRIMARY KEY (payment_method_id);


--
-- Name: p_pl_pmt_mtd_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX p_pl_pmt_mtd_txcrs ON pay_pal_payment_method USING btree (created_tx_stamp);


--
-- Name: p_pl_pmt_mtd_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX p_pl_pmt_mtd_txstp ON pay_pal_payment_method USING btree (last_updated_tx_stamp);


--
-- Name: paypal_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paypal_cmech ON pay_pal_payment_method USING btree (contact_mech_id);


--
-- Name: paypal_paddr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paypal_paddr ON pay_pal_payment_method USING btree (contact_mech_id);


--
-- Name: paypal_pmntmeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paypal_pmntmeth ON pay_pal_payment_method USING btree (payment_method_id);


--
-- Name: pay_pal_payment_method paypal_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY pay_pal_payment_method
    ADD CONSTRAINT paypal_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: pay_pal_payment_method paypal_paddr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY pay_pal_payment_method
    ADD CONSTRAINT paypal_paddr FOREIGN KEY (contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: pay_pal_payment_method paypal_pmntmeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY pay_pal_payment_method
    ADD CONSTRAINT paypal_pmntmeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- PostgreSQL database dump complete
--

