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
-- Name: work_effort_fixed_asset_assign; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_fixed_asset_assign (
    work_effort_id character varying(20) NOT NULL,
    fixed_asset_id character varying(20) NOT NULL,
    status_id character varying(20),
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    availability_status_id character varying(20),
    allocated_cost numeric(18,2),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_fixed_asset_assign OWNER TO ofbiz;

--
-- Name: work_effort_fixed_asset_assign pk_work_effort_fixed_asset_ass; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_fixed_asset_assign
    ADD CONSTRAINT pk_work_effort_fixed_asset_ass PRIMARY KEY (work_effort_id, fixed_asset_id, from_date);


--
-- Name: wkeff_fxdaa_avail; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_fxdaa_avail ON work_effort_fixed_asset_assign USING btree (availability_status_id);


--
-- Name: wkeff_fxdaa_fxas; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_fxdaa_fxas ON work_effort_fixed_asset_assign USING btree (fixed_asset_id);


--
-- Name: wkeff_fxdaa_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_fxdaa_stts ON work_effort_fixed_asset_assign USING btree (status_id);


--
-- Name: wkeff_fxdaa_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_fxdaa_weff ON work_effort_fixed_asset_assign USING btree (work_effort_id);


--
-- Name: wrk_fxd_ast_asn_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_fxd_ast_asn_tp ON work_effort_fixed_asset_assign USING btree (last_updated_tx_stamp);


--
-- Name: wrk_fxd_ast_asn_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_fxd_ast_asn_ts ON work_effort_fixed_asset_assign USING btree (created_tx_stamp);


--
-- Name: work_effort_fixed_asset_assign wkeff_fxdaa_avail; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_fixed_asset_assign
    ADD CONSTRAINT wkeff_fxdaa_avail FOREIGN KEY (availability_status_id) REFERENCES status_item(status_id);


--
-- Name: work_effort_fixed_asset_assign wkeff_fxdaa_fxas; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_fixed_asset_assign
    ADD CONSTRAINT wkeff_fxdaa_fxas FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: work_effort_fixed_asset_assign wkeff_fxdaa_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_fixed_asset_assign
    ADD CONSTRAINT wkeff_fxdaa_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: work_effort_fixed_asset_assign wkeff_fxdaa_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_fixed_asset_assign
    ADD CONSTRAINT wkeff_fxdaa_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

