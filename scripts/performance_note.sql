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
-- Name: performance_note; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE performance_note (
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    communication_date timestamp with time zone,
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.performance_note OWNER TO ofbiz;

--
-- Name: performance_note pk_performance_note; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY performance_note
    ADD CONSTRAINT pk_performance_note PRIMARY KEY (party_id, role_type_id, from_date);


--
-- Name: perf_note_prle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_note_prle ON performance_note USING btree (party_id, role_type_id);


--
-- Name: perf_note_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_note_prty ON performance_note USING btree (party_id);


--
-- Name: prfrmnc_nt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prfrmnc_nt_txcrts ON performance_note USING btree (created_tx_stamp);


--
-- Name: prfrmnc_nt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prfrmnc_nt_txstmp ON performance_note USING btree (last_updated_tx_stamp);


--
-- Name: performance_note perf_note_prle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY performance_note
    ADD CONSTRAINT perf_note_prle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: performance_note perf_note_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY performance_note
    ADD CONSTRAINT perf_note_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

