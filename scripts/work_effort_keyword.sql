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
-- Name: work_effort_keyword; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_keyword (
    work_effort_id character varying(20) NOT NULL,
    keyword character varying(60) NOT NULL,
    relevancy_weight numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_keyword OWNER TO ofbiz;

--
-- Name: work_effort_keyword pk_work_effort_keyword; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_keyword
    ADD CONSTRAINT pk_work_effort_keyword PRIMARY KEY (work_effort_id, keyword);


--
-- Name: weff_kwd_kwd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX weff_kwd_kwd ON work_effort_keyword USING btree (keyword);


--
-- Name: weff_kwd_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX weff_kwd_weff ON work_effort_keyword USING btree (work_effort_id);


--
-- Name: wrk_efft_kwd_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_kwd_txcrs ON work_effort_keyword USING btree (created_tx_stamp);


--
-- Name: wrk_efft_kwd_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_kwd_txstp ON work_effort_keyword USING btree (last_updated_tx_stamp);


--
-- Name: work_effort_keyword weff_kwd_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_keyword
    ADD CONSTRAINT weff_kwd_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

