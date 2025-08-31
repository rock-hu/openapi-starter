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
-- Name: work_effort; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort (
    work_effort_id character varying(20) NOT NULL,
    work_effort_type_id character varying(20),
    current_status_id character varying(20),
    last_status_update timestamp with time zone,
    work_effort_purpose_type_id character varying(20),
    work_effort_parent_id character varying(20),
    scope_enum_id character varying(20),
    priority numeric(20,0),
    percent_complete numeric(20,0),
    work_effort_name character varying(100),
    show_as_enum_id character varying(20),
    send_notification_email character(1),
    description character varying(255),
    location_desc character varying(255),
    estimated_start_date timestamp with time zone,
    estimated_completion_date timestamp with time zone,
    actual_start_date timestamp with time zone,
    actual_completion_date timestamp with time zone,
    estimated_milli_seconds double precision,
    estimated_setup_millis double precision,
    estimate_calc_method character varying(20),
    actual_milli_seconds double precision,
    actual_setup_millis double precision,
    total_milli_seconds_allowed double precision,
    total_money_allowed numeric(18,2),
    money_uom_id character varying(20),
    special_terms character varying(255),
    time_transparency numeric(20,0),
    universal_id character varying(60),
    source_reference_id character varying(60),
    fixed_asset_id character varying(20),
    facility_id character varying(20),
    info_url character varying(255),
    recurrence_info_id character varying(20),
    temp_expr_id character varying(20),
    runtime_data_id character varying(20),
    note_id character varying(20),
    service_loader_name character varying(100),
    quantity_to_produce numeric(18,6),
    quantity_produced numeric(18,6),
    quantity_rejected numeric(18,6),
    reserv_persons numeric(18,6),
    reserv2nd_p_p_perc numeric(18,6),
    reserv_nth_p_p_perc numeric(18,6),
    accommodation_map_id character varying(20),
    accommodation_spot_id character varying(20),
    revision_number numeric(20,0),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort OWNER TO ofbiz;

--
-- Name: work_effort pk_work_effort; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT pk_work_effort PRIMARY KEY (work_effort_id);


--
-- Name: wk_effrt_acc_map; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_acc_map ON work_effort USING btree (accommodation_map_id);


--
-- Name: wk_effrt_acc_spot; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_acc_spot ON work_effort USING btree (accommodation_spot_id);


--
-- Name: wk_effrt_curstts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_curstts ON work_effort USING btree (current_status_id);


--
-- Name: wk_effrt_cus_met; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_cus_met ON work_effort USING btree (estimate_calc_method);


--
-- Name: wk_effrt_facility; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_facility ON work_effort USING btree (facility_id);


--
-- Name: wk_effrt_fxdasst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_fxdasst ON work_effort USING btree (fixed_asset_id);


--
-- Name: wk_effrt_mon_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_mon_uom ON work_effort USING btree (money_uom_id);


--
-- Name: wk_effrt_note; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_note ON work_effort USING btree (note_id);


--
-- Name: wk_effrt_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_parent ON work_effort USING btree (work_effort_parent_id);


--
-- Name: wk_effrt_prptyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_prptyp ON work_effort USING btree (work_effort_purpose_type_id);


--
-- Name: wk_effrt_recinfo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_recinfo ON work_effort USING btree (recurrence_info_id);


--
-- Name: wk_effrt_rntmdta; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_rntmdta ON work_effort USING btree (runtime_data_id);


--
-- Name: wk_effrt_sc_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_sc_enum ON work_effort USING btree (scope_enum_id);


--
-- Name: wk_effrt_tempexpr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_tempexpr ON work_effort USING btree (temp_expr_id);


--
-- Name: wk_effrt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wk_effrt_type ON work_effort USING btree (work_effort_type_id);


--
-- Name: work_effort_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX work_effort_txcrts ON work_effort USING btree (created_tx_stamp);


--
-- Name: work_effort_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX work_effort_txstmp ON work_effort USING btree (last_updated_tx_stamp);


--
-- Name: work_effort wk_effrt_acc_map; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_acc_map FOREIGN KEY (accommodation_map_id) REFERENCES accommodation_map(accommodation_map_id);


--
-- Name: work_effort wk_effrt_acc_spot; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_acc_spot FOREIGN KEY (accommodation_spot_id) REFERENCES accommodation_spot(accommodation_spot_id);


--
-- Name: work_effort wk_effrt_curstts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_curstts FOREIGN KEY (current_status_id) REFERENCES status_item(status_id);


--
-- Name: work_effort wk_effrt_cus_met; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_cus_met FOREIGN KEY (estimate_calc_method) REFERENCES custom_method(custom_method_id);


--
-- Name: work_effort wk_effrt_facility; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_facility FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: work_effort wk_effrt_fxdasst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_fxdasst FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: work_effort wk_effrt_mon_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_mon_uom FOREIGN KEY (money_uom_id) REFERENCES uom(uom_id);


--
-- Name: work_effort wk_effrt_note; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_note FOREIGN KEY (note_id) REFERENCES note_data(note_id);


--
-- Name: work_effort wk_effrt_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_parent FOREIGN KEY (work_effort_parent_id) REFERENCES work_effort(work_effort_id);


--
-- Name: work_effort wk_effrt_prptyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_prptyp FOREIGN KEY (work_effort_purpose_type_id) REFERENCES work_effort_purpose_type(work_effort_purpose_type_id);


--
-- Name: work_effort wk_effrt_recinfo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_recinfo FOREIGN KEY (recurrence_info_id) REFERENCES recurrence_info(recurrence_info_id);


--
-- Name: work_effort wk_effrt_rntmdta; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_rntmdta FOREIGN KEY (runtime_data_id) REFERENCES runtime_data(runtime_data_id);


--
-- Name: work_effort wk_effrt_sc_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_sc_enum FOREIGN KEY (scope_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: work_effort wk_effrt_tempexpr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_tempexpr FOREIGN KEY (temp_expr_id) REFERENCES temporal_expression(temp_expr_id);


--
-- Name: work_effort wk_effrt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort
    ADD CONSTRAINT wk_effrt_type FOREIGN KEY (work_effort_type_id) REFERENCES work_effort_type(work_effort_type_id);


--
-- PostgreSQL database dump complete
--

