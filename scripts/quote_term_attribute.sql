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
-- Name: quote_term_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote_term_attribute (
    term_type_id character varying(20) NOT NULL,
    quote_id character varying(20) NOT NULL,
    quote_item_seq_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote_term_attribute OWNER TO ofbiz;

--
-- Name: quote_term_attribute pk_quote_term_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_term_attribute
    ADD CONSTRAINT pk_quote_term_attribute PRIMARY KEY (term_type_id, quote_id, quote_item_seq_id, attr_name);


--
-- Name: qt_trm_attrt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_trm_attrt_txcrs ON quote_term_attribute USING btree (created_tx_stamp);


--
-- Name: qt_trm_attrt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_trm_attrt_txstp ON quote_term_attribute USING btree (last_updated_tx_stamp);


--
-- Name: quote_term_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_term_attr ON quote_term_attribute USING btree (term_type_id, quote_id, quote_item_seq_id);


--
-- Name: quote_term_attribute quote_term_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_term_attribute
    ADD CONSTRAINT quote_term_attr FOREIGN KEY (term_type_id, quote_id, quote_item_seq_id) REFERENCES quote_term(term_type_id, quote_id, quote_item_seq_id);


--
-- PostgreSQL database dump complete
--

