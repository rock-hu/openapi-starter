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
-- Name: address_match_map; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE address_match_map (
    map_key character varying(255) NOT NULL,
    map_value character varying(255) NOT NULL,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.address_match_map OWNER TO ofbiz;

--
-- Name: address_match_map pk_address_match_map; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY address_match_map
    ADD CONSTRAINT pk_address_match_map PRIMARY KEY (map_key, map_value);


--
-- Name: addrs_mth_mp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX addrs_mth_mp_txcrs ON address_match_map USING btree (created_tx_stamp);


--
-- Name: addrs_mth_mp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX addrs_mth_mp_txstp ON address_match_map USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

