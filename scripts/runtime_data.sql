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
-- Name: runtime_data; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE runtime_data (
    runtime_data_id character varying(20) NOT NULL,
    runtime_info text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.runtime_data OWNER TO ofbiz;

--
-- Name: runtime_data pk_runtime_data; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY runtime_data
    ADD CONSTRAINT pk_runtime_data PRIMARY KEY (runtime_data_id);


--
-- Name: rntm_dt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rntm_dt_txcrts ON runtime_data USING btree (created_tx_stamp);


--
-- Name: rntm_dt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rntm_dt_txstmp ON runtime_data USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

