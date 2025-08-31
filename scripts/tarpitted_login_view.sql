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
-- Name: tarpitted_login_view; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tarpitted_login_view (
    view_name_id character varying(60) NOT NULL,
    user_login_id character varying(255) NOT NULL,
    tarpit_release_date_time numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tarpitted_login_view OWNER TO ofbiz;

--
-- Name: tarpitted_login_view pk_tarpitted_login_view; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tarpitted_login_view
    ADD CONSTRAINT pk_tarpitted_login_view PRIMARY KEY (view_name_id, user_login_id);


--
-- Name: trptd_lgn_vw_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trptd_lgn_vw_txcrs ON tarpitted_login_view USING btree (created_tx_stamp);


--
-- Name: trptd_lgn_vw_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trptd_lgn_vw_txstp ON tarpitted_login_view USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

