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
-- Name: tech_data_calendar; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tech_data_calendar (
    calendar_id character varying(20) NOT NULL,
    description character varying(255),
    calendar_week_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tech_data_calendar OWNER TO ofbiz;

--
-- Name: tech_data_calendar pk_tech_data_calendar; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tech_data_calendar
    ADD CONSTRAINT pk_tech_data_calendar PRIMARY KEY (calendar_id);


--
-- Name: calendar_week; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX calendar_week ON tech_data_calendar USING btree (calendar_week_id);


--
-- Name: tch_dt_clnr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tch_dt_clnr_txcrts ON tech_data_calendar USING btree (created_tx_stamp);


--
-- Name: tch_dt_clnr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tch_dt_clnr_txstmp ON tech_data_calendar USING btree (last_updated_tx_stamp);


--
-- Name: tech_data_calendar calendar_week; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tech_data_calendar
    ADD CONSTRAINT calendar_week FOREIGN KEY (calendar_week_id) REFERENCES tech_data_calendar_week(calendar_week_id);


--
-- PostgreSQL database dump complete
--

