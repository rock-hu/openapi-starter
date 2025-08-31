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
-- Name: quote_note; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote_note (
    quote_id character varying(20) NOT NULL,
    note_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote_note OWNER TO ofbiz;

--
-- Name: quote_note pk_quote_note; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_note
    ADD CONSTRAINT pk_quote_note PRIMARY KEY (quote_id, note_id);


--
-- Name: quote_note_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_note_txcrts ON quote_note USING btree (created_tx_stamp);


--
-- Name: quote_note_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_note_txstmp ON quote_note USING btree (last_updated_tx_stamp);


--
-- Name: quote_nt_note; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_nt_note ON quote_note USING btree (note_id);


--
-- Name: quote_nt_qte; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_nt_qte ON quote_note USING btree (quote_id);


--
-- Name: quote_note quote_nt_note; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_note
    ADD CONSTRAINT quote_nt_note FOREIGN KEY (note_id) REFERENCES note_data(note_id);


--
-- Name: quote_note quote_nt_qte; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_note
    ADD CONSTRAINT quote_nt_qte FOREIGN KEY (quote_id) REFERENCES quote(quote_id);


--
-- PostgreSQL database dump complete
--

