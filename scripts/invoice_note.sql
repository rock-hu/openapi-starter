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
-- Name: invoice_note; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_note (
    invoice_id character varying(20) NOT NULL,
    note_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_note OWNER TO ofbiz;

--
-- Name: invoice_note pk_invoice_note; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_note
    ADD CONSTRAINT pk_invoice_note PRIMARY KEY (invoice_id, note_id);


--
-- Name: invc_nt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_nt_txcrts ON invoice_note USING btree (created_tx_stamp);


--
-- Name: invc_nt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_nt_txstmp ON invoice_note USING btree (last_updated_tx_stamp);


--
-- Name: invoice_note_inv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_note_inv ON invoice_note USING btree (invoice_id);


--
-- Name: invoice_note_note; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invoice_note_note ON invoice_note USING btree (note_id);


--
-- Name: invoice_note invoice_note_inv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_note
    ADD CONSTRAINT invoice_note_inv FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);


--
-- Name: invoice_note invoice_note_note; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_note
    ADD CONSTRAINT invoice_note_note FOREIGN KEY (note_id) REFERENCES note_data(note_id);


--
-- PostgreSQL database dump complete
--

