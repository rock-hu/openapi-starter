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
-- Name: document_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE document_type (
    document_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.document_type OWNER TO ofbiz;

--
-- Name: document_type pk_document_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY document_type
    ADD CONSTRAINT pk_document_type PRIMARY KEY (document_type_id);


--
-- Name: dcmnt_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dcmnt_tp_txcrts ON document_type USING btree (created_tx_stamp);


--
-- Name: dcmnt_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dcmnt_tp_txstmp ON document_type USING btree (last_updated_tx_stamp);


--
-- Name: doc_type_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX doc_type_parent ON document_type USING btree (parent_type_id);


--
-- Name: document_type doc_type_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY document_type
    ADD CONSTRAINT doc_type_parent FOREIGN KEY (parent_type_id) REFERENCES document_type(document_type_id);


--
-- PostgreSQL database dump complete
--

