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
-- Name: payment_budget_allocation; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE payment_budget_allocation (
    budget_id character varying(20) NOT NULL,
    budget_item_seq_id character varying(20) NOT NULL,
    payment_id character varying(20) NOT NULL,
    amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.payment_budget_allocation OWNER TO ofbiz;

--
-- Name: payment_budget_allocation pk_payment_budget_allocation; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_budget_allocation
    ADD CONSTRAINT pk_payment_budget_allocation PRIMARY KEY (budget_id, budget_item_seq_id, payment_id);


--
-- Name: payment_ba_bdgt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_ba_bdgt ON payment_budget_allocation USING btree (budget_id);


--
-- Name: payment_ba_pmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX payment_ba_pmt ON payment_budget_allocation USING btree (payment_id);


--
-- Name: pmt_bdt_alln_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_bdt_alln_txcrs ON payment_budget_allocation USING btree (created_tx_stamp);


--
-- Name: pmt_bdt_alln_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pmt_bdt_alln_txstp ON payment_budget_allocation USING btree (last_updated_tx_stamp);


--
-- Name: payment_budget_allocation payment_ba_bdgt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_budget_allocation
    ADD CONSTRAINT payment_ba_bdgt FOREIGN KEY (budget_id) REFERENCES budget(budget_id);


--
-- Name: payment_budget_allocation payment_ba_pmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY payment_budget_allocation
    ADD CONSTRAINT payment_ba_pmt FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- PostgreSQL database dump complete
--

