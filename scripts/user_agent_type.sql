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
-- Name: user_agent_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE user_agent_type (
    user_agent_type_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.user_agent_type OWNER TO ofbiz;

--
-- Name: user_agent_type pk_user_agent_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_agent_type
    ADD CONSTRAINT pk_user_agent_type PRIMARY KEY (user_agent_type_id);


--
-- Name: usr_agnt_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_agnt_tp_txcrts ON user_agent_type USING btree (created_tx_stamp);


--
-- Name: usr_agnt_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_agnt_tp_txstmp ON user_agent_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

