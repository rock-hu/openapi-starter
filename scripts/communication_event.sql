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
-- Name: communication_event; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE communication_event (
    communication_event_id character varying(20) NOT NULL,
    communication_event_type_id character varying(20),
    orig_comm_event_id character varying(20),
    parent_comm_event_id character varying(20),
    status_id character varying(20),
    contact_mech_type_id character varying(20),
    contact_mech_id_from character varying(20),
    contact_mech_id_to character varying(20),
    role_type_id_from character varying(20),
    role_type_id_to character varying(20),
    party_id_from character varying(20),
    party_id_to character varying(20),
    entry_date timestamp with time zone,
    datetime_started timestamp with time zone,
    datetime_ended timestamp with time zone,
    subject character varying(255),
    content_mime_type_id character varying(255),
    content text,
    note character varying(255),
    reason_enum_id character varying(20),
    contact_list_id character varying(20),
    header_string text,
    from_string text,
    to_string text,
    cc_string text,
    bcc_string text,
    message_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.communication_event OWNER TO ofbiz;

--
-- Name: communication_event pk_communication_event; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT pk_communication_event PRIMARY KEY (communication_event_id);


--
-- Name: cmmnctn_evt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnctn_evt_txcrts ON communication_event USING btree (created_tx_stamp);


--
-- Name: cmmnctn_evt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnctn_evt_txstmp ON communication_event USING btree (last_updated_tx_stamp);


--
-- Name: com_evnt_clst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_clst ON communication_event USING btree (contact_list_id);


--
-- Name: com_evnt_cmtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_cmtp ON communication_event USING btree (contact_mech_type_id);


--
-- Name: com_evnt_fcm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_fcm ON communication_event USING btree (contact_mech_id_from);


--
-- Name: com_evnt_fpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_fpty ON communication_event USING btree (party_id_from);


--
-- Name: com_evnt_frtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_frtyp ON communication_event USING btree (role_type_id_from);


--
-- Name: com_evnt_mimetype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_mimetype ON communication_event USING btree (content_mime_type_id);


--
-- Name: com_evnt_resenum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_resenum ON communication_event USING btree (reason_enum_id);


--
-- Name: com_evnt_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_stts ON communication_event USING btree (status_id);


--
-- Name: com_evnt_tcm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_tcm ON communication_event USING btree (contact_mech_id_to);


--
-- Name: com_evnt_tpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_tpty ON communication_event USING btree (party_id_to);


--
-- Name: com_evnt_trtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_trtyp ON communication_event USING btree (role_type_id_to);


--
-- Name: com_evnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX com_evnt_type ON communication_event USING btree (communication_event_type_id);


--
-- Name: commevt_msg_id; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE UNIQUE INDEX commevt_msg_id ON communication_event USING btree (message_id);


--
-- Name: communication_event com_evnt_clst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_clst FOREIGN KEY (contact_list_id) REFERENCES contact_list(contact_list_id);


--
-- Name: communication_event com_evnt_cmtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_cmtp FOREIGN KEY (contact_mech_type_id) REFERENCES contact_mech_type(contact_mech_type_id);


--
-- Name: communication_event com_evnt_fcm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_fcm FOREIGN KEY (contact_mech_id_from) REFERENCES contact_mech(contact_mech_id);


--
-- Name: communication_event com_evnt_fpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_fpty FOREIGN KEY (party_id_from) REFERENCES party(party_id);


--
-- Name: communication_event com_evnt_frtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_frtyp FOREIGN KEY (role_type_id_from) REFERENCES role_type(role_type_id);


--
-- Name: communication_event com_evnt_mimetype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_mimetype FOREIGN KEY (content_mime_type_id) REFERENCES mime_type(mime_type_id);


--
-- Name: communication_event com_evnt_resenum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_resenum FOREIGN KEY (reason_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: communication_event com_evnt_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: communication_event com_evnt_tcm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_tcm FOREIGN KEY (contact_mech_id_to) REFERENCES contact_mech(contact_mech_id);


--
-- Name: communication_event com_evnt_tpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_tpty FOREIGN KEY (party_id_to) REFERENCES party(party_id);


--
-- Name: communication_event com_evnt_trtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_trtyp FOREIGN KEY (role_type_id_to) REFERENCES role_type(role_type_id);


--
-- Name: communication_event com_evnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event
    ADD CONSTRAINT com_evnt_type FOREIGN KEY (communication_event_type_id) REFERENCES communication_event_type(communication_event_type_id);


--
-- PostgreSQL database dump complete
--

