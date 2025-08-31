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
-- Name: web_site; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_site (
    web_site_id character varying(20) NOT NULL,
    site_name character varying(100),
    http_host character varying(255),
    http_port character varying(10),
    https_host character varying(255),
    https_port character varying(10),
    enable_https character(1),
    webapp_path character varying(255),
    standard_content_prefix character varying(2000),
    secure_content_prefix character varying(2000),
    cookie_domain character varying(255),
    visual_theme_set_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone,
    product_store_id character varying(20),
    allow_product_store_change character(1),
    hosted_path_alias character varying(60),
    is_default character(1),
    display_maintenance_page character(1)
);


-- ALTER TABLE public.web_site OWNER TO ofbiz;

--
-- Name: web_site pk_web_site; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site
    ADD CONSTRAINT pk_web_site PRIMARY KEY (web_site_id);


--
-- Name: web_site_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_site_prds ON web_site USING btree (product_store_id);


--
-- Name: web_site_theme_set; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_site_theme_set ON web_site USING btree (visual_theme_set_id);


--
-- Name: web_site_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_site_txcrts ON web_site USING btree (created_tx_stamp);


--
-- Name: web_site_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_site_txstmp ON web_site USING btree (last_updated_tx_stamp);


--
-- Name: web_site web_site_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site
    ADD CONSTRAINT web_site_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: web_site web_site_theme_set; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site
    ADD CONSTRAINT web_site_theme_set FOREIGN KEY (visual_theme_set_id) REFERENCES visual_theme_set(visual_theme_set_id);


--
-- PostgreSQL database dump complete
--

