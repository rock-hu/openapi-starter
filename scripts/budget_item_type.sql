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
-- Name: budget_item_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_item_type (
    budget_item_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_item_type OWNER TO ofbiz;

--
-- Name: budget_item_type pk_budget_item_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_item_type
    ADD CONSTRAINT pk_budget_item_type PRIMARY KEY (budget_item_type_id);


--
-- Name: bdgt_itm_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_itm_tp_txcrts ON budget_item_type USING btree (created_tx_stamp);


--
-- Name: bdgt_itm_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_itm_tp_txstmp ON budget_item_type USING btree (last_updated_tx_stamp);


--
-- Name: budget_itm_typpar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_itm_typpar ON budget_item_type USING btree (parent_type_id);


--
-- Name: budget_item_type budget_itm_typpar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_item_type
    ADD CONSTRAINT budget_itm_typpar FOREIGN KEY (parent_type_id) REFERENCES budget_item_type(budget_item_type_id);


--
-- PostgreSQL database dump complete
--

