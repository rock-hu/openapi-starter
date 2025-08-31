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
-- Name: facility; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility (
    facility_id character varying(20) NOT NULL,
    facility_type_id character varying(20),
    parent_facility_id character varying(20),
    owner_party_id character varying(20),
    default_inventory_item_type_id character varying(20),
    facility_name character varying(100),
    primary_facility_group_id character varying(20),
    square_footage numeric(20,0),
    facility_size numeric(18,6),
    facility_size_uom_id character varying(20),
    product_store_id character varying(20),
    default_days_to_ship numeric(20,0),
    opened_date timestamp with time zone,
    closed_date timestamp with time zone,
    description character varying(255),
    default_dimension_uom_id character varying(20),
    default_weight_uom_id character varying(20),
    geo_point_id character varying(20),
    facility_level numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility OWNER TO ofbiz;

--
-- Name: facility pk_facility; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT pk_facility PRIMARY KEY (facility_id);


--
-- Name: fac_def_duom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fac_def_duom ON facility USING btree (default_dimension_uom_id);


--
-- Name: fac_def_wuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fac_def_wuom ON facility USING btree (default_weight_uom_id);


--
-- Name: fac_invitm_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fac_invitm_type ON facility USING btree (default_inventory_item_type_id);


--
-- Name: facility_fctyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_fctyp ON facility USING btree (facility_type_id);


--
-- Name: facility_geopt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_geopt ON facility USING btree (geo_point_id);


--
-- Name: facility_owner; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_owner ON facility USING btree (owner_party_id);


--
-- Name: facility_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_parent ON facility USING btree (parent_facility_id);


--
-- Name: facility_pgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_pgrp ON facility USING btree (primary_facility_group_id);


--
-- Name: facility_suom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_suom ON facility USING btree (facility_size_uom_id);


--
-- Name: facility_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_txcrts ON facility USING btree (created_tx_stamp);


--
-- Name: facility_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_txstmp ON facility USING btree (last_updated_tx_stamp);


--
-- Name: facility fac_def_duom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT fac_def_duom FOREIGN KEY (default_dimension_uom_id) REFERENCES uom(uom_id);


--
-- Name: facility fac_def_wuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT fac_def_wuom FOREIGN KEY (default_weight_uom_id) REFERENCES uom(uom_id);


--
-- Name: facility fac_invitm_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT fac_invitm_type FOREIGN KEY (default_inventory_item_type_id) REFERENCES inventory_item_type(inventory_item_type_id);


--
-- Name: facility facility_fctyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT facility_fctyp FOREIGN KEY (facility_type_id) REFERENCES facility_type(facility_type_id);


--
-- Name: facility facility_geopt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT facility_geopt FOREIGN KEY (geo_point_id) REFERENCES geo_point(geo_point_id);


--
-- Name: facility facility_owner; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT facility_owner FOREIGN KEY (owner_party_id) REFERENCES party(party_id);


--
-- Name: facility facility_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT facility_parent FOREIGN KEY (parent_facility_id) REFERENCES facility(facility_id);


--
-- Name: facility facility_pgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT facility_pgrp FOREIGN KEY (primary_facility_group_id) REFERENCES facility_group(facility_group_id);


--
-- Name: facility facility_suom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility
    ADD CONSTRAINT facility_suom FOREIGN KEY (facility_size_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

