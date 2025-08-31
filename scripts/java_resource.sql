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
-- Name: java_resource; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE java_resource (
    resource_name character varying(255) NOT NULL,
    resource_value bytea,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.java_resource OWNER TO ofbiz;

--
-- Name: java_resource pk_java_resource; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY java_resource
    ADD CONSTRAINT pk_java_resource PRIMARY KEY (resource_name);


--
-- Name: jv_rsrc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jv_rsrc_txcrts ON java_resource USING btree (created_tx_stamp);


--
-- Name: jv_rsrc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jv_rsrc_txstmp ON java_resource USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

