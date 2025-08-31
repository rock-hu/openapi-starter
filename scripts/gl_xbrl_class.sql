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
-- Name: gl_xbrl_class; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_xbrl_class (
    gl_xbrl_class_id character varying(20) NOT NULL,
    parent_gl_xbrl_class_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_xbrl_class OWNER TO ofbiz;

--
-- Name: gl_xbrl_class pk_gl_xbrl_class; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_xbrl_class
    ADD CONSTRAINT pk_gl_xbrl_class PRIMARY KEY (gl_xbrl_class_id);


--
-- Name: gl_xbrl_cls_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_xbrl_cls_txcrts ON gl_xbrl_class USING btree (created_tx_stamp);


--
-- Name: gl_xbrl_cls_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_xbrl_cls_txstmp ON gl_xbrl_class USING btree (last_updated_tx_stamp);


--
-- Name: gl_xbrl_clspar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_xbrl_clspar ON gl_xbrl_class USING btree (parent_gl_xbrl_class_id);


--
-- Name: gl_xbrl_class gl_xbrl_clspar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_xbrl_class
    ADD CONSTRAINT gl_xbrl_clspar FOREIGN KEY (parent_gl_xbrl_class_id) REFERENCES gl_xbrl_class(gl_xbrl_class_id);


--
-- PostgreSQL database dump complete
--

