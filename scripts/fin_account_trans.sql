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
-- Name: fin_account_trans; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fin_account_trans (
    fin_account_trans_id character varying(20) NOT NULL,
    fin_account_trans_type_id character varying(20),
    fin_account_id character varying(20),
    party_id character varying(20),
    gl_reconciliation_id character varying(20),
    transaction_date timestamp with time zone,
    entry_date timestamp with time zone,
    amount numeric(18,2),
    payment_id character varying(20),
    order_id character varying(20),
    order_item_seq_id character varying(20),
    performed_by_party_id character varying(20),
    reason_enum_id character varying(20),
    comments character varying(255),
    status_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fin_account_trans OWNER TO ofbiz;

--
-- Name: fin_account_trans pk_fin_account_trans; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT pk_fin_account_trans PRIMARY KEY (fin_account_trans_id);


--
-- Name: fin_act_reas_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_reas_enum ON fin_account_trans USING btree (reason_enum_id);


--
-- Name: fin_act_tx_fnact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_tx_fnact ON fin_account_trans USING btree (fin_account_id);


--
-- Name: fin_act_tx_glrec; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_tx_glrec ON fin_account_trans USING btree (gl_reconciliation_id);


--
-- Name: fin_act_tx_oditm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_tx_oditm ON fin_account_trans USING btree (order_id, order_item_seq_id);


--
-- Name: fin_act_tx_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_tx_party ON fin_account_trans USING btree (party_id);


--
-- Name: fin_act_tx_pbpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_tx_pbpty ON fin_account_trans USING btree (performed_by_party_id);


--
-- Name: fin_act_tx_pmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_tx_pmt ON fin_account_trans USING btree (payment_id);


--
-- Name: fin_act_tx_sti; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fin_act_tx_sti ON fin_account_trans USING btree (status_id);


--
-- Name: finacct_tx_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finacct_tx_type ON fin_account_trans USING btree (fin_account_trans_type_id);


--
-- Name: fn_acct_trs_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fn_acct_trs_txcrts ON fin_account_trans USING btree (created_tx_stamp);


--
-- Name: fn_acct_trs_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fn_acct_trs_txstmp ON fin_account_trans USING btree (last_updated_tx_stamp);


--
-- Name: fin_account_trans fin_act_reas_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT fin_act_reas_enum FOREIGN KEY (reason_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: fin_account_trans fin_act_tx_fnact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT fin_act_tx_fnact FOREIGN KEY (fin_account_id) REFERENCES fin_account(fin_account_id);


--
-- Name: fin_account_trans fin_act_tx_glrec; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT fin_act_tx_glrec FOREIGN KEY (gl_reconciliation_id) REFERENCES gl_reconciliation(gl_reconciliation_id);


--
-- Name: fin_account_trans fin_act_tx_oditm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT fin_act_tx_oditm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: fin_account_trans fin_act_tx_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT fin_act_tx_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: fin_account_trans fin_act_tx_pbpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT fin_act_tx_pbpty FOREIGN KEY (performed_by_party_id) REFERENCES party(party_id);


--
-- Name: fin_account_trans fin_act_tx_pmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT fin_act_tx_pmt FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- Name: fin_account_trans fin_act_tx_sti; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT fin_act_tx_sti FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: fin_account_trans finacct_tx_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_trans
    ADD CONSTRAINT finacct_tx_type FOREIGN KEY (fin_account_trans_type_id) REFERENCES fin_account_trans_type(fin_account_trans_type_id);


--
-- PostgreSQL database dump complete
--

