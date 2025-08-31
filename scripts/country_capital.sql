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
-- Name: country_capital; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE country_capital (
    country_code character varying(20) NOT NULL,
    country_capital character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.country_capital OWNER TO ofbiz;

--
-- Name: country_capital pk_country_capital; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY country_capital
    ADD CONSTRAINT pk_country_capital PRIMARY KEY (country_code);


--
-- Name: cntr_cptl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntr_cptl_txcrts ON country_capital USING btree (created_tx_stamp);


--
-- Name: cntr_cptl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntr_cptl_txstmp ON country_capital USING btree (last_updated_tx_stamp);


--
-- Name: cntry_cap_to_code; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntry_cap_to_code ON country_capital USING btree (country_code);


--
-- Name: country_capital cntry_cap_to_code; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY country_capital
    ADD CONSTRAINT cntry_cap_to_code FOREIGN KEY (country_code) REFERENCES country_code(country_code);


--
-- PostgreSQL database dump complete
--

