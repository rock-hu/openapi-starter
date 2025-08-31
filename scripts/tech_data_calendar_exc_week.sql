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
-- Name: tech_data_calendar_exc_week; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tech_data_calendar_exc_week (
    calendar_id character varying(20) NOT NULL,
    exception_date_start date NOT NULL,
    calendar_week_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tech_data_calendar_exc_week OWNER TO ofbiz;

--
-- Name: tech_data_calendar_exc_week pk_tech_data_calendar_exc_week; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tech_data_calendar_exc_week
    ADD CONSTRAINT pk_tech_data_calendar_exc_week PRIMARY KEY (calendar_id, exception_date_start);


--
-- Name: exc_week_calendar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX exc_week_calendar ON tech_data_calendar_exc_week USING btree (calendar_id);


--
-- Name: exc_week_week; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX exc_week_week ON tech_data_calendar_exc_week USING btree (calendar_week_id);


--
-- Name: tch_clr_exc_wk_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tch_clr_exc_wk_tp ON tech_data_calendar_exc_week USING btree (last_updated_tx_stamp);


--
-- Name: tch_clr_exc_wk_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tch_clr_exc_wk_ts ON tech_data_calendar_exc_week USING btree (created_tx_stamp);


--
-- Name: tech_data_calendar_exc_week exc_week_calendar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tech_data_calendar_exc_week
    ADD CONSTRAINT exc_week_calendar FOREIGN KEY (calendar_id) REFERENCES tech_data_calendar(calendar_id);


--
-- Name: tech_data_calendar_exc_week exc_week_week; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tech_data_calendar_exc_week
    ADD CONSTRAINT exc_week_week FOREIGN KEY (calendar_week_id) REFERENCES tech_data_calendar_week(calendar_week_id);


--
-- PostgreSQL database dump complete
--

