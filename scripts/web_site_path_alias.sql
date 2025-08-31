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
-- Name: web_site_path_alias; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_site_path_alias (
    web_site_id character varying(20) NOT NULL,
    path_alias character varying(255) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    alias_to character varying(255),
    content_id character varying(20),
    map_key character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.web_site_path_alias OWNER TO ofbiz;

--
-- Name: web_site_path_alias pk_web_site_path_alias; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_path_alias
    ADD CONSTRAINT pk_web_site_path_alias PRIMARY KEY (web_site_id, path_alias, from_date);


--
-- Name: wb_st_pth_als_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_pth_als_txcs ON web_site_path_alias USING btree (created_tx_stamp);


--
-- Name: wb_st_pth_als_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_pth_als_txsp ON web_site_path_alias USING btree (last_updated_tx_stamp);


--
-- Name: wspath_content; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wspath_content ON web_site_path_alias USING btree (content_id);


--
-- Name: wspath_website; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wspath_website ON web_site_path_alias USING btree (web_site_id);


--
-- Name: web_site_path_alias wspath_content; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_path_alias
    ADD CONSTRAINT wspath_content FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: web_site_path_alias wspath_website; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_path_alias
    ADD CONSTRAINT wspath_website FOREIGN KEY (web_site_id) REFERENCES web_site(web_site_id);


--
-- PostgreSQL database dump complete
--

