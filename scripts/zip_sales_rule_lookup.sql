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
-- Name: zip_sales_rule_lookup; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE zip_sales_rule_lookup (
    state_code character varying(60) NOT NULL,
    city character varying(60) NOT NULL,
    county character varying(60) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    id_code character varying(60),
    taxable character varying(60),
    ship_cond character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.zip_sales_rule_lookup OWNER TO ofbiz;

--
-- Name: zip_sales_rule_lookup pk_zip_sales_rule_lookup; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY zip_sales_rule_lookup
    ADD CONSTRAINT pk_zip_sales_rule_lookup PRIMARY KEY (state_code, city, county, from_date);


--
-- Name: zp_sls_rl_lkp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX zp_sls_rl_lkp_txcs ON zip_sales_rule_lookup USING btree (created_tx_stamp);


--
-- Name: zp_sls_rl_lkp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX zp_sls_rl_lkp_txsp ON zip_sales_rule_lookup USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

