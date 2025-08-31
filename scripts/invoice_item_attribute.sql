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
-- Name: invoice_item_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_item_attribute (
    invoice_id character varying(20) NOT NULL,
    invoice_item_seq_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_item_attribute OWNER TO ofbiz;

--
-- Name: invoice_item_attribute pk_invoice_item_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_attribute
    ADD CONSTRAINT pk_invoice_item_attribute PRIMARY KEY (invoice_id, invoice_item_seq_id, attr_name);


--
-- Name: inc_itm_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_itm_attt_txcrs ON invoice_item_attribute USING btree (created_tx_stamp);


--
-- Name: inc_itm_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_itm_attt_txstp ON invoice_item_attribute USING btree (last_updated_tx_stamp);


--
-- Name: invoice_imat_itm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_imat_itm ON invoice_item_attribute USING btree (invoice_id, invoice_item_seq_id);


--
-- Name: invoice_item_attribute invoice_imat_itm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_attribute
    ADD CONSTRAINT invoice_imat_itm FOREIGN KEY (invoice_id, invoice_item_seq_id) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- PostgreSQL database dump complete
--

