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
-- Name: facility_calendar_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_calendar_type (
    facility_calendar_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_calendar_type OWNER TO ofbiz;

--
-- Name: facility_calendar_type pk_facility_calendar_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_calendar_type
    ADD CONSTRAINT pk_facility_calendar_type PRIMARY KEY (facility_calendar_type_id);


--
-- Name: fct_clnr_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_clnr_tp_txcrts ON facility_calendar_type USING btree (created_tx_stamp);


--
-- Name: fct_clnr_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_clnr_tp_txstmp ON facility_calendar_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

