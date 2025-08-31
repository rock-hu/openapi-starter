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
-- Name: party_note; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_note (
    party_id character varying(20) NOT NULL,
    note_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_note OWNER TO ofbiz;

--
-- Name: party_note pk_party_note; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_note
    ADD CONSTRAINT pk_party_note PRIMARY KEY (party_id, note_id);


--
-- Name: party_note_note; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_note_note ON party_note USING btree (note_id);


--
-- Name: party_note_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_note_party ON party_note USING btree (party_id);


--
-- Name: party_note_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_note_txcrts ON party_note USING btree (created_tx_stamp);


--
-- Name: party_note_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_note_txstmp ON party_note USING btree (last_updated_tx_stamp);


--
-- Name: party_note party_note_note; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_note
    ADD CONSTRAINT party_note_note FOREIGN KEY (note_id) REFERENCES note_data(note_id);


--
-- Name: party_note party_note_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_note
    ADD CONSTRAINT party_note_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

