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
-- Name: agreement_work_effort_applic; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_work_effort_applic (
    agreement_id character varying(20) NOT NULL,
    agreement_item_seq_id character varying(20) NOT NULL,
    work_effort_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_work_effort_applic OWNER TO ofbiz;

--
-- Name: agreement_work_effort_applic pk_agreement_work_effort_appli; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_work_effort_applic
    ADD CONSTRAINT pk_agreement_work_effort_appli PRIMARY KEY (agreement_id, agreement_item_seq_id, work_effort_id);


--
-- Name: agrmnt_wea_agrmnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_wea_agrmnt ON agreement_work_effort_applic USING btree (agreement_id);


--
-- Name: agrmnt_wea_we; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_wea_we ON agreement_work_effort_applic USING btree (work_effort_id);


--
-- Name: agt_wrk_eft_apc_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agt_wrk_eft_apc_tp ON agreement_work_effort_applic USING btree (last_updated_tx_stamp);


--
-- Name: agt_wrk_eft_apc_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agt_wrk_eft_apc_ts ON agreement_work_effort_applic USING btree (created_tx_stamp);


--
-- Name: agreement_work_effort_applic agrmnt_wea_agrmnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_work_effort_applic
    ADD CONSTRAINT agrmnt_wea_agrmnt FOREIGN KEY (agreement_id) REFERENCES agreement(agreement_id);


--
-- Name: agreement_work_effort_applic agrmnt_wea_we; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_work_effort_applic
    ADD CONSTRAINT agrmnt_wea_we FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

