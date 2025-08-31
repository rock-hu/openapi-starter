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
-- Name: work_effort_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_assoc (
    work_effort_id_from character varying(20) NOT NULL,
    work_effort_id_to character varying(20) NOT NULL,
    work_effort_assoc_type_id character varying(20) NOT NULL,
    sequence_num numeric(20,0),
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_assoc OWNER TO ofbiz;

--
-- Name: work_effort_assoc pk_work_effort_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_assoc
    ADD CONSTRAINT pk_work_effort_assoc PRIMARY KEY (work_effort_id_from, work_effort_id_to, work_effort_assoc_type_id, from_date);


--
-- Name: wk_effrtassc_fwe; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrtassc_fwe ON work_effort_assoc USING btree (work_effort_id_from);


--
-- Name: wk_effrtassc_twe; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrtassc_twe ON work_effort_assoc USING btree (work_effort_id_to);


--
-- Name: wk_effrtassc_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrtassc_typ ON work_effort_assoc USING btree (work_effort_assoc_type_id);


--
-- Name: wrk_efft_asc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_asc_txcrs ON work_effort_assoc USING btree (created_tx_stamp);


--
-- Name: wrk_efft_asc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_asc_txstp ON work_effort_assoc USING btree (last_updated_tx_stamp);


--
-- Name: work_effort_assoc wk_effrtassc_fwe; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_assoc
    ADD CONSTRAINT wk_effrtassc_fwe FOREIGN KEY (work_effort_id_from) REFERENCES work_effort(work_effort_id);


--
-- Name: work_effort_assoc wk_effrtassc_twe; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_assoc
    ADD CONSTRAINT wk_effrtassc_twe FOREIGN KEY (work_effort_id_to) REFERENCES work_effort(work_effort_id);


--
-- Name: work_effort_assoc wk_effrtassc_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_assoc
    ADD CONSTRAINT wk_effrtassc_typ FOREIGN KEY (work_effort_assoc_type_id) REFERENCES work_effort_assoc_type(work_effort_assoc_type_id);


--
-- PostgreSQL database dump complete
--

