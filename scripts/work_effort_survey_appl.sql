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
-- Name: work_effort_survey_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_survey_appl (
    work_effort_id character varying(20) NOT NULL,
    survey_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_survey_appl OWNER TO ofbiz;

--
-- Name: work_effort_survey_appl pk_work_effort_survey_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_survey_appl
    ADD CONSTRAINT pk_work_effort_survey_appl PRIMARY KEY (work_effort_id, survey_id, from_date);


--
-- Name: wkef_survapl_pssa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkef_survapl_pssa ON work_effort_survey_appl USING btree (survey_id);


--
-- Name: wkef_survapl_svy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkef_survapl_svy ON work_effort_survey_appl USING btree (survey_id);


--
-- Name: wkef_survapl_wke; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkef_survapl_wke ON work_effort_survey_appl USING btree (work_effort_id);


--
-- Name: wrk_eft_srv_apl_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_srv_apl_tp ON work_effort_survey_appl USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_srv_apl_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_srv_apl_ts ON work_effort_survey_appl USING btree (created_tx_stamp);


--
-- Name: work_effort_survey_appl wkef_survapl_pssa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_survey_appl
    ADD CONSTRAINT wkef_survapl_pssa FOREIGN KEY (survey_id) REFERENCES product_store_survey_appl(product_store_survey_id);


--
-- Name: work_effort_survey_appl wkef_survapl_svy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_survey_appl
    ADD CONSTRAINT wkef_survapl_svy FOREIGN KEY (survey_id) REFERENCES survey(survey_id);


--
-- Name: work_effort_survey_appl wkef_survapl_wke; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_survey_appl
    ADD CONSTRAINT wkef_survapl_wke FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

