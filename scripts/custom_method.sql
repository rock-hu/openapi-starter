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
-- Name: custom_method; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE custom_method (
    custom_method_id character varying(20) NOT NULL,
    custom_method_type_id character varying(20),
    custom_method_name character varying(255),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.custom_method OWNER TO ofbiz;

--
-- Name: custom_method pk_custom_method; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY custom_method
    ADD CONSTRAINT pk_custom_method PRIMARY KEY (custom_method_id);


--
-- Name: cme_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cme_to_type ON custom_method USING btree (custom_method_type_id);


--
-- Name: cstm_mthd_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cstm_mthd_txcrts ON custom_method USING btree (created_tx_stamp);


--
-- Name: cstm_mthd_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cstm_mthd_txstmp ON custom_method USING btree (last_updated_tx_stamp);


--
-- Name: custom_method cme_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY custom_method
    ADD CONSTRAINT cme_to_type FOREIGN KEY (custom_method_type_id) REFERENCES custom_method_type(custom_method_type_id);


--
-- PostgreSQL database dump complete
--

