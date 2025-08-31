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
-- Name: facility_location_geo_point; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE facility_location_geo_point (
    facility_id character varying(20) NOT NULL,
    location_seq_id character varying(20) NOT NULL,
    geo_point_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.facility_location_geo_point OWNER TO ofbiz;

--
-- Name: facility_location_geo_point pk_facility_location_geo_point; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_location_geo_point
    ADD CONSTRAINT pk_facility_location_geo_point PRIMARY KEY (facility_id, location_seq_id, geo_point_id, from_date);


--
-- Name: faclocgeopt_facloc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX faclocgeopt_facloc ON facility_location_geo_point USING btree (facility_id, location_seq_id);


--
-- Name: faclocgeopt_geopt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX faclocgeopt_geopt ON facility_location_geo_point USING btree (geo_point_id);


--
-- Name: fct_lcn_g_pnt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_lcn_g_pnt_txcs ON facility_location_geo_point USING btree (created_tx_stamp);


--
-- Name: fct_lcn_g_pnt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fct_lcn_g_pnt_txsp ON facility_location_geo_point USING btree (last_updated_tx_stamp);


--
-- Name: facility_location_geo_point faclocgeopt_facloc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_location_geo_point
    ADD CONSTRAINT faclocgeopt_facloc FOREIGN KEY (facility_id, location_seq_id) REFERENCES facility_location(facility_id, location_seq_id);


--
-- Name: facility_location_geo_point faclocgeopt_geopt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY facility_location_geo_point
    ADD CONSTRAINT faclocgeopt_geopt FOREIGN KEY (geo_point_id) REFERENCES geo_point(geo_point_id);


--
-- PostgreSQL database dump complete
--

