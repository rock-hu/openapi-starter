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
-- Name: payment_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_type_attr (
    payment_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_type_attr OWNER TO ofbiz;

--
-- Name: payment_type_attr pk_payment_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_type_attr
    ADD CONSTRAINT pk_payment_type_attr PRIMARY KEY (payment_type_id, attr_name);


--
-- Name: paymeth_type_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX paymeth_type_attr ON payment_type_attr USING btree (payment_type_id);


--
-- Name: pmnt_tp_atr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_tp_atr_txcrts ON payment_type_attr USING btree (created_tx_stamp);


--
-- Name: pmnt_tp_atr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_tp_atr_txstmp ON payment_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: payment_type_attr paymeth_type_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_type_attr
    ADD CONSTRAINT paymeth_type_attr FOREIGN KEY (payment_type_id) REFERENCES payment_type(payment_type_id);


--
-- PostgreSQL database dump complete
--

