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
-- Name: billing_account_term_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE billing_account_term_attr (
    billing_account_term_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.billing_account_term_attr OWNER TO ofbiz;

--
-- Name: billing_account_term_attr pk_billing_account_term_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_term_attr
    ADD CONSTRAINT pk_billing_account_term_attr PRIMARY KEY (billing_account_term_id, attr_name);


--
-- Name: billacct_trm_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_trm_attr ON billing_account_term_attr USING btree (billing_account_term_id);


--
-- Name: blg_act_trm_atr_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX blg_act_trm_atr_tp ON billing_account_term_attr USING btree (last_updated_tx_stamp);


--
-- Name: blg_act_trm_atr_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX blg_act_trm_atr_ts ON billing_account_term_attr USING btree (created_tx_stamp);


--
-- Name: billing_account_term_attr billacct_trm_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account_term_attr
    ADD CONSTRAINT billacct_trm_attr FOREIGN KEY (billing_account_term_id) REFERENCES billing_account_term(billing_account_term_id);


--
-- PostgreSQL database dump complete
--

