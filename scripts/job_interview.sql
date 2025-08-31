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
-- Name: job_interview; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE job_interview (
    job_interview_id character varying(20) NOT NULL,
    job_interviewee_party_id character varying(20),
    job_requisition_id character varying(20),
    job_interviewer_party_id character varying(20),
    job_interview_type_id character varying(20),
    grade_secured_enum_id character varying(20),
    job_interview_result character varying(20),
    job_interview_date date,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.job_interview OWNER TO ofbiz;

--
-- Name: job_interview pk_job_interview; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_interview
    ADD CONSTRAINT pk_job_interview PRIMARY KEY (job_interview_id);


--
-- Name: jb_intrvw_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jb_intrvw_txcrts ON job_interview USING btree (created_tx_stamp);


--
-- Name: jb_intrvw_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jb_intrvw_txstmp ON job_interview USING btree (last_updated_tx_stamp);


--
-- Name: job_intw_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_intw_enum ON job_interview USING btree (grade_secured_enum_id);


--
-- Name: job_intw_iepr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_intw_iepr ON job_interview USING btree (job_interviewee_party_id);


--
-- Name: job_intw_intyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_intw_intyp ON job_interview USING btree (job_interview_type_id);


--
-- Name: job_intw_irpr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_intw_irpr ON job_interview USING btree (job_interviewer_party_id);


--
-- Name: job_intw_jbreq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_intw_jbreq ON job_interview USING btree (job_requisition_id);


--
-- Name: job_interview job_intw_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_interview
    ADD CONSTRAINT job_intw_enum FOREIGN KEY (grade_secured_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: job_interview job_intw_iepr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_interview
    ADD CONSTRAINT job_intw_iepr FOREIGN KEY (job_interviewee_party_id) REFERENCES party(party_id);


--
-- Name: job_interview job_intw_intyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_interview
    ADD CONSTRAINT job_intw_intyp FOREIGN KEY (job_interview_type_id) REFERENCES job_interview_type(job_interview_type_id);


--
-- Name: job_interview job_intw_irpr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_interview
    ADD CONSTRAINT job_intw_irpr FOREIGN KEY (job_interviewer_party_id) REFERENCES party(party_id);


--
-- Name: job_interview job_intw_jbreq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_interview
    ADD CONSTRAINT job_intw_jbreq FOREIGN KEY (job_requisition_id) REFERENCES job_requisition(job_requisition_id);


--
-- PostgreSQL database dump complete
--

