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
-- Name: work_effort_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_content (
    work_effort_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    work_effort_content_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_content OWNER TO ofbiz;

--
-- Name: work_effort_content pk_work_effort_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_content
    ADD CONSTRAINT pk_work_effort_content PRIMARY KEY (work_effort_id, content_id, work_effort_content_type_id, from_date);


--
-- Name: wkeff_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_cnt_cnt ON work_effort_content USING btree (content_id);


--
-- Name: wkeff_cnt_wctp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_cnt_wctp ON work_effort_content USING btree (work_effort_content_type_id);


--
-- Name: wkeff_cnt_wkeff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_cnt_wkeff ON work_effort_content USING btree (work_effort_id);


--
-- Name: wrk_efft_cnt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_cnt_txcrs ON work_effort_content USING btree (created_tx_stamp);


--
-- Name: wrk_efft_cnt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_cnt_txstp ON work_effort_content USING btree (last_updated_tx_stamp);


--
-- Name: work_effort_content wkeff_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_content
    ADD CONSTRAINT wkeff_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: work_effort_content wkeff_cnt_wctp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_content
    ADD CONSTRAINT wkeff_cnt_wctp FOREIGN KEY (work_effort_content_type_id) REFERENCES work_effort_content_type(work_effort_content_type_id);


--
-- Name: work_effort_content wkeff_cnt_wkeff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_content
    ADD CONSTRAINT wkeff_cnt_wkeff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

