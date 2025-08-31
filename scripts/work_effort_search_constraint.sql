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
-- Name: work_effort_search_constraint; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_search_constraint (
    work_effort_search_result_id character varying(20) NOT NULL,
    constraint_seq_id character varying(20) NOT NULL,
    constraint_name character varying(255),
    info_string character varying(255),
    include_sub_work_efforts character(1),
    is_and character(1),
    any_prefix character(1),
    any_suffix character(1),
    remove_stems character(1),
    low_value character varying(60),
    high_value character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_search_constraint OWNER TO ofbiz;

--
-- Name: work_effort_search_constraint pk_work_effort_search_constrai; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_search_constraint
    ADD CONSTRAINT pk_work_effort_search_constrai PRIMARY KEY (work_effort_search_result_id, constraint_seq_id);


--
-- Name: weff_schrsi_res; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX weff_schrsi_res ON work_effort_search_constraint USING btree (work_effort_search_result_id);


--
-- Name: wrk_eft_srh_cnt_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_srh_cnt_tp ON work_effort_search_constraint USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_srh_cnt_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_srh_cnt_ts ON work_effort_search_constraint USING btree (created_tx_stamp);


--
-- Name: work_effort_search_constraint weff_schrsi_res; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_search_constraint
    ADD CONSTRAINT weff_schrsi_res FOREIGN KEY (work_effort_search_result_id) REFERENCES work_effort_search_result(work_effort_search_result_id);


--
-- PostgreSQL database dump complete
--

