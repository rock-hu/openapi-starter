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
-- Name: cost_component_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cost_component_type_attr (
    cost_component_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cost_component_type_attr OWNER TO ofbiz;

--
-- Name: cost_component_type_attr pk_cost_component_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_type_attr
    ADD CONSTRAINT pk_cost_component_type_attr PRIMARY KEY (cost_component_type_id, attr_name);


--
-- Name: cost_comp_tattr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_tattr ON cost_component_type_attr USING btree (cost_component_type_id);


--
-- Name: cst_cmt_tp_atr_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmt_tp_atr_txp ON cost_component_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: cst_cmt_tp_atr_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmt_tp_atr_txs ON cost_component_type_attr USING btree (created_tx_stamp);


--
-- Name: cost_component_type_attr cost_comp_tattr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_type_attr
    ADD CONSTRAINT cost_comp_tattr FOREIGN KEY (cost_component_type_id) REFERENCES cost_component_type(cost_component_type_id);


--
-- PostgreSQL database dump complete
--

