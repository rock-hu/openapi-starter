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
-- Name: invoice_term_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_term_attribute (
    invoice_term_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_term_attribute OWNER TO ofbiz;

--
-- Name: invoice_term_attribute pk_invoice_term_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_term_attribute
    ADD CONSTRAINT pk_invoice_term_attribute PRIMARY KEY (invoice_term_id, attr_name);


--
-- Name: inc_trm_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_trm_attt_txcrs ON invoice_term_attribute USING btree (created_tx_stamp);


--
-- Name: inc_trm_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_trm_attt_txstp ON invoice_term_attribute USING btree (last_updated_tx_stamp);


--
-- Name: invoice_trm_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_trm_attr ON invoice_term_attribute USING btree (invoice_term_id);


--
-- Name: invoice_term_attribute invoice_trm_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_term_attribute
    ADD CONSTRAINT invoice_trm_attr FOREIGN KEY (invoice_term_id) REFERENCES invoice_term(invoice_term_id);


--
-- PostgreSQL database dump complete
--

