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
-- Name: work_effort_ical_data; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_ical_data (
    work_effort_id character varying(20) NOT NULL,
    ical_data text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_ical_data OWNER TO ofbiz;

--
-- Name: work_effort_ical_data pk_work_effort_ical_data; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_ical_data
    ADD CONSTRAINT pk_work_effort_ical_data PRIMARY KEY (work_effort_id);


--
-- Name: wkeff_ical_data; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_ical_data ON work_effort_ical_data USING btree (work_effort_id);


--
-- Name: wrk_eft_icl_dt_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_icl_dt_txp ON work_effort_ical_data USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_icl_dt_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_icl_dt_txs ON work_effort_ical_data USING btree (created_tx_stamp);


--
-- Name: work_effort_ical_data wkeff_ical_data; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_ical_data
    ADD CONSTRAINT wkeff_ical_data FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

