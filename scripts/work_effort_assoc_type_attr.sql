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
-- Name: work_effort_assoc_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_assoc_type_attr (
    work_effort_assoc_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_assoc_type_attr OWNER TO ofbiz;

--
-- Name: work_effort_assoc_type_attr pk_work_effort_assoc_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_assoc_type_attr
    ADD CONSTRAINT pk_work_effort_assoc_type_attr PRIMARY KEY (work_effort_assoc_type_id, attr_name);


--
-- Name: wk_effrtassc_tatr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrtassc_tatr ON work_effort_assoc_type_attr USING btree (work_effort_assoc_type_id);


--
-- Name: wrk_asc_tp_atr_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_asc_tp_atr_tp ON work_effort_assoc_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: wrk_asc_tp_atr_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_asc_tp_atr_ts ON work_effort_assoc_type_attr USING btree (created_tx_stamp);


--
-- Name: work_effort_assoc_type_attr wk_effrtassc_tatr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_assoc_type_attr
    ADD CONSTRAINT wk_effrtassc_tatr FOREIGN KEY (work_effort_assoc_type_id) REFERENCES work_effort_assoc_type(work_effort_assoc_type_id);


--
-- PostgreSQL database dump complete
--

