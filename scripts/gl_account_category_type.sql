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
-- Name: gl_account_category_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_account_category_type (
    gl_account_category_type_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_account_category_type OWNER TO ofbiz;

--
-- Name: gl_account_category_type pk_gl_account_category_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_category_type
    ADD CONSTRAINT pk_gl_account_category_type PRIMARY KEY (gl_account_category_type_id);


--
-- Name: gl_act_ctr_tp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_ctr_tp_txcs ON gl_account_category_type USING btree (created_tx_stamp);


--
-- Name: gl_act_ctr_tp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_ctr_tp_txsp ON gl_account_category_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

