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
-- Name: budget_scenario_application; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_scenario_application (
    budget_scenario_applic_id character varying(20) NOT NULL,
    budget_scenario_id character varying(20) NOT NULL,
    budget_id character varying(20),
    budget_item_seq_id character varying(20),
    amount_change numeric(18,2),
    percentage_change numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_scenario_application OWNER TO ofbiz;

--
-- Name: budget_scenario_application pk_budget_scenario_application; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_scenario_application
    ADD CONSTRAINT pk_budget_scenario_application PRIMARY KEY (budget_scenario_applic_id, budget_scenario_id);


--
-- Name: bdt_scr_appln_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdt_scr_appln_txcs ON budget_scenario_application USING btree (created_tx_stamp);


--
-- Name: bdt_scr_appln_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdt_scr_appln_txsp ON budget_scenario_application USING btree (last_updated_tx_stamp);


--
-- Name: budget_sapl_bdgt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_sapl_bdgt ON budget_scenario_application USING btree (budget_id);


--
-- Name: budget_sapl_bitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_sapl_bitm ON budget_scenario_application USING btree (budget_id, budget_item_seq_id);


--
-- Name: budget_sapl_bscn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_sapl_bscn ON budget_scenario_application USING btree (budget_scenario_id);


--
-- Name: budget_scenario_application budget_sapl_bdgt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_scenario_application
    ADD CONSTRAINT budget_sapl_bdgt FOREIGN KEY (budget_id) REFERENCES budget(budget_id);


--
-- Name: budget_scenario_application budget_sapl_bitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_scenario_application
    ADD CONSTRAINT budget_sapl_bitm FOREIGN KEY (budget_id, budget_item_seq_id) REFERENCES budget_item(budget_id, budget_item_seq_id);


--
-- Name: budget_scenario_application budget_sapl_bscn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_scenario_application
    ADD CONSTRAINT budget_sapl_bscn FOREIGN KEY (budget_scenario_id) REFERENCES budget_scenario(budget_scenario_id);


--
-- PostgreSQL database dump complete
--

