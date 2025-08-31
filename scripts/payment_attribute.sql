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
-- Name: payment_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_attribute (
    payment_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_attribute OWNER TO ofbiz;

--
-- Name: payment_attribute pk_payment_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_attribute
    ADD CONSTRAINT pk_payment_attribute PRIMARY KEY (payment_id, attr_name);


--
-- Name: payment_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_attr ON payment_attribute USING btree (payment_id);


--
-- Name: pmnt_attrbt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_attrbt_txcrts ON payment_attribute USING btree (created_tx_stamp);


--
-- Name: pmnt_attrbt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmnt_attrbt_txstmp ON payment_attribute USING btree (last_updated_tx_stamp);


--
-- Name: payment_attribute payment_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_attribute
    ADD CONSTRAINT payment_attr FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- PostgreSQL database dump complete
--

