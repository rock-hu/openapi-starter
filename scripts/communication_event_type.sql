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
-- Name: communication_event_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE communication_event_type (
    communication_event_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    contact_mech_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.communication_event_type OWNER TO ofbiz;

--
-- Name: communication_event_type pk_communication_event_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_type
    ADD CONSTRAINT pk_communication_event_type PRIMARY KEY (communication_event_type_id);


--
-- Name: cmmnn_evt_tp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_tp_txcrs ON communication_event_type USING btree (created_tx_stamp);


--
-- Name: cmmnn_evt_tp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_tp_txstp ON communication_event_type USING btree (last_updated_tx_stamp);


--
-- Name: com_evnt_type_cmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_type_cmt ON communication_event_type USING btree (contact_mech_type_id);


--
-- Name: com_evnt_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_type_par ON communication_event_type USING btree (parent_type_id);


--
-- Name: communication_event_type com_evnt_type_cmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_type
    ADD CONSTRAINT com_evnt_type_cmt FOREIGN KEY (contact_mech_type_id) REFERENCES contact_mech_type(contact_mech_type_id);


--
-- Name: communication_event_type com_evnt_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_type
    ADD CONSTRAINT com_evnt_type_par FOREIGN KEY (parent_type_id) REFERENCES communication_event_type(communication_event_type_id);


--
-- PostgreSQL database dump complete
--

