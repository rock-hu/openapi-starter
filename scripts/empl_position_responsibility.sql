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
-- Name: empl_position_responsibility; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE empl_position_responsibility (
    empl_position_id character varying(20) NOT NULL,
    responsibility_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.empl_position_responsibility OWNER TO ofbiz;

--
-- Name: empl_position_responsibility pk_empl_position_responsibilit; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_responsibility
    ADD CONSTRAINT pk_empl_position_responsibilit PRIMARY KEY (empl_position_id, responsibility_type_id, from_date);


--
-- Name: eml_psn_rspnt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_psn_rspnt_txcs ON empl_position_responsibility USING btree (created_tx_stamp);


--
-- Name: eml_psn_rspnt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_psn_rspnt_txsp ON empl_position_responsibility USING btree (last_updated_tx_stamp);


--
-- Name: empl_psrty_emps; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_psrty_emps ON empl_position_responsibility USING btree (empl_position_id);


--
-- Name: empl_psrty_rytp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_psrty_rytp ON empl_position_responsibility USING btree (responsibility_type_id);


--
-- Name: empl_position_responsibility empl_psrty_emps; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_responsibility
    ADD CONSTRAINT empl_psrty_emps FOREIGN KEY (empl_position_id) REFERENCES empl_position(empl_position_id);


--
-- Name: empl_position_responsibility empl_psrty_rytp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_position_responsibility
    ADD CONSTRAINT empl_psrty_rytp FOREIGN KEY (responsibility_type_id) REFERENCES responsibility_type(responsibility_type_id);


--
-- PostgreSQL database dump complete
--

