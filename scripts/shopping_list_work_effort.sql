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
-- Name: shopping_list_work_effort; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shopping_list_work_effort (
    shopping_list_id character varying(20) NOT NULL,
    work_effort_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shopping_list_work_effort OWNER TO ofbiz;

--
-- Name: shopping_list_work_effort pk_shopping_list_work_effort; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_work_effort
    ADD CONSTRAINT pk_shopping_list_work_effort PRIMARY KEY (shopping_list_id, work_effort_id);


--
-- Name: shg_lst_wrk_eft_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shg_lst_wrk_eft_tp ON shopping_list_work_effort USING btree (last_updated_tx_stamp);


--
-- Name: shg_lst_wrk_eft_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shg_lst_wrk_eft_ts ON shopping_list_work_effort USING btree (created_tx_stamp);


--
-- Name: shlistwe_shlst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlistwe_shlst ON shopping_list_work_effort USING btree (shopping_list_id);


--
-- Name: shlistwe_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlistwe_weff ON shopping_list_work_effort USING btree (work_effort_id);


--
-- Name: shopping_list_work_effort shlistwe_shlst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_work_effort
    ADD CONSTRAINT shlistwe_shlst FOREIGN KEY (shopping_list_id) REFERENCES shopping_list(shopping_list_id);


--
-- Name: shopping_list_work_effort shlistwe_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list_work_effort
    ADD CONSTRAINT shlistwe_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

