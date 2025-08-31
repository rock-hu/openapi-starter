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
-- Name: web_analytics_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_analytics_type (
    web_analytics_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.web_analytics_type OWNER TO ofbiz;

--
-- Name: web_analytics_type pk_web_analytics_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_analytics_type
    ADD CONSTRAINT pk_web_analytics_type PRIMARY KEY (web_analytics_type_id);


--
-- Name: wana_typ_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wana_typ_parent ON web_analytics_type USING btree (parent_type_id);


--
-- Name: wb_anlts_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_anlts_tp_txcrts ON web_analytics_type USING btree (created_tx_stamp);


--
-- Name: wb_anlts_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_anlts_tp_txstmp ON web_analytics_type USING btree (last_updated_tx_stamp);


--
-- Name: web_analytics_type wana_typ_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_analytics_type
    ADD CONSTRAINT wana_typ_parent FOREIGN KEY (parent_type_id) REFERENCES web_analytics_type(web_analytics_type_id);


--
-- PostgreSQL database dump complete
--

