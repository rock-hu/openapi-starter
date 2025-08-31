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
-- Name: portal_portlet; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE portal_portlet (
    portal_portlet_id character varying(20) NOT NULL,
    portlet_name character varying(100),
    screen_name character varying(255),
    screen_location character varying(255),
    edit_form_name character varying(255),
    edit_form_location character varying(255),
    description character varying(255),
    screenshot character varying(2000),
    security_service_name character varying(255),
    security_main_action character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.portal_portlet OWNER TO ofbiz;

--
-- Name: portal_portlet pk_portal_portlet; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_portlet
    ADD CONSTRAINT pk_portal_portlet PRIMARY KEY (portal_portlet_id);


--
-- Name: prtl_prtlt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtl_prtlt_txcrts ON portal_portlet USING btree (created_tx_stamp);


--
-- Name: prtl_prtlt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtl_prtlt_txstmp ON portal_portlet USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

