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
-- Name: billing_account_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE billing_account_role (
    billing_account_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.billing_account_role OWNER TO ofbiz;

--
-- Name: billing_account_role pk_billing_account_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_role
    ADD CONSTRAINT pk_billing_account_role PRIMARY KEY (billing_account_id, party_id, role_type_id, from_date);


--
-- Name: billacct_rl_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_rl_party ON billing_account_role USING btree (party_id);


--
-- Name: billacct_rl_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_rl_ptrl ON billing_account_role USING btree (party_id, role_type_id);


--
-- Name: billacct_role; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_role ON billing_account_role USING btree (billing_account_id);


--
-- Name: bllg_acct_rl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bllg_acct_rl_txcrs ON billing_account_role USING btree (created_tx_stamp);


--
-- Name: bllg_acct_rl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bllg_acct_rl_txstp ON billing_account_role USING btree (last_updated_tx_stamp);


--
-- Name: billing_account_role billacct_rl_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_role
    ADD CONSTRAINT billacct_rl_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: billing_account_role billacct_rl_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_role
    ADD CONSTRAINT billacct_rl_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: billing_account_role billacct_role; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_role
    ADD CONSTRAINT billacct_role FOREIGN KEY (billing_account_id) REFERENCES billing_account(billing_account_id);


--
-- PostgreSQL database dump complete
--

