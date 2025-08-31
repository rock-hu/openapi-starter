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
-- Name: electronic_text; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE electronic_text (
    data_resource_id character varying(20) NOT NULL,
    text_data text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.electronic_text OWNER TO ofbiz;

--
-- Name: electronic_text pk_electronic_text; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY electronic_text
    ADD CONSTRAINT pk_electronic_text PRIMARY KEY (data_resource_id);


--
-- Name: data_rec_text; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX data_rec_text ON electronic_text USING btree (data_resource_id);


--
-- Name: elctrnc_txt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX elctrnc_txt_txcrts ON electronic_text USING btree (created_tx_stamp);


--
-- Name: elctrnc_txt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX elctrnc_txt_txstmp ON electronic_text USING btree (last_updated_tx_stamp);


--
-- Name: electronic_text data_rec_text; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY electronic_text
    ADD CONSTRAINT data_rec_text FOREIGN KEY (data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- PostgreSQL database dump complete
--

