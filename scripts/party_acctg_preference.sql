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
-- Name: party_acctg_preference; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_acctg_preference (
    party_id character varying(20) NOT NULL,
    fiscal_year_start_month numeric(20,0),
    fiscal_year_start_day numeric(20,0),
    tax_form_id character varying(20),
    cogs_method_id character varying(20),
    base_currency_uom_id character varying(20),
    invoice_seq_cust_meth_id character varying(20),
    invoice_id_prefix character varying(10),
    last_invoice_number numeric(20,0),
    last_invoice_restart_date timestamp with time zone,
    use_invoice_id_for_returns character(1),
    quote_seq_cust_meth_id character varying(20),
    quote_id_prefix character varying(10),
    last_quote_number numeric(20,0),
    order_seq_cust_meth_id character varying(20),
    order_id_prefix character varying(10),
    last_order_number numeric(20,0),
    refund_payment_method_id character varying(20),
    error_gl_journal_id character varying(20),
    enable_accounting character(1),
    invoice_sequence_enum_id character varying(20),
    order_sequence_enum_id character varying(20),
    quote_sequence_enum_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_acctg_preference OWNER TO ofbiz;

--
-- Name: party_acctg_preference pk_party_acctg_preference; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT pk_party_acctg_preference PRIMARY KEY (party_id);


--
-- Name: acctgpref_curncy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX acctgpref_curncy ON party_acctg_preference USING btree (base_currency_uom_id);


--
-- Name: actg_pref_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actg_pref_pty ON party_acctg_preference USING btree (party_id);


--
-- Name: actgpref_cogs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_cogs ON party_acctg_preference USING btree (cogs_method_id);


--
-- Name: actgpref_gljrnl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_gljrnl ON party_acctg_preference USING btree (error_gl_journal_id);


--
-- Name: actgpref_invcm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_invcm ON party_acctg_preference USING btree (invoice_seq_cust_meth_id);


--
-- Name: actgpref_invsq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_invsq ON party_acctg_preference USING btree (invoice_sequence_enum_id);


--
-- Name: actgpref_odrcm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_odrcm ON party_acctg_preference USING btree (order_seq_cust_meth_id);


--
-- Name: actgpref_odrsq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_odrsq ON party_acctg_preference USING btree (order_sequence_enum_id);


--
-- Name: actgpref_paymth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_paymth ON party_acctg_preference USING btree (refund_payment_method_id);


--
-- Name: actgpref_qtecm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_qtecm ON party_acctg_preference USING btree (quote_seq_cust_meth_id);


--
-- Name: actgpref_qtesq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_qtesq ON party_acctg_preference USING btree (quote_sequence_enum_id);


--
-- Name: actgpref_taxform; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX actgpref_taxform ON party_acctg_preference USING btree (tax_form_id);


--
-- Name: prt_acg_prfc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_acg_prfc_txcrs ON party_acctg_preference USING btree (created_tx_stamp);


--
-- Name: prt_acg_prfc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_acg_prfc_txstp ON party_acctg_preference USING btree (last_updated_tx_stamp);


--
-- Name: party_acctg_preference acctgpref_curncy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT acctgpref_curncy FOREIGN KEY (base_currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: party_acctg_preference actg_pref_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actg_pref_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_acctg_preference actgpref_cogs; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_cogs FOREIGN KEY (cogs_method_id) REFERENCES enumeration(enum_id);


--
-- Name: party_acctg_preference actgpref_gljrnl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_gljrnl FOREIGN KEY (error_gl_journal_id) REFERENCES gl_journal(gl_journal_id);


--
-- Name: party_acctg_preference actgpref_invcm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_invcm FOREIGN KEY (invoice_seq_cust_meth_id) REFERENCES custom_method(custom_method_id);


--
-- Name: party_acctg_preference actgpref_invsq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_invsq FOREIGN KEY (invoice_sequence_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: party_acctg_preference actgpref_odrcm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_odrcm FOREIGN KEY (order_seq_cust_meth_id) REFERENCES custom_method(custom_method_id);


--
-- Name: party_acctg_preference actgpref_odrsq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_odrsq FOREIGN KEY (order_sequence_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: party_acctg_preference actgpref_paymth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_paymth FOREIGN KEY (refund_payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- Name: party_acctg_preference actgpref_qtecm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_qtecm FOREIGN KEY (quote_seq_cust_meth_id) REFERENCES custom_method(custom_method_id);


--
-- Name: party_acctg_preference actgpref_qtesq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_qtesq FOREIGN KEY (quote_sequence_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: party_acctg_preference actgpref_taxform; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_acctg_preference
    ADD CONSTRAINT actgpref_taxform FOREIGN KEY (tax_form_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

