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
-- Name: time_entry; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE time_entry (
    time_entry_id character varying(20) NOT NULL,
    party_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    rate_type_id character varying(20),
    work_effort_id character varying(20),
    timesheet_id character varying(20),
    invoice_id character varying(20),
    invoice_item_seq_id character varying(20),
    hours double precision,
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.time_entry OWNER TO ofbiz;

--
-- Name: time_entry pk_time_entry; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY time_entry
    ADD CONSTRAINT pk_time_entry PRIMARY KEY (time_entry_id);


--
-- Name: time_ent_invit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX time_ent_invit ON time_entry USING btree (invoice_id, invoice_item_seq_id);


--
-- Name: time_ent_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX time_ent_prty ON time_entry USING btree (party_id);


--
-- Name: time_ent_rttp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX time_ent_rttp ON time_entry USING btree (rate_type_id);


--
-- Name: time_ent_tsht; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX time_ent_tsht ON time_entry USING btree (timesheet_id);


--
-- Name: time_ent_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX time_ent_weff ON time_entry USING btree (work_effort_id);


--
-- Name: time_entry_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX time_entry_txcrts ON time_entry USING btree (created_tx_stamp);


--
-- Name: time_entry_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX time_entry_txstmp ON time_entry USING btree (last_updated_tx_stamp);


--
-- Name: time_entry time_ent_invit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY time_entry
    ADD CONSTRAINT time_ent_invit FOREIGN KEY (invoice_id, invoice_item_seq_id) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- Name: time_entry time_ent_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY time_entry
    ADD CONSTRAINT time_ent_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: time_entry time_ent_rttp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY time_entry
    ADD CONSTRAINT time_ent_rttp FOREIGN KEY (rate_type_id) REFERENCES rate_type(rate_type_id);


--
-- Name: time_entry time_ent_tsht; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY time_entry
    ADD CONSTRAINT time_ent_tsht FOREIGN KEY (timesheet_id) REFERENCES timesheet(timesheet_id);


--
-- Name: time_entry time_ent_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY time_entry
    ADD CONSTRAINT time_ent_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

