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
-- Name: work_effort_trans_box; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_trans_box (
    process_work_effort_id character varying(20) NOT NULL,
    to_activity_id character varying(60) NOT NULL,
    transition_id character varying(60) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_trans_box OWNER TO ofbiz;

--
-- Name: work_effort_trans_box pk_work_effort_trans_box; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_trans_box
    ADD CONSTRAINT pk_work_effort_trans_box PRIMARY KEY (process_work_effort_id, to_activity_id, transition_id);


--
-- Name: wkeff_txbx_we; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_txbx_we ON work_effort_trans_box USING btree (process_work_effort_id);


--
-- Name: wrk_eft_trs_bx_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_trs_bx_txp ON work_effort_trans_box USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_trs_bx_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_trs_bx_txs ON work_effort_trans_box USING btree (created_tx_stamp);


--
-- Name: work_effort_trans_box wkeff_txbx_we; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_trans_box
    ADD CONSTRAINT wkeff_txbx_we FOREIGN KEY (process_work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

