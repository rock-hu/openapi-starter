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
-- Name: communication_event_purpose; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE communication_event_purpose (
    communication_event_prp_typ_id character varying(20) NOT NULL,
    communication_event_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.communication_event_purpose OWNER TO ofbiz;

--
-- Name: communication_event_purpose pk_communication_event_purpose; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_purpose
    ADD CONSTRAINT pk_communication_event_purpose PRIMARY KEY (communication_event_prp_typ_id, communication_event_id);


--
-- Name: cmmnn_evt_prs_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_prs_txcs ON communication_event_purpose USING btree (created_tx_stamp);


--
-- Name: cmmnn_evt_prs_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_prs_txsp ON communication_event_purpose USING btree (last_updated_tx_stamp);


--
-- Name: com_evnt_prp_evnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_prp_evnt ON communication_event_purpose USING btree (communication_event_id);


--
-- Name: com_evnt_prp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_prp_type ON communication_event_purpose USING btree (communication_event_prp_typ_id);


--
-- Name: communication_event_purpose com_evnt_prp_evnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_purpose
    ADD CONSTRAINT com_evnt_prp_evnt FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: communication_event_purpose com_evnt_prp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_purpose
    ADD CONSTRAINT com_evnt_prp_type FOREIGN KEY (communication_event_prp_typ_id) REFERENCES communication_event_prp_typ(communication_event_prp_typ_id);


--
-- PostgreSQL database dump complete
--

