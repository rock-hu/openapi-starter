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
-- Name: zip_sales_tax_lookup; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE zip_sales_tax_lookup (
    zip_code character varying(60) NOT NULL,
    state_code character varying(60) NOT NULL,
    city character varying(60) NOT NULL,
    county character varying(60) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    county_fips character varying(60),
    county_default character(1),
    general_default character(1),
    inside_city character(1),
    geo_code character varying(60),
    state_sales_tax numeric(18,6),
    city_sales_tax numeric(18,6),
    city_local_sales_tax numeric(18,6),
    county_sales_tax numeric(18,6),
    county_local_sales_tax numeric(18,6),
    combo_sales_tax numeric(18,6),
    state_use_tax numeric(18,6),
    city_use_tax numeric(18,6),
    city_local_use_tax numeric(18,6),
    county_use_tax numeric(18,6),
    county_local_use_tax numeric(18,6),
    combo_use_tax numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.zip_sales_tax_lookup OWNER TO ofbiz;

--
-- Name: zip_sales_tax_lookup pk_zip_sales_tax_lookup; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY zip_sales_tax_lookup
    ADD CONSTRAINT pk_zip_sales_tax_lookup PRIMARY KEY (zip_code, state_code, city, county, from_date);


--
-- Name: zp_sls_tx_lkp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX zp_sls_tx_lkp_txcs ON zip_sales_tax_lookup USING btree (created_tx_stamp);


--
-- Name: zp_sls_tx_lkp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX zp_sls_tx_lkp_txsp ON zip_sales_tax_lookup USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

