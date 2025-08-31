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
-- Name: work_effort_content_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_content_type (
    work_effort_content_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_content_type OWNER TO ofbiz;

--
-- Name: work_effort_content_type pk_work_effort_content_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_content_type
    ADD CONSTRAINT pk_work_effort_content_type PRIMARY KEY (work_effort_content_type_id);


--
-- Name: weffctp_tp_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX weffctp_tp_par ON work_effort_content_type USING btree (parent_type_id);


--
-- Name: wrk_eft_cnt_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_cnt_tp_txp ON work_effort_content_type USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_cnt_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_cnt_tp_txs ON work_effort_content_type USING btree (created_tx_stamp);


--
-- Name: work_effort_content_type weffctp_tp_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_content_type
    ADD CONSTRAINT weffctp_tp_par FOREIGN KEY (parent_type_id) REFERENCES work_effort_content_type(work_effort_content_type_id);


--
-- PostgreSQL database dump complete
--

