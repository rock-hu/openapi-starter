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
-- Name: cost_component_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cost_component_type (
    cost_component_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cost_component_type OWNER TO ofbiz;

--
-- Name: cost_component_type pk_cost_component_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_type
    ADD CONSTRAINT pk_cost_component_type PRIMARY KEY (cost_component_type_id);


--
-- Name: cost_comp_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_type_par ON cost_component_type USING btree (parent_type_id);


--
-- Name: cst_cmpnt_tp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmpnt_tp_txcrs ON cost_component_type USING btree (created_tx_stamp);


--
-- Name: cst_cmpnt_tp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmpnt_tp_txstp ON cost_component_type USING btree (last_updated_tx_stamp);


--
-- Name: cost_component_type cost_comp_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_type
    ADD CONSTRAINT cost_comp_type_par FOREIGN KEY (parent_type_id) REFERENCES cost_component_type(cost_component_type_id);


--
-- PostgreSQL database dump complete
--

