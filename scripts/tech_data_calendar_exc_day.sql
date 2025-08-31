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
-- Name: tech_data_calendar_exc_day; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tech_data_calendar_exc_day (
    calendar_id character varying(20) NOT NULL,
    exception_date_start_time timestamp with time zone NOT NULL,
    exception_capacity numeric(18,6),
    used_capacity numeric(18,6),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tech_data_calendar_exc_day OWNER TO ofbiz;

--
-- Name: tech_data_calendar_exc_day pk_tech_data_calendar_exc_day; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tech_data_calendar_exc_day
    ADD CONSTRAINT pk_tech_data_calendar_exc_day PRIMARY KEY (calendar_id, exception_date_start_time);


--
-- Name: exc_day_calendar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX exc_day_calendar ON tech_data_calendar_exc_day USING btree (calendar_id);


--
-- Name: tch_clr_exc_d_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tch_clr_exc_d_tp ON tech_data_calendar_exc_day USING btree (last_updated_tx_stamp);


--
-- Name: tch_clr_exc_d_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tch_clr_exc_d_ts ON tech_data_calendar_exc_day USING btree (created_tx_stamp);


--
-- Name: tech_data_calendar_exc_day exc_day_calendar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tech_data_calendar_exc_day
    ADD CONSTRAINT exc_day_calendar FOREIGN KEY (calendar_id) REFERENCES tech_data_calendar(calendar_id);


--
-- PostgreSQL database dump complete
--

