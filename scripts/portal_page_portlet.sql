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
-- Name: portal_page_portlet; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE portal_page_portlet (
    portal_page_id character varying(20) NOT NULL,
    portal_portlet_id character varying(20) NOT NULL,
    portlet_seq_id character varying(20) NOT NULL,
    column_seq_id character varying(20),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.portal_page_portlet OWNER TO ofbiz;

--
-- Name: portal_page_portlet pk_portal_page_portlet; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_page_portlet
    ADD CONSTRAINT pk_portal_page_portlet PRIMARY KEY (portal_page_id, portal_portlet_id, portlet_seq_id);


--
-- Name: prl_pg_prtt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prl_pg_prtt_txcrts ON portal_page_portlet USING btree (created_tx_stamp);


--
-- Name: prl_pg_prtt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prl_pg_prtt_txstmp ON portal_page_portlet USING btree (last_updated_tx_stamp);


--
-- Name: prtl_pgptlt_page; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtl_pgptlt_page ON portal_page_portlet USING btree (portal_page_id);


--
-- Name: prtl_pgptlt_ptlt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtl_pgptlt_ptlt ON portal_page_portlet USING btree (portal_portlet_id);


--
-- Name: portal_page_portlet prtl_pgptlt_page; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_page_portlet
    ADD CONSTRAINT prtl_pgptlt_page FOREIGN KEY (portal_page_id) REFERENCES portal_page(portal_page_id);


--
-- Name: portal_page_portlet prtl_pgptlt_ptlt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_page_portlet
    ADD CONSTRAINT prtl_pgptlt_ptlt FOREIGN KEY (portal_portlet_id) REFERENCES portal_portlet(portal_portlet_id);


--
-- PostgreSQL database dump complete
--

