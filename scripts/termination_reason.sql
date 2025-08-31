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
-- Name: termination_reason; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE termination_reason (
    termination_reason_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.termination_reason OWNER TO ofbiz;

--
-- Name: termination_reason pk_termination_reason; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY termination_reason
    ADD CONSTRAINT pk_termination_reason PRIMARY KEY (termination_reason_id);


--
-- Name: trmntn_rsn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trmntn_rsn_txcrts ON termination_reason USING btree (created_tx_stamp);


--
-- Name: trmntn_rsn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trmntn_rsn_txstmp ON termination_reason USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

