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
-- Name: file_extension; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE file_extension (
    file_extension_id character varying(60) NOT NULL,
    mime_type_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.file_extension OWNER TO ofbiz;

--
-- Name: file_extension pk_file_extension; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY file_extension
    ADD CONSTRAINT pk_file_extension PRIMARY KEY (file_extension_id);


--
-- Name: fileext_mmtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fileext_mmtyp ON file_extension USING btree (mime_type_id);


--
-- Name: fl_extnsn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fl_extnsn_txcrts ON file_extension USING btree (created_tx_stamp);


--
-- Name: fl_extnsn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fl_extnsn_txstmp ON file_extension USING btree (last_updated_tx_stamp);


--
-- Name: file_extension fileext_mmtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY file_extension
    ADD CONSTRAINT fileext_mmtyp FOREIGN KEY (mime_type_id) REFERENCES mime_type(mime_type_id);


--
-- PostgreSQL database dump complete
--

