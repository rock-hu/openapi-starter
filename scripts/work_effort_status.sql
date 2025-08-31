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
-- Name: work_effort_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_effort_status (
    work_effort_id character varying(20) NOT NULL,
    status_id character varying(20) NOT NULL,
    status_datetime timestamp with time zone NOT NULL,
    set_by_user_login character varying(255),
    reason character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_effort_status OWNER TO ofbiz;

--
-- Name: work_effort_status pk_work_effort_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_status
    ADD CONSTRAINT pk_work_effort_status PRIMARY KEY (work_effort_id, status_id, status_datetime);


--
-- Name: wkeff_stts_sb_ul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_stts_sb_ul ON work_effort_status USING btree (set_by_user_login);


--
-- Name: wkeff_stts_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_stts_stts ON work_effort_status USING btree (status_id);


--
-- Name: wkeff_stts_we; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wkeff_stts_we ON work_effort_status USING btree (work_effort_id);


--
-- Name: wrk_efft_sts_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_sts_txcrs ON work_effort_status USING btree (created_tx_stamp);


--
-- Name: wrk_efft_sts_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_efft_sts_txstp ON work_effort_status USING btree (last_updated_tx_stamp);


--
-- Name: work_effort_status wkeff_stts_sb_ul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_status
    ADD CONSTRAINT wkeff_stts_sb_ul FOREIGN KEY (set_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: work_effort_status wkeff_stts_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_status
    ADD CONSTRAINT wkeff_stts_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: work_effort_status wkeff_stts_we; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_effort_status
    ADD CONSTRAINT wkeff_stts_we FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

