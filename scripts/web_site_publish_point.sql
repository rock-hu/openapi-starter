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
-- Name: web_site_publish_point; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_site_publish_point (
    content_id character varying(20) NOT NULL,
    template_title character varying(255),
    style_sheet_file character varying(255),
    logo character varying(255),
    medallion_logo character varying(255),
    line_logo character varying(255),
    left_bar_id character varying(20),
    right_bar_id character varying(20),
    content_dept character varying(20),
    about_content_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.web_site_publish_point OWNER TO ofbiz;

--
-- Name: web_site_publish_point pk_web_site_publish_point; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_publish_point
    ADD CONSTRAINT pk_web_site_publish_point PRIMARY KEY (content_id);


--
-- Name: wb_st_pbh_pnt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_pbh_pnt_txcs ON web_site_publish_point USING btree (created_tx_stamp);


--
-- Name: wb_st_pbh_pnt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_pbh_pnt_txsp ON web_site_publish_point USING btree (last_updated_tx_stamp);


--
-- Name: wbstpp_content; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wbstpp_content ON web_site_publish_point USING btree (content_id);


--
-- Name: web_site_publish_point wbstpp_content; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_publish_point
    ADD CONSTRAINT wbstpp_content FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- PostgreSQL database dump complete
--

