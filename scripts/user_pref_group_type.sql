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
-- Name: user_pref_group_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE user_pref_group_type (
    user_pref_group_type_id character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.user_pref_group_type OWNER TO ofbiz;

--
-- Name: user_pref_group_type pk_user_pref_group_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY user_pref_group_type
    ADD CONSTRAINT pk_user_pref_group_type PRIMARY KEY (user_pref_group_type_id);


--
-- Name: usr_prf_grp_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_prf_grp_tp_txp ON user_pref_group_type USING btree (last_updated_tx_stamp);


--
-- Name: usr_prf_grp_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX usr_prf_grp_tp_txs ON user_pref_group_type USING btree (created_tx_stamp);


--
-- PostgreSQL database dump complete
--

