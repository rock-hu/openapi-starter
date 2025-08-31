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
-- Name: gl_reconciliation_entry; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_reconciliation_entry (
    gl_reconciliation_id character varying(20) NOT NULL,
    acctg_trans_id character varying(20) NOT NULL,
    acctg_trans_entry_seq_id character varying(20) NOT NULL,
    reconciled_amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_reconciliation_entry OWNER TO ofbiz;

--
-- Name: gl_reconciliation_entry pk_gl_reconciliation_entry; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_reconciliation_entry
    ADD CONSTRAINT pk_gl_reconciliation_entry PRIMARY KEY (gl_reconciliation_id, acctg_trans_id, acctg_trans_entry_seq_id);


--
-- Name: gl_rcncn_enr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_rcncn_enr_txcrs ON gl_reconciliation_entry USING btree (created_tx_stamp);


--
-- Name: gl_rcncn_enr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_rcncn_enr_txstp ON gl_reconciliation_entry USING btree (last_updated_tx_stamp);


--
-- Name: gl_recent_acttxe; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_recent_acttxe ON gl_reconciliation_entry USING btree (acctg_trans_id, acctg_trans_entry_seq_id);


--
-- Name: gl_recent_glrec; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_recent_glrec ON gl_reconciliation_entry USING btree (gl_reconciliation_id);


--
-- Name: gl_reconciliation_entry gl_recent_acttxe; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_reconciliation_entry
    ADD CONSTRAINT gl_recent_acttxe FOREIGN KEY (acctg_trans_id, acctg_trans_entry_seq_id) REFERENCES acctg_trans_entry(acctg_trans_id, acctg_trans_entry_seq_id);


--
-- Name: gl_reconciliation_entry gl_recent_glrec; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_reconciliation_entry
    ADD CONSTRAINT gl_recent_glrec FOREIGN KEY (gl_reconciliation_id) REFERENCES gl_reconciliation(gl_reconciliation_id);


--
-- PostgreSQL database dump complete
--

