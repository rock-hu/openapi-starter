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
-- Name: security_permission; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE security_permission (
    permission_id character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.security_permission OWNER TO ofbiz;

--
-- Name: security_permission pk_security_permission; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY security_permission
    ADD CONSTRAINT pk_security_permission PRIMARY KEY (permission_id);


--
-- Name: scrt_prmssn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX scrt_prmssn_txcrts ON security_permission USING btree (created_tx_stamp);


--
-- Name: scrt_prmssn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX scrt_prmssn_txstmp ON security_permission USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

