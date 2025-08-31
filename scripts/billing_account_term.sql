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
-- Name: billing_account_term; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE billing_account_term (
    billing_account_term_id character varying(20) NOT NULL,
    billing_account_id character varying(20),
    term_type_id character varying(20),
    term_value numeric(18,2),
    term_days numeric(20,0),
    uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.billing_account_term OWNER TO ofbiz;

--
-- Name: billing_account_term pk_billing_account_term; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_term
    ADD CONSTRAINT pk_billing_account_term PRIMARY KEY (billing_account_term_id);


--
-- Name: billacct_trm_bact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_trm_bact ON billing_account_term USING btree (billing_account_id);


--
-- Name: billacct_trm_trm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_trm_trm ON billing_account_term USING btree (term_type_id);


--
-- Name: billacct_trm_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_trm_uom ON billing_account_term USING btree (uom_id);


--
-- Name: bllg_act_trm_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bllg_act_trm_txcrs ON billing_account_term USING btree (created_tx_stamp);


--
-- Name: bllg_act_trm_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bllg_act_trm_txstp ON billing_account_term USING btree (last_updated_tx_stamp);


--
-- Name: billing_account_term billacct_trm_bact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_term
    ADD CONSTRAINT billacct_trm_bact FOREIGN KEY (billing_account_id) REFERENCES billing_account(billing_account_id);


--
-- Name: billing_account_term billacct_trm_trm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_term
    ADD CONSTRAINT billacct_trm_trm FOREIGN KEY (term_type_id) REFERENCES term_type(term_type_id);


--
-- Name: billing_account_term billacct_trm_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_term
    ADD CONSTRAINT billacct_trm_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

