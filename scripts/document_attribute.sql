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
-- Name: document_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE document_attribute (
    document_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.document_attribute OWNER TO ofbiz;

--
-- Name: document_attribute pk_document_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY document_attribute
    ADD CONSTRAINT pk_document_attribute PRIMARY KEY (document_id, attr_name);


--
-- Name: dcmnt_attrt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dcmnt_attrt_txcrts ON document_attribute USING btree (created_tx_stamp);


--
-- Name: dcmnt_attrt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dcmnt_attrt_txstmp ON document_attribute USING btree (last_updated_tx_stamp);


--
-- Name: document_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX document_attr ON document_attribute USING btree (document_id);


--
-- Name: document_attribute document_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY document_attribute
    ADD CONSTRAINT document_attr FOREIGN KEY (document_id) REFERENCES document(document_id);


--
-- PostgreSQL database dump complete
--

