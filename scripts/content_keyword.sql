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
-- Name: content_keyword; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_keyword (
    content_id character varying(20) NOT NULL,
    keyword character varying(60) NOT NULL,
    relevancy_weight numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_keyword OWNER TO ofbiz;

--
-- Name: content_keyword pk_content_keyword; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_keyword
    ADD CONSTRAINT pk_content_keyword PRIMARY KEY (content_id, keyword);


--
-- Name: cnt_kwd_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_kwd_cnt ON content_keyword USING btree (content_id);


--
-- Name: cnt_kwd_kwd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_kwd_kwd ON content_keyword USING btree (keyword);


--
-- Name: cntnt_kwrd_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_kwrd_txcrts ON content_keyword USING btree (created_tx_stamp);


--
-- Name: cntnt_kwrd_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_kwrd_txstmp ON content_keyword USING btree (last_updated_tx_stamp);


--
-- Name: content_keyword cnt_kwd_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_keyword
    ADD CONSTRAINT cnt_kwd_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- PostgreSQL database dump complete
--

