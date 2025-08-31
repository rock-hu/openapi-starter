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
-- Name: portal_page; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE portal_page (
    portal_page_id character varying(20) NOT NULL,
    portal_page_name character varying(100),
    description character varying(255),
    owner_user_login_id character varying(255),
    original_portal_page_id character varying(20),
    parent_portal_page_id character varying(20),
    sequence_num numeric(20,0),
    security_group_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone,
    help_content_id character varying(20)
);


-- ALTER TABLE public.portal_page OWNER TO ofbiz;

--
-- Name: portal_page pk_portal_page; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_page
    ADD CONSTRAINT pk_portal_page PRIMARY KEY (portal_page_id);


--
-- Name: portal_page_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX portal_page_txcrts ON portal_page USING btree (created_tx_stamp);


--
-- Name: portal_page_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX portal_page_txstmp ON portal_page USING btree (last_updated_tx_stamp);


--
-- Name: portpage_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX portpage_parent ON portal_page USING btree (parent_portal_page_id);


--
-- Name: portpage_secgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX portpage_secgrp ON portal_page USING btree (security_group_id);


--
-- Name: portpal_help_cont; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX portpal_help_cont ON portal_page USING btree (help_content_id);


--
-- Name: portal_page portpage_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_page
    ADD CONSTRAINT portpage_parent FOREIGN KEY (parent_portal_page_id) REFERENCES portal_page(portal_page_id);


--
-- Name: portal_page portpage_secgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_page
    ADD CONSTRAINT portpage_secgrp FOREIGN KEY (security_group_id) REFERENCES security_group(group_id);


--
-- Name: portal_page portpal_help_cont; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY portal_page
    ADD CONSTRAINT portpal_help_cont FOREIGN KEY (help_content_id) REFERENCES content(content_id);


--
-- PostgreSQL database dump complete
--

