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
-- Name: telecom_gateway_config; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE telecom_gateway_config (
    telecom_gateway_config_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.telecom_gateway_config OWNER TO ofbiz;

--
-- Name: telecom_gateway_config pk_telecom_gateway_config; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY telecom_gateway_config
    ADD CONSTRAINT pk_telecom_gateway_config PRIMARY KEY (telecom_gateway_config_id);


--
-- Name: tlm_gtw_cng_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tlm_gtw_cng_txcrts ON telecom_gateway_config USING btree (created_tx_stamp);


--
-- Name: tlm_gtw_cng_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tlm_gtw_cng_txstmp ON telecom_gateway_config USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

