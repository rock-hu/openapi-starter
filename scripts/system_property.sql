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
-- Name: system_property; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE system_property (
    system_resource_id character varying(60) NOT NULL,
    system_property_id character varying(60) NOT NULL,
    system_property_value character varying(255),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.system_property OWNER TO ofbiz;

--
-- Name: system_property pk_system_property; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY system_property
    ADD CONSTRAINT pk_system_property PRIMARY KEY (system_resource_id, system_property_id);


--
-- Name: sstm_prprt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sstm_prprt_txcrts ON system_property USING btree (created_tx_stamp);


--
-- Name: sstm_prprt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sstm_prprt_txstmp ON system_property USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

