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
-- Name: work_effort_event_reminder; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_event_reminder (
    work_effort_id character varying(20) NOT NULL,
    sequence_id character varying(20) NOT NULL,
    contact_mech_id character varying(20),
    party_id character varying(20),
    reminder_date_time timestamp with time zone,
    repeat_count numeric(20,0),
    repeat_interval numeric(20,0),
    current_count numeric(20,0),
    reminder_offset numeric(20,0),
    locale_id character varying(20),
    time_zone_id character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_event_reminder OWNER TO ofbiz;

--
-- Name: work_effort_event_reminder pk_work_effort_event_reminder; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_event_reminder
    ADD CONSTRAINT pk_work_effort_event_reminder PRIMARY KEY (work_effort_id, sequence_id);


--
-- Name: we_event_remind_cm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX we_event_remind_cm ON work_effort_event_reminder USING btree (contact_mech_id);


--
-- Name: we_event_remind_py; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX we_event_remind_py ON work_effort_event_reminder USING btree (party_id);


--
-- Name: we_event_remind_we; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX we_event_remind_we ON work_effort_event_reminder USING btree (work_effort_id);


--
-- Name: wrk_eft_evt_rmr_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_evt_rmr_tp ON work_effort_event_reminder USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_evt_rmr_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_evt_rmr_ts ON work_effort_event_reminder USING btree (created_tx_stamp);


--
-- Name: work_effort_event_reminder we_event_remind_cm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_event_reminder
    ADD CONSTRAINT we_event_remind_cm FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: work_effort_event_reminder we_event_remind_py; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_event_reminder
    ADD CONSTRAINT we_event_remind_py FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: work_effort_event_reminder we_event_remind_we; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_event_reminder
    ADD CONSTRAINT we_event_remind_we FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

