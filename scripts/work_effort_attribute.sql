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
-- Name: work_effort_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_attribute (
    work_effort_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_attribute OWNER TO ofbiz;

--
-- Name: work_effort_attribute pk_work_effort_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_attribute
    ADD CONSTRAINT pk_work_effort_attribute PRIMARY KEY (work_effort_id, attr_name);


--
-- Name: wk_effrt_attr_we; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_attr_we ON work_effort_attribute USING btree (work_effort_id);


--
-- Name: wrk_eft_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_attt_txcrs ON work_effort_attribute USING btree (created_tx_stamp);


--
-- Name: wrk_eft_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_attt_txstp ON work_effort_attribute USING btree (last_updated_tx_stamp);


--
-- Name: work_effort_attribute wk_effrt_attr_we; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_attribute
    ADD CONSTRAINT wk_effrt_attr_we FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

