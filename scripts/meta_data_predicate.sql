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
-- Name: meta_data_predicate; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE meta_data_predicate (
    meta_data_predicate_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.meta_data_predicate OWNER TO ofbiz;

--
-- Name: meta_data_predicate pk_meta_data_predicate; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY meta_data_predicate
    ADD CONSTRAINT pk_meta_data_predicate PRIMARY KEY (meta_data_predicate_id);


--
-- Name: mt_dt_prdct_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mt_dt_prdct_txcrts ON meta_data_predicate USING btree (created_tx_stamp);


--
-- Name: mt_dt_prdct_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mt_dt_prdct_txstmp ON meta_data_predicate USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

