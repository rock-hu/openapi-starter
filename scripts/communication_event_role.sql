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
-- Name: communication_event_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE communication_event_role (
    communication_event_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    contact_mech_id character varying(20),
    status_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.communication_event_role OWNER TO ofbiz;

--
-- Name: communication_event_role pk_communication_event_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_role
    ADD CONSTRAINT pk_communication_event_role PRIMARY KEY (communication_event_id, party_id, role_type_id);


--
-- Name: cmmnn_evt_rl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_rl_txcrs ON communication_event_role USING btree (created_tx_stamp);


--
-- Name: cmmnn_evt_rl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_rl_txstp ON communication_event_role USING btree (last_updated_tx_stamp);


--
-- Name: com_evrl_cmch; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evrl_cmch ON communication_event_role USING btree (contact_mech_id);


--
-- Name: com_evrl_cmev; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evrl_cmev ON communication_event_role USING btree (communication_event_id);


--
-- Name: com_evrl_prle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evrl_prle ON communication_event_role USING btree (party_id, role_type_id);


--
-- Name: com_evrl_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evrl_pty ON communication_event_role USING btree (party_id);


--
-- Name: com_evrl_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evrl_stts ON communication_event_role USING btree (status_id);


--
-- Name: communication_event_role com_evrl_cmch; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_role
    ADD CONSTRAINT com_evrl_cmch FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: communication_event_role com_evrl_cmev; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_role
    ADD CONSTRAINT com_evrl_cmev FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: communication_event_role com_evrl_prle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_role
    ADD CONSTRAINT com_evrl_prle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: communication_event_role com_evrl_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_role
    ADD CONSTRAINT com_evrl_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: communication_event_role com_evrl_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_role
    ADD CONSTRAINT com_evrl_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

