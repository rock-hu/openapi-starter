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
-- Name: portlet_portlet_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE portlet_portlet_category (
    portal_portlet_id character varying(20) NOT NULL,
    portlet_category_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.portlet_portlet_category OWNER TO ofbiz;

--
-- Name: portlet_portlet_category pk_portlet_portlet_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portlet_portlet_category
    ADD CONSTRAINT pk_portlet_portlet_category PRIMARY KEY (portal_portlet_id, portlet_category_id);


--
-- Name: pptltcat_ptltcat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pptltcat_ptltcat ON portlet_portlet_category USING btree (portlet_category_id);


--
-- Name: pptltcat_ptpl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pptltcat_ptpl ON portlet_portlet_category USING btree (portal_portlet_id);


--
-- Name: prtt_prt_ctr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtt_prt_ctr_txcrs ON portlet_portlet_category USING btree (created_tx_stamp);


--
-- Name: prtt_prt_ctr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtt_prt_ctr_txstp ON portlet_portlet_category USING btree (last_updated_tx_stamp);


--
-- Name: portlet_portlet_category pptltcat_ptltcat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portlet_portlet_category
    ADD CONSTRAINT pptltcat_ptltcat FOREIGN KEY (portlet_category_id) REFERENCES portlet_category(portlet_category_id);


--
-- Name: portlet_portlet_category pptltcat_ptpl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portlet_portlet_category
    ADD CONSTRAINT pptltcat_ptpl FOREIGN KEY (portal_portlet_id) REFERENCES portal_portlet(portal_portlet_id);


--
-- PostgreSQL database dump complete
--

