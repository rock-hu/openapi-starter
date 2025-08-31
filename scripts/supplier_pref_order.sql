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
-- Name: supplier_pref_order; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE supplier_pref_order (
    supplier_pref_order_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.supplier_pref_order OWNER TO ofbiz;

--
-- Name: supplier_pref_order pk_supplier_pref_order; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_pref_order
    ADD CONSTRAINT pk_supplier_pref_order PRIMARY KEY (supplier_pref_order_id);


--
-- Name: sppr_prf_orr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sppr_prf_orr_txcrs ON supplier_pref_order USING btree (created_tx_stamp);


--
-- Name: sppr_prf_orr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sppr_prf_orr_txstp ON supplier_pref_order USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

