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
-- Name: facility_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_group (
    facility_group_id character varying(20) NOT NULL,
    facility_group_type_id character varying(20),
    primary_parent_group_id character varying(20),
    facility_group_name character varying(100),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_group OWNER TO ofbiz;

--
-- Name: facility_group pk_facility_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group
    ADD CONSTRAINT pk_facility_group PRIMARY KEY (facility_group_id);


--
-- Name: facility_gp_pgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_gp_pgrp ON facility_group USING btree (primary_parent_group_id);


--
-- Name: facility_gp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_gp_type ON facility_group USING btree (facility_group_type_id);


--
-- Name: fclt_grp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_grp_txcrts ON facility_group USING btree (created_tx_stamp);


--
-- Name: fclt_grp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_grp_txstmp ON facility_group USING btree (last_updated_tx_stamp);


--
-- Name: facility_group facility_gp_pgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group
    ADD CONSTRAINT facility_gp_pgrp FOREIGN KEY (primary_parent_group_id) REFERENCES facility_group(facility_group_id);


--
-- Name: facility_group facility_gp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group
    ADD CONSTRAINT facility_gp_type FOREIGN KEY (facility_group_type_id) REFERENCES facility_group_type(facility_group_type_id);


--
-- PostgreSQL database dump complete
--

