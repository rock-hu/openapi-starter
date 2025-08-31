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
-- Name: work_effort_party_assignment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_party_assignment (
    work_effort_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    assigned_by_user_login_id character varying(255),
    status_id character varying(20),
    status_date_time timestamp with time zone,
    expectation_enum_id character varying(20),
    delegate_reason_enum_id character varying(20),
    facility_id character varying(20),
    comments character varying(255),
    must_rsvp character(1),
    availability_status_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_party_assignment OWNER TO ofbiz;

--
-- Name: work_effort_party_assignment pk_work_effort_party_assignmen; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_party_assignment
    ADD CONSTRAINT pk_work_effort_party_assignmen PRIMARY KEY (work_effort_id, party_id, role_type_id, from_date);


--
-- Name: wkeff_pa_abusrlog; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_pa_abusrlog ON work_effort_party_assignment USING btree (assigned_by_user_login_id);


--
-- Name: wkeff_pa_avstts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_pa_avstts ON work_effort_party_assignment USING btree (availability_status_id);


--
-- Name: wkeff_pa_delr_enm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_pa_delr_enm ON work_effort_party_assignment USING btree (delegate_reason_enum_id);


--
-- Name: wkeff_pa_exp_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_pa_exp_enum ON work_effort_party_assignment USING btree (expectation_enum_id);


--
-- Name: wkeff_pa_facility; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_pa_facility ON work_effort_party_assignment USING btree (facility_id);


--
-- Name: wkeff_pa_prty_role; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_pa_prty_role ON work_effort_party_assignment USING btree (party_id, role_type_id);


--
-- Name: wkeff_pa_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_pa_stts ON work_effort_party_assignment USING btree (status_id);


--
-- Name: wkeff_pa_we; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_pa_we ON work_effort_party_assignment USING btree (work_effort_id);


--
-- Name: wrk_eft_prt_ast_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_prt_ast_tp ON work_effort_party_assignment USING btree (last_updated_tx_stamp);


--
-- Name: wrk_eft_prt_ast_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_eft_prt_ast_ts ON work_effort_party_assignment USING btree (created_tx_stamp);


--
-- Name: work_effort_party_assignment wkeff_pa_abusrlog; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_party_assignment
    ADD CONSTRAINT wkeff_pa_abusrlog FOREIGN KEY (assigned_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: work_effort_party_assignment wkeff_pa_avstts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_party_assignment
    ADD CONSTRAINT wkeff_pa_avstts FOREIGN KEY (availability_status_id) REFERENCES status_item(status_id);


--
-- Name: work_effort_party_assignment wkeff_pa_delr_enm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_party_assignment
    ADD CONSTRAINT wkeff_pa_delr_enm FOREIGN KEY (delegate_reason_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: work_effort_party_assignment wkeff_pa_exp_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_party_assignment
    ADD CONSTRAINT wkeff_pa_exp_enum FOREIGN KEY (expectation_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: work_effort_party_assignment wkeff_pa_facility; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_party_assignment
    ADD CONSTRAINT wkeff_pa_facility FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: work_effort_party_assignment wkeff_pa_prty_role; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_party_assignment
    ADD CONSTRAINT wkeff_pa_prty_role FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: work_effort_party_assignment wkeff_pa_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_party_assignment
    ADD CONSTRAINT wkeff_pa_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: work_effort_party_assignment wkeff_pa_we; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_party_assignment
    ADD CONSTRAINT wkeff_pa_we FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

