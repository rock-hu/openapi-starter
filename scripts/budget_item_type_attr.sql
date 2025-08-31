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
-- Name: budget_item_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_item_type_attr (
    budget_item_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_item_type_attr OWNER TO ofbiz;

--
-- Name: budget_item_type_attr pk_budget_item_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_item_type_attr
    ADD CONSTRAINT pk_budget_item_type_attr PRIMARY KEY (budget_item_type_id, attr_name);


--
-- Name: bdt_itm_tp_atr_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdt_itm_tp_atr_txp ON budget_item_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: bdt_itm_tp_atr_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdt_itm_tp_atr_txs ON budget_item_type_attr USING btree (created_tx_stamp);


--
-- Name: budget_itmtypattr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_itmtypattr ON budget_item_type_attr USING btree (budget_item_type_id);


--
-- Name: budget_item_type_attr budget_itmtypattr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_item_type_attr
    ADD CONSTRAINT budget_itmtypattr FOREIGN KEY (budget_item_type_id) REFERENCES budget_item_type(budget_item_type_id);


--
-- PostgreSQL database dump complete
--

