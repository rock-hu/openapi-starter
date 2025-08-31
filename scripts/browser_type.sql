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
-- Name: browser_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE browser_type (
    browser_type_id character varying(20) NOT NULL,
    browser_name character varying(100),
    browser_version character varying(10),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.browser_type OWNER TO ofbiz;

--
-- Name: browser_type pk_browser_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY browser_type
    ADD CONSTRAINT pk_browser_type PRIMARY KEY (browser_type_id);


--
-- Name: brwsr_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX brwsr_tp_txcrts ON browser_type USING btree (created_tx_stamp);


--
-- Name: brwsr_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX brwsr_tp_txstmp ON browser_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

