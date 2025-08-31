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
-- Name: communication_event_work_eff; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE communication_event_work_eff (
    work_effort_id character varying(20) NOT NULL,
    communication_event_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.communication_event_work_eff OWNER TO ofbiz;

--
-- Name: communication_event_work_eff pk_communication_event_work_ef; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_work_eff
    ADD CONSTRAINT pk_communication_event_work_ef PRIMARY KEY (work_effort_id, communication_event_id);


--
-- Name: cmn_evt_wrk_eff_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmn_evt_wrk_eff_tp ON communication_event_work_eff USING btree (last_updated_tx_stamp);


--
-- Name: cmn_evt_wrk_eff_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmn_evt_wrk_eff_ts ON communication_event_work_eff USING btree (created_tx_stamp);


--
-- Name: comev_weff_cmev; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX comev_weff_cmev ON communication_event_work_eff USING btree (communication_event_id);


--
-- Name: comev_weff_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX comev_weff_weff ON communication_event_work_eff USING btree (work_effort_id);


--
-- Name: communication_event_work_eff comev_weff_cmev; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_work_eff
    ADD CONSTRAINT comev_weff_cmev FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: communication_event_work_eff comev_weff_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_work_eff
    ADD CONSTRAINT comev_weff_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

