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
-- Name: fixed_asset; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset (
    fixed_asset_id character varying(20) NOT NULL,
    fixed_asset_type_id character varying(20),
    parent_fixed_asset_id character varying(20),
    instance_of_product_id character varying(20),
    class_enum_id character varying(20),
    party_id character varying(20),
    role_type_id character varying(20),
    fixed_asset_name character varying(100),
    acquire_order_id character varying(20),
    acquire_order_item_seq_id character varying(20),
    date_acquired timestamp with time zone,
    date_last_serviced timestamp with time zone,
    date_next_service timestamp with time zone,
    expected_end_of_life date,
    actual_end_of_life date,
    production_capacity numeric(18,6),
    uom_id character varying(20),
    calendar_id character varying(20),
    serial_number character varying(255),
    located_at_facility_id character varying(20),
    located_at_location_seq_id character varying(20),
    salvage_value numeric(18,2),
    depreciation numeric(18,2),
    purchase_cost numeric(18,2),
    purchase_cost_uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset OWNER TO ofbiz;

--
-- Name: fixed_asset pk_fixed_asset; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT pk_fixed_asset PRIMARY KEY (fixed_asset_id);


--
-- Name: fixed_asset_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixed_asset_txcrts ON fixed_asset USING btree (created_tx_stamp);


--
-- Name: fixed_asset_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixed_asset_txstmp ON fixed_asset USING btree (last_updated_tx_stamp);


--
-- Name: fixedast_calendar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_calendar ON fixed_asset USING btree (calendar_id);


--
-- Name: fixedast_clsenm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_clsenm ON fixed_asset USING btree (class_enum_id);


--
-- Name: fixedast_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_fac ON fixed_asset USING btree (located_at_facility_id);


--
-- Name: fixedast_ioprod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_ioprod ON fixed_asset USING btree (instance_of_product_id);


--
-- Name: fixedast_ordhdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_ordhdr ON fixed_asset USING btree (acquire_order_id);


--
-- Name: fixedast_orditm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_orditm ON fixed_asset USING btree (acquire_order_id, acquire_order_item_seq_id);


--
-- Name: fixedast_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_par ON fixed_asset USING btree (parent_fixed_asset_id);


--
-- Name: fixedast_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_party ON fixed_asset USING btree (party_id);


--
-- Name: fixedast_roletyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_roletyp ON fixed_asset USING btree (role_type_id);


--
-- Name: fixedast_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_type ON fixed_asset USING btree (fixed_asset_type_id);


--
-- Name: fixedast_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixedast_uom ON fixed_asset USING btree (uom_id);


--
-- Name: fixed_asset fixedast_calendar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_calendar FOREIGN KEY (calendar_id) REFERENCES tech_data_calendar(calendar_id);


--
-- Name: fixed_asset fixedast_clsenm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_clsenm FOREIGN KEY (class_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: fixed_asset fixedast_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_fac FOREIGN KEY (located_at_facility_id) REFERENCES facility(facility_id);


--
-- Name: fixed_asset fixedast_ioprod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_ioprod FOREIGN KEY (instance_of_product_id) REFERENCES product(product_id);


--
-- Name: fixed_asset fixedast_ordhdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_ordhdr FOREIGN KEY (acquire_order_id) REFERENCES order_header(order_id);


--
-- Name: fixed_asset fixedast_orditm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_orditm FOREIGN KEY (acquire_order_id, acquire_order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: fixed_asset fixedast_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_par FOREIGN KEY (parent_fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: fixed_asset fixedast_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: fixed_asset fixedast_roletyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_roletyp FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: fixed_asset fixedast_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_type FOREIGN KEY (fixed_asset_type_id) REFERENCES fixed_asset_type(fixed_asset_type_id);


--
-- Name: fixed_asset fixedast_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset
    ADD CONSTRAINT fixedast_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

