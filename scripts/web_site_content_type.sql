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
-- Name: web_site_content_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_site_content_type (
    web_site_content_type_id character varying(20) NOT NULL,
    description character varying(255),
    parent_type_id character varying(20),
    has_table character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.web_site_content_type OWNER TO ofbiz;

--
-- Name: web_site_content_type pk_web_site_content_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_content_type
    ADD CONSTRAINT pk_web_site_content_type PRIMARY KEY (web_site_content_type_id);


--
-- Name: wb_st_cnt_tp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_cnt_tp_txcrs ON web_site_content_type USING btree (created_tx_stamp);


--
-- Name: wb_st_cnt_tp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_cnt_tp_txstp ON web_site_content_type USING btree (last_updated_tx_stamp);


--
-- Name: wsct_type_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wsct_type_parent ON web_site_content_type USING btree (parent_type_id);


--
-- Name: web_site_content_type wsct_type_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_content_type
    ADD CONSTRAINT wsct_type_parent FOREIGN KEY (parent_type_id) REFERENCES web_site_content_type(web_site_content_type_id);


--
-- PostgreSQL database dump complete
--

