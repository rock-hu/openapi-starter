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
-- Name: timesheet_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE timesheet_role (
    timesheet_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.timesheet_role OWNER TO ofbiz;

--
-- Name: timesheet_role pk_timesheet_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY timesheet_role
    ADD CONSTRAINT pk_timesheet_role PRIMARY KEY (timesheet_id, party_id, role_type_id);


--
-- Name: timeshtrl_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX timeshtrl_prty ON timesheet_role USING btree (party_id);


--
-- Name: timeshtrl_ptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX timeshtrl_ptrl ON timesheet_role USING btree (party_id, role_type_id);


--
-- Name: timeshtrl_tsht; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX timeshtrl_tsht ON timesheet_role USING btree (timesheet_id);


--
-- Name: tmsht_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tmsht_rl_txcrts ON timesheet_role USING btree (created_tx_stamp);


--
-- Name: tmsht_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tmsht_rl_txstmp ON timesheet_role USING btree (last_updated_tx_stamp);


--
-- Name: timesheet_role timeshtrl_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY timesheet_role
    ADD CONSTRAINT timeshtrl_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: timesheet_role timeshtrl_ptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY timesheet_role
    ADD CONSTRAINT timeshtrl_ptrl FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: timesheet_role timeshtrl_tsht; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY timesheet_role
    ADD CONSTRAINT timeshtrl_tsht FOREIGN KEY (timesheet_id) REFERENCES timesheet(timesheet_id);


--
-- PostgreSQL database dump complete
--

