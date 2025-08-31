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
-- Name: segment_group_geo; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE segment_group_geo (
    segment_group_id character varying(20) NOT NULL,
    geo_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.segment_group_geo OWNER TO ofbiz;

--
-- Name: segment_group_geo pk_segment_group_geo; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group_geo
    ADD CONSTRAINT pk_segment_group_geo PRIMARY KEY (segment_group_id, geo_id);


--
-- Name: sgmnt_grp_g_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmnt_grp_g_txcrts ON segment_group_geo USING btree (created_tx_stamp);


--
-- Name: sgmnt_grp_g_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmnt_grp_g_txstmp ON segment_group_geo USING btree (last_updated_tx_stamp);


--
-- Name: sgmtgrpgeo_geo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmtgrpgeo_geo ON segment_group_geo USING btree (geo_id);


--
-- Name: sgmtgrpgeo_sggp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sgmtgrpgeo_sggp ON segment_group_geo USING btree (segment_group_id);


--
-- Name: segment_group_geo sgmtgrpgeo_geo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group_geo
    ADD CONSTRAINT sgmtgrpgeo_geo FOREIGN KEY (geo_id) REFERENCES geo(geo_id);


--
-- Name: segment_group_geo sgmtgrpgeo_sggp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY segment_group_geo
    ADD CONSTRAINT sgmtgrpgeo_sggp FOREIGN KEY (segment_group_id) REFERENCES segment_group(segment_group_id);


--
-- PostgreSQL database dump complete
--

