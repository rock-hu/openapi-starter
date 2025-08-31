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
-- Name: note_data; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE note_data (
    note_id character varying(20) NOT NULL,
    note_name character varying(100),
    note_info text,
    note_date_time timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone,
    note_party character varying(20),
    more_info_url character varying(255),
    more_info_item_id character varying(255),
    more_info_item_name character varying(255)
);


-- ALTER TABLE public.note_data OWNER TO ofbiz;

--
-- Name: note_data pk_note_data; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY note_data
    ADD CONSTRAINT pk_note_data PRIMARY KEY (note_id);


--
-- Name: note_data_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX note_data_pty ON note_data USING btree (note_party);


--
-- Name: note_data_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX note_data_txcrts ON note_data USING btree (created_tx_stamp);


--
-- Name: note_data_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX note_data_txstmp ON note_data USING btree (last_updated_tx_stamp);


--
-- Name: systeminfo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX systeminfo ON note_data USING btree (note_name);


--
-- Name: note_data note_data_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY note_data
    ADD CONSTRAINT note_data_pty FOREIGN KEY (note_party) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

