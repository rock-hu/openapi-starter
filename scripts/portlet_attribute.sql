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
-- Name: portlet_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE portlet_attribute (
    portal_page_id character varying(20) NOT NULL,
    portal_portlet_id character varying(20) NOT NULL,
    portlet_seq_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    attr_type character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.portlet_attribute OWNER TO ofbiz;

--
-- Name: portlet_attribute pk_portlet_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portlet_attribute
    ADD CONSTRAINT pk_portlet_attribute PRIMARY KEY (portal_page_id, portal_portlet_id, portlet_seq_id, attr_name);


--
-- Name: prtlt_attrt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtlt_attrt_txcrts ON portlet_attribute USING btree (created_tx_stamp);


--
-- Name: prtlt_attrt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtlt_attrt_txstmp ON portlet_attribute USING btree (last_updated_tx_stamp);


--
-- Name: ptlt_attr_ptlt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ptlt_attr_ptlt ON portlet_attribute USING btree (portal_portlet_id);


--
-- Name: portlet_attribute ptlt_attr_ptlt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portlet_attribute
    ADD CONSTRAINT ptlt_attr_ptlt FOREIGN KEY (portal_portlet_id) REFERENCES portal_portlet(portal_portlet_id);


--
-- PostgreSQL database dump complete
--

