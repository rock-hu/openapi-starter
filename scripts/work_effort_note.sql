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
-- Name: work_effort_note; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_note (
    work_effort_id character varying(20) NOT NULL,
    note_id character varying(20) NOT NULL,
    internal_note character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_note OWNER TO ofbiz;

--
-- Name: work_effort_note pk_work_effort_note; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_note
    ADD CONSTRAINT pk_work_effort_note PRIMARY KEY (work_effort_id, note_id);


--
-- Name: wkeff_nte_note; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_nte_note ON work_effort_note USING btree (note_id);


--
-- Name: wkeff_nte_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_nte_weff ON work_effort_note USING btree (work_effort_id);


--
-- Name: wrk_efft_nt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_nt_txcrts ON work_effort_note USING btree (created_tx_stamp);


--
-- Name: wrk_efft_nt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_nt_txstmp ON work_effort_note USING btree (last_updated_tx_stamp);


--
-- Name: work_effort_note wkeff_nte_note; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_note
    ADD CONSTRAINT wkeff_nte_note FOREIGN KEY (note_id) REFERENCES note_data(note_id);


--
-- Name: work_effort_note wkeff_nte_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_note
    ADD CONSTRAINT wkeff_nte_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

