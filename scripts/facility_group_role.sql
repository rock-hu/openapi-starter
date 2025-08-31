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
-- Name: facility_group_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_group_role (
    facility_group_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_group_role OWNER TO ofbiz;

--
-- Name: facility_group_role pk_facility_group_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group_role
    ADD CONSTRAINT pk_facility_group_role PRIMARY KEY (facility_group_id, party_id, role_type_id);


--
-- Name: fclt_grp_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_grp_rl_txcrts ON facility_group_role USING btree (created_tx_stamp);


--
-- Name: fclt_grp_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_grp_rl_txstmp ON facility_group_role USING btree (last_updated_tx_stamp);


--
-- Name: fgroup_rle_fgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fgroup_rle_fgrp ON facility_group_role USING btree (facility_group_id);


--
-- Name: fgroup_rle_ptrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fgroup_rle_ptrle ON facility_group_role USING btree (party_id, role_type_id);


--
-- Name: facility_group_role fgroup_rle_fgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group_role
    ADD CONSTRAINT fgroup_rle_fgrp FOREIGN KEY (facility_group_id) REFERENCES facility_group(facility_group_id);


--
-- Name: facility_group_role fgroup_rle_ptrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group_role
    ADD CONSTRAINT fgroup_rle_ptrle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

