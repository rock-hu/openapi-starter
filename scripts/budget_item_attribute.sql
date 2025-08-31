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
-- Name: budget_item_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_item_attribute (
    budget_id character varying(20) NOT NULL,
    budget_item_seq_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_item_attribute OWNER TO ofbiz;

--
-- Name: budget_item_attribute pk_budget_item_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_item_attribute
    ADD CONSTRAINT pk_budget_item_attribute PRIMARY KEY (budget_id, budget_item_seq_id, attr_name);


--
-- Name: bdt_itm_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdt_itm_attt_txcrs ON budget_item_attribute USING btree (created_tx_stamp);


--
-- Name: bdt_itm_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdt_itm_attt_txstp ON budget_item_attribute USING btree (last_updated_tx_stamp);


--
-- Name: budget_item_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_item_attr ON budget_item_attribute USING btree (budget_id, budget_item_seq_id);


--
-- Name: budget_item_attribute budget_item_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_item_attribute
    ADD CONSTRAINT budget_item_attr FOREIGN KEY (budget_id, budget_item_seq_id) REFERENCES budget_item(budget_id, budget_item_seq_id);


--
-- PostgreSQL database dump complete
--

