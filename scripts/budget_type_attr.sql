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
-- Name: budget_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_type_attr (
    budget_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_type_attr OWNER TO ofbiz;

--
-- Name: budget_type_attr pk_budget_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_type_attr
    ADD CONSTRAINT pk_budget_type_attr PRIMARY KEY (budget_type_id, attr_name);


--
-- Name: bdgt_tp_atr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_tp_atr_txcrts ON budget_type_attr USING btree (created_tx_stamp);


--
-- Name: bdgt_tp_atr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_tp_atr_txstmp ON budget_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: budget_tpatr_bt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_tpatr_bt ON budget_type_attr USING btree (budget_type_id);


--
-- Name: budget_type_attr budget_tpatr_bt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_type_attr
    ADD CONSTRAINT budget_tpatr_bt FOREIGN KEY (budget_type_id) REFERENCES budget_type(budget_type_id);


--
-- PostgreSQL database dump complete
--

