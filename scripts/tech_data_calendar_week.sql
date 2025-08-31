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
-- Name: tech_data_calendar_week; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tech_data_calendar_week (
    calendar_week_id character varying(20) NOT NULL,
    description character varying(255),
    monday_start_time time without time zone,
    monday_capacity double precision,
    tuesday_start_time time without time zone,
    tuesday_capacity double precision,
    wednesday_start_time time without time zone,
    wednesday_capacity double precision,
    thursday_start_time time without time zone,
    thursday_capacity double precision,
    friday_start_time time without time zone,
    friday_capacity double precision,
    saturday_start_time time without time zone,
    saturday_capacity double precision,
    sunday_start_time time without time zone,
    sunday_capacity double precision,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tech_data_calendar_week OWNER TO ofbiz;

--
-- Name: tech_data_calendar_week pk_tech_data_calendar_week; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tech_data_calendar_week
    ADD CONSTRAINT pk_tech_data_calendar_week PRIMARY KEY (calendar_week_id);


--
-- Name: tch_dt_clr_wk_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tch_dt_clr_wk_txcs ON tech_data_calendar_week USING btree (created_tx_stamp);


--
-- Name: tch_dt_clr_wk_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tch_dt_clr_wk_txsp ON tech_data_calendar_week USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

