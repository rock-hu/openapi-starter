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
-- Name: work_effort_review; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_review (
    work_effort_id character varying(20) NOT NULL,
    user_login_id character varying(255) NOT NULL,
    review_date timestamp with time zone NOT NULL,
    status_id character varying(20),
    posted_anonymous character(1),
    rating double precision,
    review_text text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_review OWNER TO ofbiz;

--
-- Name: work_effort_review pk_work_effort_review; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_review
    ADD CONSTRAINT pk_work_effort_review PRIMARY KEY (work_effort_id, user_login_id, review_date);


--
-- Name: weff_review_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX weff_review_stts ON work_effort_review USING btree (status_id);


--
-- Name: weff_review_ul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX weff_review_ul ON work_effort_review USING btree (user_login_id);


--
-- Name: weff_review_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX weff_review_weff ON work_effort_review USING btree (work_effort_id);


--
-- Name: wrk_efft_rvw_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_rvw_txcrs ON work_effort_review USING btree (created_tx_stamp);


--
-- Name: wrk_efft_rvw_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_rvw_txstp ON work_effort_review USING btree (last_updated_tx_stamp);


--
-- Name: work_effort_review weff_review_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_review
    ADD CONSTRAINT weff_review_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: work_effort_review weff_review_ul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_review
    ADD CONSTRAINT weff_review_ul FOREIGN KEY (user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: work_effort_review weff_review_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_review
    ADD CONSTRAINT weff_review_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

