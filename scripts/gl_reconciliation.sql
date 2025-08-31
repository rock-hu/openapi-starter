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
-- Name: gl_reconciliation; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_reconciliation (
    gl_reconciliation_id character varying(20) NOT NULL,
    gl_reconciliation_name character varying(100),
    description character varying(255),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    gl_account_id character varying(20),
    status_id character varying(20),
    organization_party_id character varying(20),
    reconciled_balance numeric(18,2),
    opening_balance numeric(18,2),
    reconciled_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_reconciliation OWNER TO ofbiz;

--
-- Name: gl_reconciliation pk_gl_reconciliation; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_reconciliation
    ADD CONSTRAINT pk_gl_reconciliation PRIMARY KEY (gl_reconciliation_id);


--
-- Name: gl_rcncltn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_rcncltn_txcrts ON gl_reconciliation USING btree (created_tx_stamp);


--
-- Name: gl_rcncltn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_rcncltn_txstmp ON gl_reconciliation USING btree (last_updated_tx_stamp);


--
-- Name: glrec_glacct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glrec_glacct ON gl_reconciliation USING btree (gl_account_id);


--
-- Name: glrec_glparty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glrec_glparty ON gl_reconciliation USING btree (organization_party_id);


--
-- Name: glrec_sti; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glrec_sti ON gl_reconciliation USING btree (status_id);


--
-- Name: gl_reconciliation glrec_glacct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_reconciliation
    ADD CONSTRAINT glrec_glacct FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: gl_reconciliation glrec_glparty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_reconciliation
    ADD CONSTRAINT glrec_glparty FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: gl_reconciliation glrec_sti; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_reconciliation
    ADD CONSTRAINT glrec_sti FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

