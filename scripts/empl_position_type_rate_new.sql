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
-- Name: empl_position_type_rate_new; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE empl_position_type_rate_new (
    empl_position_type_id character varying(20) NOT NULL,
    rate_type_id character varying(20) NOT NULL,
    pay_grade_id character varying(20),
    salary_step_seq_id character varying(20),
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.empl_position_type_rate_new OWNER TO ofbiz;

--
-- Name: empl_position_type_rate_new pk_empl_position_type_rate_new; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_type_rate_new
    ADD CONSTRAINT pk_empl_position_type_rate_new PRIMARY KEY (empl_position_type_id, rate_type_id, from_date);


--
-- Name: eml_tp_rt_nw_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_tp_rt_nw_tp ON empl_position_type_rate_new USING btree (last_updated_tx_stamp);


--
-- Name: eml_tp_rt_nw_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_tp_rt_nw_ts ON empl_position_type_rate_new USING btree (created_tx_stamp);


--
-- Name: empl_ptprt_eptp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_ptprt_eptp ON empl_position_type_rate_new USING btree (empl_position_type_id);


--
-- Name: empl_position_type_rate_new empl_ptprt_eptp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_type_rate_new
    ADD CONSTRAINT empl_ptprt_eptp FOREIGN KEY (empl_position_type_id) REFERENCES empl_position_type(empl_position_type_id);


--
-- PostgreSQL database dump complete
--

