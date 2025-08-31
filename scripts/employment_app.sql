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
-- Name: employment_app; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE employment_app (
    application_id character varying(20) NOT NULL,
    empl_position_id character varying(20),
    status_id character varying(20),
    employment_app_source_type_id character varying(20),
    applying_party_id character varying(20),
    referred_by_party_id character varying(20),
    application_date timestamp with time zone,
    approver_party_id character varying(20),
    job_requisition_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.employment_app OWNER TO ofbiz;

--
-- Name: employment_app pk_employment_app; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment_app
    ADD CONSTRAINT pk_employment_app PRIMARY KEY (application_id);


--
-- Name: emplmnt_app_aper; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emplmnt_app_aper ON employment_app USING btree (approver_party_id);


--
-- Name: emplmnt_app_jbrq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emplmnt_app_jbrq ON employment_app USING btree (job_requisition_id);


--
-- Name: emplmnt_app_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emplmnt_app_txcrts ON employment_app USING btree (created_tx_stamp);


--
-- Name: emplmnt_app_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emplmnt_app_txstmp ON employment_app USING btree (last_updated_tx_stamp);


--
-- Name: employment_app emplmnt_app_aper; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment_app
    ADD CONSTRAINT emplmnt_app_aper FOREIGN KEY (approver_party_id) REFERENCES party(party_id);


--
-- Name: employment_app emplmnt_app_jbrq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment_app
    ADD CONSTRAINT emplmnt_app_jbrq FOREIGN KEY (job_requisition_id) REFERENCES job_requisition(job_requisition_id);


--
-- PostgreSQL database dump complete
--

