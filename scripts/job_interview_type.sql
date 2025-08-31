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
-- Name: job_interview_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE job_interview_type (
    job_interview_type_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.job_interview_type OWNER TO ofbiz;

--
-- Name: job_interview_type pk_job_interview_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_interview_type
    ADD CONSTRAINT pk_job_interview_type PRIMARY KEY (job_interview_type_id);


--
-- Name: jb_intrw_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jb_intrw_tp_txcrts ON job_interview_type USING btree (created_tx_stamp);


--
-- Name: jb_intrw_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jb_intrw_tp_txstmp ON job_interview_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

