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
-- Name: fixed_asset_geo_point; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_geo_point (
    fixed_asset_id character varying(20) NOT NULL,
    geo_point_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_geo_point OWNER TO ofbiz;

--
-- Name: fixed_asset_geo_point pk_fixed_asset_geo_point; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_geo_point
    ADD CONSTRAINT pk_fixed_asset_geo_point PRIMARY KEY (fixed_asset_id, geo_point_id, from_date);


--
-- Name: fxd_ast_g_pnt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_g_pnt_txcs ON fixed_asset_geo_point USING btree (created_tx_stamp);


--
-- Name: fxd_ast_g_pnt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_g_pnt_txsp ON fixed_asset_geo_point USING btree (last_updated_tx_stamp);


--
-- Name: fxdastgeopt_fxdast; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastgeopt_fxdast ON fixed_asset_geo_point USING btree (fixed_asset_id);


--
-- Name: fxdastgeopt_geopt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxdastgeopt_geopt ON fixed_asset_geo_point USING btree (geo_point_id);


--
-- Name: fixed_asset_geo_point fxdastgeopt_fxdast; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_geo_point
    ADD CONSTRAINT fxdastgeopt_fxdast FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: fixed_asset_geo_point fxdastgeopt_geopt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_geo_point
    ADD CONSTRAINT fxdastgeopt_geopt FOREIGN KEY (geo_point_id) REFERENCES geo_point(geo_point_id);


--
-- PostgreSQL database dump complete
--

