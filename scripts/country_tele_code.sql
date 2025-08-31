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
-- Name: country_tele_code; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE country_tele_code (
    country_code character varying(20) NOT NULL,
    tele_code character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.country_tele_code OWNER TO ofbiz;

--
-- Name: country_tele_code pk_country_tele_code; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY country_tele_code
    ADD CONSTRAINT pk_country_tele_code PRIMARY KEY (country_code);


--
-- Name: cntr_tl_cd_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntr_tl_cd_txcrts ON country_tele_code USING btree (created_tx_stamp);


--
-- Name: cntr_tl_cd_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntr_tl_cd_txstmp ON country_tele_code USING btree (last_updated_tx_stamp);


--
-- Name: cntry_tele_to_code; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntry_tele_to_code ON country_tele_code USING btree (country_code);


--
-- Name: country_tele_code cntry_tele_to_code; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY country_tele_code
    ADD CONSTRAINT cntry_tele_to_code FOREIGN KEY (country_code) REFERENCES country_code(country_code);


--
-- PostgreSQL database dump complete
--

