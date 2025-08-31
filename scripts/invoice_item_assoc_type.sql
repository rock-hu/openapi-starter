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
-- Name: invoice_item_assoc_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_item_assoc_type (
    invoice_item_assoc_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_item_assoc_type OWNER TO ofbiz;

--
-- Name: invoice_item_assoc_type pk_invoice_item_assoc_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_assoc_type
    ADD CONSTRAINT pk_invoice_item_assoc_type PRIMARY KEY (invoice_item_assoc_type_id);


--
-- Name: inc_itm_asc_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_itm_asc_tp_txp ON invoice_item_assoc_type USING btree (last_updated_tx_stamp);


--
-- Name: inc_itm_asc_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inc_itm_asc_tp_txs ON invoice_item_assoc_type USING btree (created_tx_stamp);


--
-- Name: initmasctyp_prnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX initmasctyp_prnt ON invoice_item_assoc_type USING btree (parent_type_id);


--
-- Name: invoice_item_assoc_type initmasctyp_prnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_item_assoc_type
    ADD CONSTRAINT initmasctyp_prnt FOREIGN KEY (parent_type_id) REFERENCES invoice_item_assoc_type(invoice_item_assoc_type_id);


--
-- PostgreSQL database dump complete
--

