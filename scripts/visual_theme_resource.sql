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
-- Name: visual_theme_resource; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE visual_theme_resource (
    visual_theme_id character varying(20) NOT NULL,
    resource_type_enum_id character varying(20) NOT NULL,
    sequence_id character varying(20) NOT NULL,
    resource_value character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.visual_theme_resource OWNER TO ofbiz;

--
-- Name: visual_theme_resource pk_visual_theme_resource; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY visual_theme_resource
    ADD CONSTRAINT pk_visual_theme_resource PRIMARY KEY (visual_theme_id, resource_type_enum_id, sequence_id);


--
-- Name: vsl_thm_rsc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vsl_thm_rsc_txcrts ON visual_theme_resource USING btree (created_tx_stamp);


--
-- Name: vsl_thm_rsc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vsl_thm_rsc_txstmp ON visual_theme_resource USING btree (last_updated_tx_stamp);


--
-- Name: vt_res_theme; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vt_res_theme ON visual_theme_resource USING btree (visual_theme_id);


--
-- Name: vt_res_type_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vt_res_type_enum ON visual_theme_resource USING btree (resource_type_enum_id);


--
-- Name: visual_theme_resource vt_res_theme; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY visual_theme_resource
    ADD CONSTRAINT vt_res_theme FOREIGN KEY (visual_theme_id) REFERENCES visual_theme(visual_theme_id);


--
-- Name: visual_theme_resource vt_res_type_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY visual_theme_resource
    ADD CONSTRAINT vt_res_type_enum FOREIGN KEY (resource_type_enum_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

