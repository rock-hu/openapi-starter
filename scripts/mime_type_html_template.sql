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
-- Name: mime_type_html_template; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE mime_type_html_template (
    mime_type_id character varying(255) NOT NULL,
    template_location character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.mime_type_html_template OWNER TO ofbiz;

--
-- Name: mime_type_html_template pk_mime_type_html_template; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY mime_type_html_template
    ADD CONSTRAINT pk_mime_type_html_template PRIMARY KEY (mime_type_id);


--
-- Name: mimetype_tpl_mt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mimetype_tpl_mt ON mime_type_html_template USING btree (mime_type_id);


--
-- Name: mm_tp_htl_tmt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mm_tp_htl_tmt_txcs ON mime_type_html_template USING btree (created_tx_stamp);


--
-- Name: mm_tp_htl_tmt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mm_tp_htl_tmt_txsp ON mime_type_html_template USING btree (last_updated_tx_stamp);


--
-- Name: mime_type_html_template mimetype_tpl_mt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY mime_type_html_template
    ADD CONSTRAINT mimetype_tpl_mt FOREIGN KEY (mime_type_id) REFERENCES mime_type(mime_type_id);


--
-- PostgreSQL database dump complete
--

