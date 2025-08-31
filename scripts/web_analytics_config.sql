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
-- Name: web_analytics_config; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_analytics_config (
    web_site_id character varying(20) NOT NULL,
    web_analytics_type_id character varying(20) NOT NULL,
    web_analytics_code text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.web_analytics_config OWNER TO ofbiz;

--
-- Name: web_analytics_config pk_web_analytics_config; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_analytics_config
    ADD CONSTRAINT pk_web_analytics_config PRIMARY KEY (web_site_id, web_analytics_type_id);


--
-- Name: wb_anlts_cng_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_anlts_cng_txcrs ON web_analytics_config USING btree (created_tx_stamp);


--
-- Name: wb_anlts_cng_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_anlts_cng_txstp ON web_analytics_config USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

