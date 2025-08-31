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
-- Name: work_effort_contact_mech_new; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_contact_mech_new (
    work_effort_id character varying(20) NOT NULL,
    contact_mech_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_contact_mech_new OWNER TO ofbiz;

--
-- Name: work_effort_contact_mech_new pk_work_effort_contact_mech_ne; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_contact_mech_new
    ADD CONSTRAINT pk_work_effort_contact_mech_ne PRIMARY KEY (work_effort_id, contact_mech_id, from_date);


--
-- Name: wkeff_cmech_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_cmech_cmech ON work_effort_contact_mech_new USING btree (contact_mech_id);


--
-- Name: wkeff_cmech_wkeff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_cmech_wkeff ON work_effort_contact_mech_new USING btree (work_effort_id);


--
-- Name: wrk_cnt_mch_nw_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_cnt_mch_nw_tp ON work_effort_contact_mech_new USING btree (last_updated_tx_stamp);


--
-- Name: wrk_cnt_mch_nw_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_cnt_mch_nw_ts ON work_effort_contact_mech_new USING btree (created_tx_stamp);


--
-- Name: work_effort_contact_mech_new wkeff_cmech_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_contact_mech_new
    ADD CONSTRAINT wkeff_cmech_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: work_effort_contact_mech_new wkeff_cmech_wkeff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_contact_mech_new
    ADD CONSTRAINT wkeff_cmech_wkeff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

