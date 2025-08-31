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
-- Name: tax_authority_assoc_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tax_authority_assoc_type (
    tax_authority_assoc_type_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tax_authority_assoc_type OWNER TO ofbiz;

--
-- Name: tax_authority_assoc_type pk_tax_authority_assoc_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_assoc_type
    ADD CONSTRAINT pk_tax_authority_assoc_type PRIMARY KEY (tax_authority_assoc_type_id);


--
-- Name: tx_att_asc_tp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_att_asc_tp_txcs ON tax_authority_assoc_type USING btree (created_tx_stamp);


--
-- Name: tx_att_asc_tp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_att_asc_tp_txsp ON tax_authority_assoc_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

