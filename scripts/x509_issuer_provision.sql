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
-- Name: x509_issuer_provision; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE x509_issuer_provision (
    cert_provision_id character varying(20) NOT NULL,
    common_name character varying(255),
    organizational_unit character varying(255),
    organization_name character varying(255),
    city_locality character varying(255),
    state_province character varying(255),
    country character varying(255),
    serial_number character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.x509_issuer_provision OWNER TO ofbiz;

--
-- Name: x509_issuer_provision pk_x509_issuer_provision; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY x509_issuer_provision
    ADD CONSTRAINT pk_x509_issuer_provision PRIMARY KEY (cert_provision_id);


--
-- Name: x59_isr_prvn_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX x59_isr_prvn_txcrs ON x509_issuer_provision USING btree (created_tx_stamp);


--
-- Name: x59_isr_prvn_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX x59_isr_prvn_txstp ON x509_issuer_provision USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

