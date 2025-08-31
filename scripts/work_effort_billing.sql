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
-- Name: work_effort_billing; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_billing (
    work_effort_id character varying(20) NOT NULL,
    invoice_id character varying(20) NOT NULL,
    invoice_item_seq_id character varying(20) NOT NULL,
    percentage double precision,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_billing OWNER TO ofbiz;

--
-- Name: work_effort_billing pk_work_effort_billing; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_billing
    ADD CONSTRAINT pk_work_effort_billing PRIMARY KEY (work_effort_id, invoice_id, invoice_item_seq_id);


--
-- Name: wk_effblng_invitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effblng_invitm ON work_effort_billing USING btree (invoice_id, invoice_item_seq_id);


--
-- Name: wk_effblng_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effblng_weff ON work_effort_billing USING btree (work_effort_id);


--
-- Name: wrk_efft_blg_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_blg_txcrs ON work_effort_billing USING btree (created_tx_stamp);


--
-- Name: wrk_efft_blg_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_blg_txstp ON work_effort_billing USING btree (last_updated_tx_stamp);


--
-- Name: work_effort_billing wk_effblng_invitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_billing
    ADD CONSTRAINT wk_effblng_invitm FOREIGN KEY (invoice_id, invoice_item_seq_id) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- Name: work_effort_billing wk_effblng_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_billing
    ADD CONSTRAINT wk_effblng_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

