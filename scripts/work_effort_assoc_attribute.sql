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
-- Name: work_effort_assoc_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_assoc_attribute (
    work_effort_id_from character varying(20) NOT NULL,
    work_effort_id_to character varying(20) NOT NULL,
    work_effort_assoc_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_assoc_attribute OWNER TO ofbiz;

--
-- Name: work_effort_assoc_attribute pk_work_effort_assoc_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_assoc_attribute
    ADD CONSTRAINT pk_work_effort_assoc_attribute PRIMARY KEY (work_effort_id_from, work_effort_id_to, work_effort_assoc_type_id, attr_name);


--
-- Name: wk_effrtassc_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrtassc_attr ON work_effort_assoc_attribute USING btree (work_effort_id_from, work_effort_id_to, work_effort_assoc_type_id, from_date);


--
-- Name: wrk_eft_asc_att_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_asc_att_tp ON work_effort_assoc_attribute USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_asc_att_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_asc_att_ts ON work_effort_assoc_attribute USING btree (created_tx_stamp);


--
-- Name: work_effort_assoc_attribute wk_effrtassc_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_assoc_attribute
    ADD CONSTRAINT wk_effrtassc_attr FOREIGN KEY (work_effort_id_from, work_effort_id_to, work_effort_assoc_type_id, from_date) REFERENCES work_effort_assoc(work_effort_id_from, work_effort_id_to, work_effort_assoc_type_id, from_date);


--
-- PostgreSQL database dump complete
--

