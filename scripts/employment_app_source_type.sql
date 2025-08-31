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
-- Name: employment_app_source_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE employment_app_source_type (
    employment_app_source_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.employment_app_source_type OWNER TO ofbiz;

--
-- Name: employment_app_source_type pk_employment_app_source_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment_app_source_type
    ADD CONSTRAINT pk_employment_app_source_type PRIMARY KEY (employment_app_source_type_id);


--
-- Name: empl_app_src_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_app_src_typ ON employment_app_source_type USING btree (parent_type_id);


--
-- Name: emt_app_src_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emt_app_src_tp_txp ON employment_app_source_type USING btree (last_updated_tx_stamp);


--
-- Name: emt_app_src_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emt_app_src_tp_txs ON employment_app_source_type USING btree (created_tx_stamp);


--
-- Name: employment_app_source_type empl_app_src_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment_app_source_type
    ADD CONSTRAINT empl_app_src_typ FOREIGN KEY (parent_type_id) REFERENCES employment_app_source_type(employment_app_source_type_id);


--
-- PostgreSQL database dump complete
--

