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
-- Name: gl_account_history; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_account_history (
    gl_account_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    custom_time_period_id character varying(20) NOT NULL,
    opening_balance numeric(18,2),
    posted_debits numeric(18,2),
    posted_credits numeric(18,2),
    ending_balance numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_account_history OWNER TO ofbiz;

--
-- Name: gl_account_history pk_gl_account_history; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_history
    ADD CONSTRAINT pk_gl_account_history PRIMARY KEY (gl_account_id, organization_party_id, custom_time_period_id);


--
-- Name: gl_acct_hsr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_acct_hsr_txcrts ON gl_account_history USING btree (created_tx_stamp);


--
-- Name: gl_acct_hsr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_acct_hsr_txstmp ON gl_account_history USING btree (last_updated_tx_stamp);


--
-- Name: glacct_hst_ctp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_hst_ctp ON gl_account_history USING btree (custom_time_period_id);


--
-- Name: glacct_hst_gla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_hst_gla ON gl_account_history USING btree (gl_account_id);


--
-- Name: glacct_hst_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_hst_party ON gl_account_history USING btree (organization_party_id);


--
-- Name: gl_account_history glacct_hst_ctp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_history
    ADD CONSTRAINT glacct_hst_ctp FOREIGN KEY (custom_time_period_id) REFERENCES custom_time_period(custom_time_period_id);


--
-- Name: gl_account_history glacct_hst_gla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_history
    ADD CONSTRAINT glacct_hst_gla FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: gl_account_history glacct_hst_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_history
    ADD CONSTRAINT glacct_hst_party FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

