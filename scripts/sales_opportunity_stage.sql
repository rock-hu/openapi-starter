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
-- Name: sales_opportunity_stage; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sales_opportunity_stage (
    opportunity_stage_id character varying(20) NOT NULL,
    description character varying(255),
    default_probability numeric(18,6),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sales_opportunity_stage OWNER TO ofbiz;

--
-- Name: sales_opportunity_stage pk_sales_opportunity_stage; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sales_opportunity_stage
    ADD CONSTRAINT pk_sales_opportunity_stage PRIMARY KEY (opportunity_stage_id);


--
-- Name: sls_opprt_stg_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_stg_txcs ON sales_opportunity_stage USING btree (created_tx_stamp);


--
-- Name: sls_opprt_stg_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sls_opprt_stg_txsp ON sales_opportunity_stage USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

