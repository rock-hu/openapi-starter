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
-- Name: cost_component_calc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cost_component_calc (
    cost_component_calc_id character varying(20) NOT NULL,
    description character varying(255),
    cost_gl_account_type_id character varying(20),
    offsetting_gl_account_type_id character varying(20),
    fixed_cost numeric(18,2),
    variable_cost numeric(18,2),
    per_milli_second numeric(20,0),
    currency_uom_id character varying(20),
    cost_custom_method_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cost_component_calc OWNER TO ofbiz;

--
-- Name: cost_component_calc pk_cost_component_calc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_calc
    ADD CONSTRAINT pk_cost_component_calc PRIMARY KEY (cost_component_calc_id);


--
-- Name: cost_com_cglat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_com_cglat ON cost_component_calc USING btree (cost_gl_account_type_id);


--
-- Name: cost_com_cmet; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_com_cmet ON cost_component_calc USING btree (cost_custom_method_id);


--
-- Name: cost_com_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_com_cuom ON cost_component_calc USING btree (currency_uom_id);


--
-- Name: cost_com_oglat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_com_oglat ON cost_component_calc USING btree (offsetting_gl_account_type_id);


--
-- Name: cst_cmpt_clc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmpt_clc_txcrs ON cost_component_calc USING btree (created_tx_stamp);


--
-- Name: cst_cmpt_clc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmpt_clc_txstp ON cost_component_calc USING btree (last_updated_tx_stamp);


--
-- Name: cost_component_calc cost_com_cglat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_calc
    ADD CONSTRAINT cost_com_cglat FOREIGN KEY (cost_gl_account_type_id) REFERENCES gl_account_type(gl_account_type_id);


--
-- Name: cost_component_calc cost_com_cmet; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_calc
    ADD CONSTRAINT cost_com_cmet FOREIGN KEY (cost_custom_method_id) REFERENCES custom_method(custom_method_id);


--
-- Name: cost_component_calc cost_com_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_calc
    ADD CONSTRAINT cost_com_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: cost_component_calc cost_com_oglat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component_calc
    ADD CONSTRAINT cost_com_oglat FOREIGN KEY (offsetting_gl_account_type_id) REFERENCES gl_account_type(gl_account_type_id);


--
-- PostgreSQL database dump complete
--

