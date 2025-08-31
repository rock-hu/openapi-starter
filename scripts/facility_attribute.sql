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
-- Name: facility_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_attribute (
    facility_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_attribute OWNER TO ofbiz;

--
-- Name: facility_attribute pk_facility_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_attribute
    ADD CONSTRAINT pk_facility_attribute PRIMARY KEY (facility_id, attr_name);


--
-- Name: facility_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_attr ON facility_attribute USING btree (facility_id);


--
-- Name: fclt_attrbt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_attrbt_txcrts ON facility_attribute USING btree (created_tx_stamp);


--
-- Name: fclt_attrbt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_attrbt_txstmp ON facility_attribute USING btree (last_updated_tx_stamp);


--
-- Name: facility_attribute facility_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_attribute
    ADD CONSTRAINT facility_attr FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- PostgreSQL database dump complete
--

