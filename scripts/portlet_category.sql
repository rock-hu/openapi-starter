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
-- Name: portlet_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE portlet_category (
    portlet_category_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.portlet_category OWNER TO ofbiz;

--
-- Name: portlet_category pk_portlet_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portlet_category
    ADD CONSTRAINT pk_portlet_category PRIMARY KEY (portlet_category_id);


--
-- Name: prtlt_ctgr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtlt_ctgr_txcrts ON portlet_category USING btree (created_tx_stamp);


--
-- Name: prtlt_ctgr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtlt_ctgr_txstmp ON portlet_category USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

