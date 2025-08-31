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
-- Name: allocation_plan_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE allocation_plan_type (
    plan_type_id character varying(20) NOT NULL,
    description character varying(255),
    has_table character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.allocation_plan_type OWNER TO ofbiz;

--
-- Name: allocation_plan_type pk_allocation_plan_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY allocation_plan_type
    ADD CONSTRAINT pk_allocation_plan_type PRIMARY KEY (plan_type_id);


--
-- Name: allcn_pln_tp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX allcn_pln_tp_txcrs ON allocation_plan_type USING btree (created_tx_stamp);


--
-- Name: allcn_pln_tp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX allcn_pln_tp_txstp ON allocation_plan_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

