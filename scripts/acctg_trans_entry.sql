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
-- Name: acctg_trans_entry; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE acctg_trans_entry (
    acctg_trans_id character varying(20) NOT NULL,
    acctg_trans_entry_seq_id character varying(20) NOT NULL,
    acctg_trans_entry_type_id character varying(20),
    description character varying(255),
    voucher_ref character varying(60),
    party_id character varying(20),
    role_type_id character varying(20),
    their_party_id character varying(20),
    product_id character varying(20),
    their_product_id character varying(20),
    inventory_item_id character varying(20),
    gl_account_type_id character varying(20),
    gl_account_id character varying(20),
    organization_party_id character varying(20),
    amount numeric(18,2),
    currency_uom_id character varying(20),
    orig_amount numeric(18,2),
    orig_currency_uom_id character varying(20),
    debit_credit_flag character(1),
    due_date date,
    group_id character varying(20),
    tax_id character varying(20),
    reconcile_status_id character varying(20),
    settlement_term_id character varying(20),
    is_summary character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.acctg_trans_entry OWNER TO ofbiz;

--
-- Name: acctg_trans_entry pk_acctg_trans_entry; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT pk_acctg_trans_entry PRIMARY KEY (acctg_trans_id, acctg_trans_entry_seq_id);


--
-- Name: accg_trs_enr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accg_trs_enr_txcrs ON acctg_trans_entry USING btree (created_tx_stamp);


--
-- Name: accg_trs_enr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accg_trs_enr_txstp ON acctg_trans_entry USING btree (last_updated_tx_stamp);


--
-- Name: accttxent_actx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_actx ON acctg_trans_entry USING btree (acctg_trans_id);


--
-- Name: accttxent_atet; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_atet ON acctg_trans_entry USING btree (acctg_trans_entry_type_id);


--
-- Name: accttxent_curncy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_curncy ON acctg_trans_entry USING btree (currency_uom_id);


--
-- Name: accttxent_glacog; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_glacog ON acctg_trans_entry USING btree (gl_account_id, organization_party_id);


--
-- Name: accttxent_glact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_glact ON acctg_trans_entry USING btree (gl_account_id);


--
-- Name: accttxent_glactt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_glactt ON acctg_trans_entry USING btree (gl_account_type_id);


--
-- Name: accttxent_invitem; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_invitem ON acctg_trans_entry USING btree (inventory_item_id);


--
-- Name: accttxent_ocurncy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_ocurncy ON acctg_trans_entry USING btree (orig_currency_uom_id);


--
-- Name: accttxent_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_party ON acctg_trans_entry USING btree (party_id);


--
-- Name: accttxent_rcsts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_rcsts ON acctg_trans_entry USING btree (reconcile_status_id);


--
-- Name: accttxent_rltyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_rltyp ON acctg_trans_entry USING btree (role_type_id);


--
-- Name: accttxent_stlen; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttxent_stlen ON acctg_trans_entry USING btree (settlement_term_id);


--
-- Name: acctg_trans_entry accttxent_actx; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_actx FOREIGN KEY (acctg_trans_id) REFERENCES acctg_trans(acctg_trans_id);


--
-- Name: acctg_trans_entry accttxent_atet; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_atet FOREIGN KEY (acctg_trans_entry_type_id) REFERENCES acctg_trans_entry_type(acctg_trans_entry_type_id);


--
-- Name: acctg_trans_entry accttxent_curncy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_curncy FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: acctg_trans_entry accttxent_glacog; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_glacog FOREIGN KEY (gl_account_id, organization_party_id) REFERENCES gl_account_organization(gl_account_id, organization_party_id);


--
-- Name: acctg_trans_entry accttxent_glact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_glact FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: acctg_trans_entry accttxent_glactt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_glactt FOREIGN KEY (gl_account_type_id) REFERENCES gl_account_type(gl_account_type_id);


--
-- Name: acctg_trans_entry accttxent_invitem; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_invitem FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: acctg_trans_entry accttxent_ocurncy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_ocurncy FOREIGN KEY (orig_currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: acctg_trans_entry accttxent_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: acctg_trans_entry accttxent_rcsts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_rcsts FOREIGN KEY (reconcile_status_id) REFERENCES status_item(status_id);


--
-- Name: acctg_trans_entry accttxent_rltyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_rltyp FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: acctg_trans_entry accttxent_stlen; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans_entry
    ADD CONSTRAINT accttxent_stlen FOREIGN KEY (settlement_term_id) REFERENCES settlement_term(settlement_term_id);


--
-- PostgreSQL database dump complete
--

