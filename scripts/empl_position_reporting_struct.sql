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
-- Name: empl_position_reporting_struct; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE empl_position_reporting_struct (
    empl_position_id_reporting_to character varying(20) NOT NULL,
    empl_position_id_managed_by character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    comments character varying(255),
    primary_flag character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.empl_position_reporting_struct OWNER TO ofbiz;

--
-- Name: empl_position_reporting_struct pk_empl_position_reporting_str; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_reporting_struct
    ADD CONSTRAINT pk_empl_position_reporting_str PRIMARY KEY (empl_position_id_reporting_to, empl_position_id_managed_by, from_date);


--
-- Name: eml_psn_rpg_stt_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_psn_rpg_stt_tp ON empl_position_reporting_struct USING btree (last_updated_tx_stamp);


--
-- Name: eml_psn_rpg_stt_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_psn_rpg_stt_ts ON empl_position_reporting_struct USING btree (created_tx_stamp);


--
-- Name: empl_psrps_empsm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_psrps_empsm ON empl_position_reporting_struct USING btree (empl_position_id_managed_by);


--
-- Name: empl_psrps_empsr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_psrps_empsr ON empl_position_reporting_struct USING btree (empl_position_id_reporting_to);


--
-- Name: empl_position_reporting_struct empl_psrps_empsm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_reporting_struct
    ADD CONSTRAINT empl_psrps_empsm FOREIGN KEY (empl_position_id_managed_by) REFERENCES empl_position(empl_position_id);


--
-- Name: empl_position_reporting_struct empl_psrps_empsr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_reporting_struct
    ADD CONSTRAINT empl_psrps_empsr FOREIGN KEY (empl_position_id_reporting_to) REFERENCES empl_position(empl_position_id);


--
-- PostgreSQL database dump complete
--

