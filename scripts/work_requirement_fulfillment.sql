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
-- Name: work_requirement_fulfillment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_requirement_fulfillment (
    requirement_id character varying(20) NOT NULL,
    work_effort_id character varying(20) NOT NULL,
    work_req_fulf_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_requirement_fulfillment OWNER TO ofbiz;

--
-- Name: work_requirement_fulfillment pk_work_requirement_fulfillmen; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_requirement_fulfillment
    ADD CONSTRAINT pk_work_requirement_fulfillmen PRIMARY KEY (requirement_id, work_effort_id);


--
-- Name: work_reqfl_req; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX work_reqfl_req ON work_requirement_fulfillment USING btree (requirement_id);


--
-- Name: work_reqfl_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX work_reqfl_weff ON work_requirement_fulfillment USING btree (work_effort_id);


--
-- Name: work_reqfl_wrft; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX work_reqfl_wrft ON work_requirement_fulfillment USING btree (work_req_fulf_type_id);


--
-- Name: wrk_rqt_flflt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_rqt_flflt_txcs ON work_requirement_fulfillment USING btree (created_tx_stamp);


--
-- Name: wrk_rqt_flflt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_rqt_flflt_txsp ON work_requirement_fulfillment USING btree (last_updated_tx_stamp);


--
-- Name: work_requirement_fulfillment work_reqfl_req; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_requirement_fulfillment
    ADD CONSTRAINT work_reqfl_req FOREIGN KEY (requirement_id) REFERENCES requirement(requirement_id);


--
-- Name: work_requirement_fulfillment work_reqfl_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_requirement_fulfillment
    ADD CONSTRAINT work_reqfl_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- Name: work_requirement_fulfillment work_reqfl_wrft; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_requirement_fulfillment
    ADD CONSTRAINT work_reqfl_wrft FOREIGN KEY (work_req_fulf_type_id) REFERENCES work_req_fulf_type(work_req_fulf_type_id);


--
-- PostgreSQL database dump complete
--

