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
-- Name: value_link_key; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE value_link_key (
    merchant_id character varying(255) NOT NULL,
    public_key text,
    private_key text,
    exchange_key text,
    working_key text,
    working_key_index numeric(20,0),
    last_working_key text,
    created_date timestamp with time zone,
    created_by_terminal character varying(60),
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_terminal character varying(60),
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.value_link_key OWNER TO ofbiz;

--
-- Name: value_link_key pk_value_link_key; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY value_link_key
    ADD CONSTRAINT pk_value_link_key PRIMARY KEY (merchant_id);


--
-- Name: vl_lnk_k_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vl_lnk_k_txcrts ON value_link_key USING btree (created_tx_stamp);


--
-- Name: vl_lnk_k_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vl_lnk_k_txstmp ON value_link_key USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

