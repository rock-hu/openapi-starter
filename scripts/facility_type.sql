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
-- Name: facility_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_type (
    facility_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_type OWNER TO ofbiz;

--
-- Name: facility_type pk_facility_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_type
    ADD CONSTRAINT pk_facility_type PRIMARY KEY (facility_type_id);


--
-- Name: facility_typepar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_typepar ON facility_type USING btree (parent_type_id);


--
-- Name: fclt_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_tp_txcrts ON facility_type USING btree (created_tx_stamp);


--
-- Name: fclt_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_tp_txstmp ON facility_type USING btree (last_updated_tx_stamp);


--
-- Name: facility_type facility_typepar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_type
    ADD CONSTRAINT facility_typepar FOREIGN KEY (parent_type_id) REFERENCES facility_type(facility_type_id);


--
-- PostgreSQL database dump complete
--

