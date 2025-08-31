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
-- Name: invoice_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_type_attr (
    invoice_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_type_attr OWNER TO ofbiz;

--
-- Name: invoice_type_attr pk_invoice_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_type_attr
    ADD CONSTRAINT pk_invoice_type_attr PRIMARY KEY (invoice_type_id, attr_name);


--
-- Name: invc_tp_atr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_tp_atr_txcrts ON invoice_type_attr USING btree (created_tx_stamp);


--
-- Name: invc_tp_atr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_tp_atr_txstmp ON invoice_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: invoice_tpat_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_tpat_typ ON invoice_type_attr USING btree (invoice_type_id);


--
-- Name: invoice_type_attr invoice_tpat_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_type_attr
    ADD CONSTRAINT invoice_tpat_typ FOREIGN KEY (invoice_type_id) REFERENCES invoice_type(invoice_type_id);


--
-- PostgreSQL database dump complete
--

