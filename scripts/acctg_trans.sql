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
-- Name: acctg_trans; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE acctg_trans (
    acctg_trans_id character varying(20) NOT NULL,
    acctg_trans_type_id character varying(20),
    description character varying(255),
    transaction_date timestamp with time zone,
    is_posted character(1),
    posted_date timestamp with time zone,
    scheduled_posting_date timestamp with time zone,
    gl_journal_id character varying(20),
    gl_fiscal_type_id character varying(20),
    voucher_ref character varying(60),
    voucher_date timestamp with time zone,
    group_status_id character varying(20),
    fixed_asset_id character varying(20),
    inventory_item_id character varying(20),
    physical_inventory_id character varying(20),
    party_id character varying(20),
    role_type_id character varying(20),
    invoice_id character varying(20),
    payment_id character varying(20),
    fin_account_trans_id character varying(20),
    shipment_id character varying(20),
    receipt_id character varying(20),
    work_effort_id character varying(20),
    their_acctg_trans_id character varying(60),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.acctg_trans OWNER TO ofbiz;

--
-- Name: acctg_trans pk_acctg_trans; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT pk_acctg_trans PRIMARY KEY (acctg_trans_id);


--
-- Name: acctg_trans_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX acctg_trans_txcrts ON acctg_trans USING btree (created_tx_stamp);


--
-- Name: acctg_trans_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX acctg_trans_txstmp ON acctg_trans USING btree (last_updated_tx_stamp);


--
-- Name: accttx_fasset; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_fasset ON acctg_trans USING btree (fixed_asset_id);


--
-- Name: accttx_fnacttr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_fnacttr ON acctg_trans USING btree (fin_account_trans_id);


--
-- Name: accttx_glfst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_glfst ON acctg_trans USING btree (gl_fiscal_type_id);


--
-- Name: accttx_gljrnl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_gljrnl ON acctg_trans USING btree (gl_journal_id);


--
-- Name: accttx_grpstts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_grpstts ON acctg_trans USING btree (group_status_id);


--
-- Name: accttx_invitem; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_invitem ON acctg_trans USING btree (inventory_item_id);


--
-- Name: accttx_invitemvar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_invitemvar ON acctg_trans USING btree (inventory_item_id, physical_inventory_id);


--
-- Name: accttx_invoice; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_invoice ON acctg_trans USING btree (invoice_id);


--
-- Name: accttx_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_party ON acctg_trans USING btree (party_id);


--
-- Name: accttx_payment; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_payment ON acctg_trans USING btree (payment_id);


--
-- Name: accttx_phs_inv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_phs_inv ON acctg_trans USING btree (physical_inventory_id);


--
-- Name: accttx_roletyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_roletyp ON acctg_trans USING btree (role_type_id);


--
-- Name: accttx_shipment; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_shipment ON acctg_trans USING btree (shipment_id);


--
-- Name: accttx_shiprcpt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_shiprcpt ON acctg_trans USING btree (receipt_id);


--
-- Name: accttx_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_type ON acctg_trans USING btree (acctg_trans_type_id);


--
-- Name: accttx_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX accttx_weff ON acctg_trans USING btree (work_effort_id);


--
-- Name: acctg_trans accttx_fasset; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_fasset FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: acctg_trans accttx_fnacttr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_fnacttr FOREIGN KEY (fin_account_trans_id) REFERENCES fin_account_trans(fin_account_trans_id);


--
-- Name: acctg_trans accttx_glfst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_glfst FOREIGN KEY (gl_fiscal_type_id) REFERENCES gl_fiscal_type(gl_fiscal_type_id);


--
-- Name: acctg_trans accttx_gljrnl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_gljrnl FOREIGN KEY (gl_journal_id) REFERENCES gl_journal(gl_journal_id);


--
-- Name: acctg_trans accttx_grpstts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_grpstts FOREIGN KEY (group_status_id) REFERENCES status_item(status_id);


--
-- Name: acctg_trans accttx_invitem; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_invitem FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: acctg_trans accttx_invitemvar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_invitemvar FOREIGN KEY (inventory_item_id, physical_inventory_id) REFERENCES inventory_item_variance(inventory_item_id, physical_inventory_id);


--
-- Name: acctg_trans accttx_invoice; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_invoice FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);


--
-- Name: acctg_trans accttx_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: acctg_trans accttx_payment; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_payment FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- Name: acctg_trans accttx_phs_inv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_phs_inv FOREIGN KEY (physical_inventory_id) REFERENCES physical_inventory(physical_inventory_id);


--
-- Name: acctg_trans accttx_roletyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_roletyp FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: acctg_trans accttx_shipment; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_shipment FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id);


--
-- Name: acctg_trans accttx_shiprcpt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_shiprcpt FOREIGN KEY (receipt_id) REFERENCES shipment_receipt(receipt_id);


--
-- Name: acctg_trans accttx_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_type FOREIGN KEY (acctg_trans_type_id) REFERENCES acctg_trans_type(acctg_trans_type_id);


--
-- Name: acctg_trans accttx_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY acctg_trans
    ADD CONSTRAINT accttx_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

