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
-- Name: facility_group_member; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_group_member (
    facility_id character varying(20) NOT NULL,
    facility_group_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_group_member OWNER TO ofbiz;

--
-- Name: facility_group_member pk_facility_group_member; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group_member
    ADD CONSTRAINT pk_facility_group_member PRIMARY KEY (facility_id, facility_group_id, from_date);


--
-- Name: facility_mem_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_mem_fac ON facility_group_member USING btree (facility_id);


--
-- Name: facility_mem_fgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_mem_fgrp ON facility_group_member USING btree (facility_group_id);


--
-- Name: fct_grp_mmr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_grp_mmr_txcrts ON facility_group_member USING btree (created_tx_stamp);


--
-- Name: fct_grp_mmr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_grp_mmr_txstmp ON facility_group_member USING btree (last_updated_tx_stamp);


--
-- Name: facility_group_member facility_mem_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group_member
    ADD CONSTRAINT facility_mem_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: facility_group_member facility_mem_fgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group_member
    ADD CONSTRAINT facility_mem_fgrp FOREIGN KEY (facility_group_id) REFERENCES facility_group(facility_group_id);


--
-- PostgreSQL database dump complete
--

