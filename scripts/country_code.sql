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
-- Name: country_code; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE country_code (
    country_code character varying(20) NOT NULL,
    country_abbr character varying(60),
    country_number character varying(60),
    country_name character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.country_code OWNER TO ofbiz;

--
-- Name: country_code pk_country_code; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY country_code
    ADD CONSTRAINT pk_country_code PRIMARY KEY (country_code);


--
-- Name: cntr_cd_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntr_cd_txcrts ON country_code USING btree (created_tx_stamp);


--
-- Name: cntr_cd_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntr_cd_txstmp ON country_code USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

