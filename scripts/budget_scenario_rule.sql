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
-- Name: budget_scenario_rule; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_scenario_rule (
    budget_scenario_id character varying(20) NOT NULL,
    budget_item_type_id character varying(20) NOT NULL,
    amount_change numeric(18,2),
    percentage_change numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_scenario_rule OWNER TO ofbiz;

--
-- Name: budget_scenario_rule pk_budget_scenario_rule; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_scenario_rule
    ADD CONSTRAINT pk_budget_scenario_rule PRIMARY KEY (budget_scenario_id, budget_item_type_id);


--
-- Name: bdgt_scr_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_scr_rl_txcrts ON budget_scenario_rule USING btree (created_tx_stamp);


--
-- Name: bdgt_scr_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_scr_rl_txstmp ON budget_scenario_rule USING btree (last_updated_tx_stamp);


--
-- Name: budget_srle_bitp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_srle_bitp ON budget_scenario_rule USING btree (budget_item_type_id);


--
-- Name: budget_srle_bscn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_srle_bscn ON budget_scenario_rule USING btree (budget_scenario_id);


--
-- Name: budget_scenario_rule budget_srle_bitp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_scenario_rule
    ADD CONSTRAINT budget_srle_bitp FOREIGN KEY (budget_item_type_id) REFERENCES budget_item_type(budget_item_type_id);


--
-- Name: budget_scenario_rule budget_srle_bscn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_scenario_rule
    ADD CONSTRAINT budget_srle_bscn FOREIGN KEY (budget_scenario_id) REFERENCES budget_scenario(budget_scenario_id);


--
-- PostgreSQL database dump complete
--

