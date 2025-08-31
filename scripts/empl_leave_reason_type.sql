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
-- Name: empl_leave_reason_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE empl_leave_reason_type (
    empl_leave_reason_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.empl_leave_reason_type OWNER TO ofbiz;

--
-- Name: empl_leave_reason_type pk_empl_leave_reason_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_leave_reason_type
    ADD CONSTRAINT pk_empl_leave_reason_type PRIMARY KEY (empl_leave_reason_type_id);


--
-- Name: eml_lv_rsn_tp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_lv_rsn_tp_txcs ON empl_leave_reason_type USING btree (created_tx_stamp);


--
-- Name: eml_lv_rsn_tp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_lv_rsn_tp_txsp ON empl_leave_reason_type USING btree (last_updated_tx_stamp);


--
-- Name: empl_reason_tpar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_reason_tpar ON empl_leave_reason_type USING btree (parent_type_id);


--
-- Name: empl_leave_reason_type empl_reason_tpar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_leave_reason_type
    ADD CONSTRAINT empl_reason_tpar FOREIGN KEY (parent_type_id) REFERENCES empl_leave_reason_type(empl_leave_reason_type_id);


--
-- PostgreSQL database dump complete
--

