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
-- Name: facility_location; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_location (
    facility_id character varying(20) NOT NULL,
    location_seq_id character varying(20) NOT NULL,
    location_type_enum_id character varying(20),
    area_id character varying(20),
    aisle_id character varying(20),
    section_id character varying(20),
    level_id character varying(20),
    position_id character varying(20),
    geo_point_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_location OWNER TO ofbiz;

--
-- Name: facility_location pk_facility_location; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_location
    ADD CONSTRAINT pk_facility_location PRIMARY KEY (facility_id, location_seq_id);


--
-- Name: facility_loc_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_loc_fac ON facility_location USING btree (facility_id);


--
-- Name: facility_loc_geopt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_loc_geopt ON facility_location USING btree (geo_point_id);


--
-- Name: facility_loc_tenm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX facility_loc_tenm ON facility_location USING btree (location_type_enum_id);


--
-- Name: fclt_lctn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_lctn_txcrts ON facility_location USING btree (created_tx_stamp);


--
-- Name: fclt_lctn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fclt_lctn_txstmp ON facility_location USING btree (last_updated_tx_stamp);


--
-- Name: facility_location facility_loc_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_location
    ADD CONSTRAINT facility_loc_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: facility_location facility_loc_geopt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_location
    ADD CONSTRAINT facility_loc_geopt FOREIGN KEY (geo_point_id) REFERENCES geo_point(geo_point_id);


--
-- Name: facility_location facility_loc_tenm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_location
    ADD CONSTRAINT facility_loc_tenm FOREIGN KEY (location_type_enum_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

