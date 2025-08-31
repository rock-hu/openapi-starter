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
-- Name: communication_event_prp_typ; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE communication_event_prp_typ (
    communication_event_prp_typ_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.communication_event_prp_typ OWNER TO ofbiz;

--
-- Name: communication_event_prp_typ pk_communication_event_prp_typ; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_prp_typ
    ADD CONSTRAINT pk_communication_event_prp_typ PRIMARY KEY (communication_event_prp_typ_id);


--
-- Name: cmn_evt_prp_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmn_evt_prp_tp_txp ON communication_event_prp_typ USING btree (last_updated_tx_stamp);


--
-- Name: cmn_evt_prp_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmn_evt_prp_tp_txs ON communication_event_prp_typ USING btree (created_tx_stamp);


--
-- Name: com_evnt_prp_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_prp_typ ON communication_event_prp_typ USING btree (parent_type_id);


--
-- Name: communication_event_prp_typ com_evnt_prp_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_prp_typ
    ADD CONSTRAINT com_evnt_prp_typ FOREIGN KEY (parent_type_id) REFERENCES communication_event_prp_typ(communication_event_prp_typ_id);


--
-- PostgreSQL database dump complete
--

