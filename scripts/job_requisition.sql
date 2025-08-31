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
-- Name: job_requisition; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE job_requisition (
    job_requisition_id character varying(20) NOT NULL,
    duration_months numeric(20,0),
    age numeric(20,0),
    gender character(1),
    experience_months numeric(20,0),
    experience_years numeric(20,0),
    qualification character varying(60),
    job_location character varying(20),
    skill_type_id character varying(20),
    no_of_resources numeric(20,0),
    job_posting_type_enum_id character varying(20),
    job_requisition_date date,
    exam_type_enum_id character varying(20),
    required_on_date date,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.job_requisition OWNER TO ofbiz;

--
-- Name: job_requisition pk_job_requisition; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_requisition
    ADD CONSTRAINT pk_job_requisition PRIMARY KEY (job_requisition_id);


--
-- Name: jb_rqstn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jb_rqstn_txcrts ON job_requisition USING btree (created_tx_stamp);


--
-- Name: jb_rqstn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jb_rqstn_txstmp ON job_requisition USING btree (last_updated_tx_stamp);


--
-- Name: job_req_enumexm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_req_enumexm ON job_requisition USING btree (exam_type_enum_id);


--
-- Name: job_req_enumjbp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_req_enumjbp ON job_requisition USING btree (job_posting_type_enum_id);


--
-- Name: job_req_sktyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_req_sktyp ON job_requisition USING btree (skill_type_id);


--
-- Name: job_requisition job_req_enumexm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_requisition
    ADD CONSTRAINT job_req_enumexm FOREIGN KEY (exam_type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: job_requisition job_req_enumjbp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_requisition
    ADD CONSTRAINT job_req_enumjbp FOREIGN KEY (job_posting_type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: job_requisition job_req_sktyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_requisition
    ADD CONSTRAINT job_req_sktyp FOREIGN KEY (skill_type_id) REFERENCES skill_type(skill_type_id);


--
-- PostgreSQL database dump complete
--

