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
-- Name: country_address_format; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE country_address_format (
    geo_id character varying(20) NOT NULL,
    geo_assoc_type_id character varying(20),
    require_state_province_id character varying(20),
    require_postal_code character(1),
    postal_code_regex character varying(255),
    has_postal_code_ext character(1),
    require_postal_code_ext character(1),
    address_format character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.country_address_format OWNER TO ofbiz;

--
-- Name: country_address_format pk_country_address_format; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY country_address_format
    ADD CONSTRAINT pk_country_address_format PRIMARY KEY (geo_id);


--
-- Name: cnr_adds_frt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnr_adds_frt_txcrs ON country_address_format USING btree (created_tx_stamp);


--
-- Name: cnr_adds_frt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnr_adds_frt_txstp ON country_address_format USING btree (last_updated_tx_stamp);


--
-- Name: cny_adr_geo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cny_adr_geo ON country_address_format USING btree (geo_id);


--
-- Name: cny_adr_geo_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cny_adr_geo_type ON country_address_format USING btree (geo_assoc_type_id);


--
-- Name: country_address_format cny_adr_geo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY country_address_format
    ADD CONSTRAINT cny_adr_geo FOREIGN KEY (geo_id) REFERENCES geo(geo_id);


--
-- Name: country_address_format cny_adr_geo_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY country_address_format
    ADD CONSTRAINT cny_adr_geo_type FOREIGN KEY (geo_assoc_type_id) REFERENCES geo_assoc_type(geo_assoc_type_id);


--
-- PostgreSQL database dump complete
--

