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
-- Name: physical_inventory; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE physical_inventory (
    physical_inventory_id character varying(20) NOT NULL,
    physical_inventory_date timestamp with time zone,
    party_id character varying(20),
    general_comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.physical_inventory OWNER TO ofbiz;

--
-- Name: physical_inventory pk_physical_inventory; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY physical_inventory
    ADD CONSTRAINT pk_physical_inventory PRIMARY KEY (physical_inventory_id);


--
-- Name: phscl_invnr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX phscl_invnr_txcrts ON physical_inventory USING btree (created_tx_stamp);


--
-- Name: phscl_invnr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX phscl_invnr_txstmp ON physical_inventory USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

