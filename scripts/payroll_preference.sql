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
-- Name: payroll_preference; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payroll_preference (
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    payroll_preference_seq_id character varying(20) NOT NULL,
    deduction_type_id character varying(20),
    payment_method_type_id character varying(20),
    period_type_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    percentage double precision,
    flat_amount numeric(18,2),
    routing_number character varying(60),
    account_number character varying(60),
    bank_name character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payroll_preference OWNER TO ofbiz;

--
-- Name: payroll_preference pk_payroll_preference; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payroll_preference
    ADD CONSTRAINT pk_payroll_preference PRIMARY KEY (party_id, role_type_id, payroll_preference_seq_id);


--
-- Name: prl_pref_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prl_pref_prty ON payroll_preference USING btree (party_id);


--
-- Name: prl_pref_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prl_pref_ptrl ON payroll_preference USING btree (party_id, role_type_id);


--
-- Name: prll_prfrnc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prll_prfrnc_txcrts ON payroll_preference USING btree (created_tx_stamp);


--
-- Name: prll_prfrnc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prll_prfrnc_txstmp ON payroll_preference USING btree (last_updated_tx_stamp);


--
-- Name: payroll_preference prl_pref_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payroll_preference
    ADD CONSTRAINT prl_pref_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: payroll_preference prl_pref_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payroll_preference
    ADD CONSTRAINT prl_pref_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

