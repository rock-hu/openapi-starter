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
-- Name: geo_point; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE geo_point (
    geo_point_id character varying(20) NOT NULL,
    geo_point_type_enum_id character varying(20),
    description character varying(255),
    data_source_id character varying(20),
    latitude numeric(18,6) NOT NULL,
    longitude numeric(18,6) NOT NULL,
    elevation numeric(18,6),
    elevation_uom_id character varying(20),
    information character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.geo_point OWNER TO ofbiz;

--
-- Name: geo_point pk_geo_point; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo_point
    ADD CONSTRAINT pk_geo_point PRIMARY KEY (geo_point_id);


--
-- Name: geo_point_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_point_txcrts ON geo_point USING btree (created_tx_stamp);


--
-- Name: geo_point_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geo_point_txstmp ON geo_point USING btree (last_updated_tx_stamp);


--
-- Name: geopoint_dtsrc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geopoint_dtsrc ON geo_point USING btree (data_source_id);


--
-- Name: geopoint_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX geopoint_type ON geo_point USING btree (geo_point_type_enum_id);


--
-- Name: gpt_elev_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gpt_elev_uom ON geo_point USING btree (elevation_uom_id);


--
-- Name: geo_point geopoint_dtsrc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo_point
    ADD CONSTRAINT geopoint_dtsrc FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);


--
-- Name: geo_point geopoint_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo_point
    ADD CONSTRAINT geopoint_type FOREIGN KEY (geo_point_type_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: geo_point gpt_elev_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY geo_point
    ADD CONSTRAINT gpt_elev_uom FOREIGN KEY (elevation_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

