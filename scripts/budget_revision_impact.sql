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
-- Name: budget_revision_impact; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_revision_impact (
    budget_id character varying(20) NOT NULL,
    budget_item_seq_id character varying(20) NOT NULL,
    revision_seq_id character varying(20) NOT NULL,
    revised_amount numeric(18,2),
    add_delete_flag character(1),
    revision_reason character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_revision_impact OWNER TO ofbiz;

--
-- Name: budget_revision_impact pk_budget_revision_impact; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_revision_impact
    ADD CONSTRAINT pk_budget_revision_impact PRIMARY KEY (budget_id, budget_item_seq_id, revision_seq_id);


--
-- Name: bdt_rvn_impt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdt_rvn_impt_txcrs ON budget_revision_impact USING btree (created_tx_stamp);


--
-- Name: bdt_rvn_impt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdt_rvn_impt_txstp ON budget_revision_impact USING btree (last_updated_tx_stamp);


--
-- Name: budget_rnimp_bdgt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_rnimp_bdgt ON budget_revision_impact USING btree (budget_id);


--
-- Name: budget_rnimp_bitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_rnimp_bitm ON budget_revision_impact USING btree (budget_id, budget_item_seq_id);


--
-- Name: budget_rnimp_rev; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_rnimp_rev ON budget_revision_impact USING btree (budget_id, revision_seq_id);


--
-- Name: budget_revision_impact budget_rnimp_bdgt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_revision_impact
    ADD CONSTRAINT budget_rnimp_bdgt FOREIGN KEY (budget_id) REFERENCES budget(budget_id);


--
-- Name: budget_revision_impact budget_rnimp_bitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_revision_impact
    ADD CONSTRAINT budget_rnimp_bitm FOREIGN KEY (budget_id, budget_item_seq_id) REFERENCES budget_item(budget_id, budget_item_seq_id);


--
-- Name: budget_revision_impact budget_rnimp_rev; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_revision_impact
    ADD CONSTRAINT budget_rnimp_rev FOREIGN KEY (budget_id, revision_seq_id) REFERENCES budget_revision(budget_id, revision_seq_id);


--
-- PostgreSQL database dump complete
--

