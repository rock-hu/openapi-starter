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
-- Name: web_page; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_page (
    web_page_id character varying(20) NOT NULL,
    page_name character varying(100),
    web_site_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone,
    content_id character varying(20)
);


-- ALTER TABLE public.web_page OWNER TO ofbiz;

--
-- Name: web_page pk_web_page; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_page
    ADD CONSTRAINT pk_web_page PRIMARY KEY (web_page_id);


--
-- Name: web_page_content; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_page_content ON web_page USING btree (content_id);


--
-- Name: web_page_site; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_page_site ON web_page USING btree (web_site_id);


--
-- Name: web_page_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_page_txcrts ON web_page USING btree (created_tx_stamp);


--
-- Name: web_page_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_page_txstmp ON web_page USING btree (last_updated_tx_stamp);


--
-- Name: web_page web_page_content; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_page
    ADD CONSTRAINT web_page_content FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: web_page web_page_site; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_page
    ADD CONSTRAINT web_page_site FOREIGN KEY (web_site_id) REFERENCES web_site(web_site_id);


--
-- PostgreSQL database dump complete
--

