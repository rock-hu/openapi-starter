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
-- Name: facility_calendar; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_calendar (
    facility_id character varying(20) NOT NULL,
    calendar_id character varying(20) NOT NULL,
    facility_calendar_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_calendar OWNER TO ofbiz;

--
-- Name: facility_calendar pk_facility_calendar; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_calendar
    ADD CONSTRAINT pk_facility_calendar PRIMARY KEY (facility_id, calendar_id, facility_calendar_type_id, from_date);


--
-- Name: facility_cal_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_cal_fac ON facility_calendar USING btree (facility_id);


--
-- Name: facility_cal_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_cal_type ON facility_calendar USING btree (facility_calendar_type_id);


--
-- Name: fclt_clndr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_clndr_txcrts ON facility_calendar USING btree (created_tx_stamp);


--
-- Name: fclt_clndr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_clndr_txstmp ON facility_calendar USING btree (last_updated_tx_stamp);


--
-- Name: facility_calendar facility_cal_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_calendar
    ADD CONSTRAINT facility_cal_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: facility_calendar facility_cal_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_calendar
    ADD CONSTRAINT facility_cal_type FOREIGN KEY (facility_calendar_type_id) REFERENCES facility_calendar_type(facility_calendar_type_id);


--
-- PostgreSQL database dump complete
--

