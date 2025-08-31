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
-- Name: work_effort_skill_standard; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_skill_standard (
    work_effort_id character varying(20) NOT NULL,
    skill_type_id character varying(20) NOT NULL,
    estimated_num_people double precision,
    estimated_duration double precision,
    estimated_cost numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_skill_standard OWNER TO ofbiz;

--
-- Name: work_effort_skill_standard pk_work_effort_skill_standard; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_skill_standard
    ADD CONSTRAINT pk_work_effort_skill_standard PRIMARY KEY (work_effort_id, skill_type_id);


--
-- Name: wkeff_sklstd_sktp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_sklstd_sktp ON work_effort_skill_standard USING btree (skill_type_id);


--
-- Name: wkeff_sklstd_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_sklstd_weff ON work_effort_skill_standard USING btree (work_effort_id);


--
-- Name: wrk_eft_skl_std_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_skl_std_tp ON work_effort_skill_standard USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_skl_std_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_skl_std_ts ON work_effort_skill_standard USING btree (created_tx_stamp);


--
-- Name: work_effort_skill_standard wkeff_sklstd_sktp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_skill_standard
    ADD CONSTRAINT wkeff_sklstd_sktp FOREIGN KEY (skill_type_id) REFERENCES skill_type(skill_type_id);


--
-- Name: work_effort_skill_standard wkeff_sklstd_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_skill_standard
    ADD CONSTRAINT wkeff_sklstd_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

