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
-- Name: facility_group_rollup; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_group_rollup (
    facility_group_id character varying(20) NOT NULL,
    parent_facility_group_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_group_rollup OWNER TO ofbiz;

--
-- Name: facility_group_rollup pk_facility_group_rollup; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group_rollup
    ADD CONSTRAINT pk_facility_group_rollup PRIMARY KEY (facility_group_id, parent_facility_group_id, from_date);


--
-- Name: fct_grp_rlp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_grp_rlp_txcrts ON facility_group_rollup USING btree (created_tx_stamp);


--
-- Name: fct_grp_rlp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_grp_rlp_txstmp ON facility_group_rollup USING btree (last_updated_tx_stamp);


--
-- Name: fgrp_frlp_current; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fgrp_frlp_current ON facility_group_rollup USING btree (facility_group_id);


--
-- Name: fgrp_frlp_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fgrp_frlp_parent ON facility_group_rollup USING btree (parent_facility_group_id);


--
-- Name: facility_group_rollup fgrp_frlp_current; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group_rollup
    ADD CONSTRAINT fgrp_frlp_current FOREIGN KEY (facility_group_id) REFERENCES facility_group(facility_group_id);


--
-- Name: facility_group_rollup fgrp_frlp_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_group_rollup
    ADD CONSTRAINT fgrp_frlp_parent FOREIGN KEY (parent_facility_group_id) REFERENCES facility_group(facility_group_id);


--
-- PostgreSQL database dump complete
--

