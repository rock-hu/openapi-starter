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
-- Name: comm_event_content_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE comm_event_content_assoc (
    content_id character varying(20) NOT NULL,
    communication_event_id character varying(20) NOT NULL,
    comm_content_assoc_type_id character varying(20),
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.comm_event_content_assoc OWNER TO ofbiz;

--
-- Name: comm_event_content_assoc pk_comm_event_content_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY comm_event_content_assoc
    ADD CONSTRAINT pk_comm_event_content_assoc PRIMARY KEY (content_id, communication_event_id, from_date);


--
-- Name: cmm_evt_cnt_asc_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmm_evt_cnt_asc_tp ON comm_event_content_assoc USING btree (last_updated_tx_stamp);


--
-- Name: cmm_evt_cnt_asc_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmm_evt_cnt_asc_ts ON comm_event_content_assoc USING btree (created_tx_stamp);


--
-- Name: commev_ca_commev; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX commev_ca_commev ON comm_event_content_assoc USING btree (communication_event_id);


--
-- Name: commev_ca_from; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX commev_ca_from ON comm_event_content_assoc USING btree (content_id);


--
-- Name: commev_ca_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX commev_ca_typ ON comm_event_content_assoc USING btree (comm_content_assoc_type_id);


--
-- Name: comm_event_content_assoc commev_ca_commev; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY comm_event_content_assoc
    ADD CONSTRAINT commev_ca_commev FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: comm_event_content_assoc commev_ca_from; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY comm_event_content_assoc
    ADD CONSTRAINT commev_ca_from FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: comm_event_content_assoc commev_ca_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY comm_event_content_assoc
    ADD CONSTRAINT commev_ca_typ FOREIGN KEY (comm_content_assoc_type_id) REFERENCES comm_content_assoc_type(comm_content_assoc_type_id);


--
-- PostgreSQL database dump complete
--

