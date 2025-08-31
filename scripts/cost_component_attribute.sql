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
-- Name: cost_component_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cost_component_attribute (
    cost_component_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cost_component_attribute OWNER TO ofbiz;

--
-- Name: cost_component_attribute pk_cost_component_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_attribute
    ADD CONSTRAINT pk_cost_component_attribute PRIMARY KEY (cost_component_id, attr_name);


--
-- Name: cost_comp_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_attr ON cost_component_attribute USING btree (cost_component_id);


--
-- Name: cst_cmpt_attt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmpt_attt_txcs ON cost_component_attribute USING btree (created_tx_stamp);


--
-- Name: cst_cmpt_attt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmpt_attt_txsp ON cost_component_attribute USING btree (last_updated_tx_stamp);


--
-- Name: cost_component_attribute cost_comp_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_attribute
    ADD CONSTRAINT cost_comp_attr FOREIGN KEY (cost_component_id) REFERENCES cost_component(cost_component_id);


--
-- PostgreSQL database dump complete
--

