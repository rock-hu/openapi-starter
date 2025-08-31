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
-- Name: invoice_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_type (
    invoice_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_type OWNER TO ofbiz;

--
-- Name: invoice_type pk_invoice_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_type
    ADD CONSTRAINT pk_invoice_type PRIMARY KEY (invoice_type_id);


--
-- Name: invc_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_tp_txcrts ON invoice_type USING btree (created_tx_stamp);


--
-- Name: invc_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_tp_txstmp ON invoice_type USING btree (last_updated_tx_stamp);


--
-- Name: invoice_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_type_par ON invoice_type USING btree (parent_type_id);


--
-- Name: invoice_type invoice_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_type
    ADD CONSTRAINT invoice_type_par FOREIGN KEY (parent_type_id) REFERENCES invoice_type(invoice_type_id);


--
-- PostgreSQL database dump complete
--

