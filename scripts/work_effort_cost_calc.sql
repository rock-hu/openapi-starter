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
-- Name: work_effort_cost_calc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_cost_calc (
    work_effort_id character varying(20) NOT NULL,
    cost_component_type_id character varying(20) NOT NULL,
    cost_component_calc_id character varying(20),
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_cost_calc OWNER TO ofbiz;

--
-- Name: work_effort_cost_calc pk_work_effort_cost_calc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_cost_calc
    ADD CONSTRAINT pk_work_effort_cost_calc PRIMARY KEY (work_effort_id, cost_component_type_id, from_date);


--
-- Name: wk_effrt_cos_ccc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_cos_ccc ON work_effort_cost_calc USING btree (cost_component_calc_id);


--
-- Name: wk_effrt_cos_cct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_cos_cct ON work_effort_cost_calc USING btree (cost_component_type_id);


--
-- Name: wk_effrt_cos_wef; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_cos_wef ON work_effort_cost_calc USING btree (work_effort_id);


--
-- Name: wrk_eft_cst_clc_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_cst_clc_tp ON work_effort_cost_calc USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_cst_clc_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_cst_clc_ts ON work_effort_cost_calc USING btree (created_tx_stamp);


--
-- Name: work_effort_cost_calc wk_effrt_cos_ccc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_cost_calc
    ADD CONSTRAINT wk_effrt_cos_ccc FOREIGN KEY (cost_component_calc_id) REFERENCES cost_component_calc(cost_component_calc_id);


--
-- Name: work_effort_cost_calc wk_effrt_cos_cct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_cost_calc
    ADD CONSTRAINT wk_effrt_cos_cct FOREIGN KEY (cost_component_type_id) REFERENCES cost_component_type(cost_component_type_id);


--
-- Name: work_effort_cost_calc wk_effrt_cos_wef; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_cost_calc
    ADD CONSTRAINT wk_effrt_cos_wef FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

