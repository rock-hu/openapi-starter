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
-- Name: geo; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE geo (
    geo_id character varying(20) NOT NULL,
    geo_type_id character varying(20),
    geo_name character varying(100),
    geo_code character varying(60),
    geo_sec_code character varying(60),
    abbreviation character varying(60),
    well_known_text text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.geo OWNER TO ofbiz;

--
-- Name: geo pk_geo; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo
    ADD CONSTRAINT pk_geo PRIMARY KEY (geo_id);


--
-- Name: geo_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_to_type ON geo USING btree (geo_type_id);


--
-- Name: geo_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_txcrts ON geo USING btree (created_tx_stamp);


--
-- Name: geo_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_txstmp ON geo USING btree (last_updated_tx_stamp);


--
-- Name: geo geo_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo
    ADD CONSTRAINT geo_to_type FOREIGN KEY (geo_type_id) REFERENCES geo_type(geo_type_id);


--
-- PostgreSQL database dump complete
--

