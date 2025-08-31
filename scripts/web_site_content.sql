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
-- Name: web_site_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_site_content (
    web_site_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    web_site_content_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.web_site_content OWNER TO ofbiz;

--
-- Name: web_site_content pk_web_site_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_content
    ADD CONSTRAINT pk_web_site_content PRIMARY KEY (web_site_id, content_id, web_site_content_type_id, from_date);


--
-- Name: wb_st_cntnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_cntnt_txcrts ON web_site_content USING btree (created_tx_stamp);


--
-- Name: wb_st_cntnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_cntnt_txstmp ON web_site_content USING btree (last_updated_tx_stamp);


--
-- Name: wsctnt_content; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wsctnt_content ON web_site_content USING btree (content_id);


--
-- Name: wsctnt_website; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wsctnt_website ON web_site_content USING btree (web_site_id);


--
-- Name: wsctnt_wscttype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wsctnt_wscttype ON web_site_content USING btree (web_site_content_type_id);


--
-- Name: web_site_content wsctnt_content; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_content
    ADD CONSTRAINT wsctnt_content FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: web_site_content wsctnt_website; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_content
    ADD CONSTRAINT wsctnt_website FOREIGN KEY (web_site_id) REFERENCES web_site(web_site_id);


--
-- Name: web_site_content wsctnt_wscttype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_content
    ADD CONSTRAINT wsctnt_wscttype FOREIGN KEY (web_site_content_type_id) REFERENCES web_site_content_type(web_site_content_type_id);


--
-- PostgreSQL database dump complete
--

