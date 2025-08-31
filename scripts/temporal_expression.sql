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
-- Name: temporal_expression; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE temporal_expression (
    temp_expr_id character varying(20) NOT NULL,
    temp_expr_type_id character varying(20),
    description character varying(255),
    date1 timestamp with time zone,
    date2 timestamp with time zone,
    integer1 numeric(20,0),
    integer2 numeric(20,0),
    string1 character varying(20),
    string2 character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.temporal_expression OWNER TO ofbiz;

--
-- Name: temporal_expression pk_temporal_expression; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY temporal_expression
    ADD CONSTRAINT pk_temporal_expression PRIMARY KEY (temp_expr_id);


--
-- Name: tmpl_exprsn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tmpl_exprsn_txcrts ON temporal_expression USING btree (created_tx_stamp);


--
-- Name: tmpl_exprsn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tmpl_exprsn_txstmp ON temporal_expression USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

