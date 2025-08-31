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
-- Name: document; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE document (
    document_id character varying(20) NOT NULL,
    document_type_id character varying(20),
    date_created timestamp with time zone,
    comments character varying(255),
    document_location character varying(255),
    document_text character varying(255),
    image_data bytea,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.document OWNER TO ofbiz;

--
-- Name: document pk_document; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY document
    ADD CONSTRAINT pk_document PRIMARY KEY (document_id);


--
-- Name: document_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX document_to_type ON document USING btree (document_type_id);


--
-- Name: document_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX document_txcrts ON document USING btree (created_tx_stamp);


--
-- Name: document_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX document_txstmp ON document USING btree (last_updated_tx_stamp);


--
-- Name: document document_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY document
    ADD CONSTRAINT document_to_type FOREIGN KEY (document_type_id) REFERENCES document_type(document_type_id);


--
-- PostgreSQL database dump complete
--

