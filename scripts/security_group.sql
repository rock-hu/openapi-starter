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
-- Name: security_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE security_group (
    group_id character varying(20) NOT NULL,
    group_name character varying(255),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.security_group OWNER TO ofbiz;

--
-- Name: security_group pk_security_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY security_group
    ADD CONSTRAINT pk_security_group PRIMARY KEY (group_id);


--
-- Name: scrt_grp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX scrt_grp_txcrts ON security_group USING btree (created_tx_stamp);


--
-- Name: scrt_grp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX scrt_grp_txstmp ON security_group USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

