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
-- Name: catalina_session; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE catalina_session (
    session_id character varying(60) NOT NULL,
    session_size numeric(20,0),
    session_info bytea,
    is_valid character(1),
    max_idle numeric(20,0),
    last_accessed numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.catalina_session OWNER TO ofbiz;

--
-- Name: catalina_session pk_catalina_session; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY catalina_session
    ADD CONSTRAINT pk_catalina_session PRIMARY KEY (session_id);


--
-- Name: ctln_sssn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ctln_sssn_txcrts ON catalina_session USING btree (created_tx_stamp);


--
-- Name: ctln_sssn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ctln_sssn_txstmp ON catalina_session USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

