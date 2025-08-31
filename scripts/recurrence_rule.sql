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
-- Name: recurrence_rule; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE recurrence_rule (
    recurrence_rule_id character varying(20) NOT NULL,
    frequency character varying(60),
    until_date_time timestamp with time zone,
    count_number numeric(20,0),
    interval_number numeric(20,0),
    by_second_list text,
    by_minute_list text,
    by_hour_list text,
    by_day_list text,
    by_month_day_list text,
    by_year_day_list text,
    by_week_no_list text,
    by_month_list text,
    by_set_pos_list text,
    week_start character varying(60),
    x_name text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.recurrence_rule OWNER TO ofbiz;

--
-- Name: recurrence_rule pk_recurrence_rule; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY recurrence_rule
    ADD CONSTRAINT pk_recurrence_rule PRIMARY KEY (recurrence_rule_id);


--
-- Name: rcrrnc_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rcrrnc_rl_txcrts ON recurrence_rule USING btree (created_tx_stamp);


--
-- Name: rcrrnc_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rcrrnc_rl_txstmp ON recurrence_rule USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

