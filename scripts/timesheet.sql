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
-- Name: timesheet; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE timesheet (
    timesheet_id character varying(20) NOT NULL,
    party_id character varying(20),
    client_party_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    status_id character varying(20),
    approved_by_user_login_id character varying(255),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.timesheet OWNER TO ofbiz;

--
-- Name: timesheet pk_timesheet; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY timesheet
    ADD CONSTRAINT pk_timesheet PRIMARY KEY (timesheet_id);


--
-- Name: timesheet_ab_ul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX timesheet_ab_ul ON timesheet USING btree (approved_by_user_login_id);


--
-- Name: timesheet_cpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX timesheet_cpty ON timesheet USING btree (client_party_id);


--
-- Name: timesheet_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX timesheet_prty ON timesheet USING btree (party_id);


--
-- Name: timesheet_sts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX timesheet_sts ON timesheet USING btree (status_id);


--
-- Name: timesheet_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX timesheet_txcrts ON timesheet USING btree (created_tx_stamp);


--
-- Name: timesheet_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX timesheet_txstmp ON timesheet USING btree (last_updated_tx_stamp);


--
-- Name: timesheet timesheet_ab_ul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY timesheet
    ADD CONSTRAINT timesheet_ab_ul FOREIGN KEY (approved_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: timesheet timesheet_cpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY timesheet
    ADD CONSTRAINT timesheet_cpty FOREIGN KEY (client_party_id) REFERENCES party(party_id);


--
-- Name: timesheet timesheet_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY timesheet
    ADD CONSTRAINT timesheet_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: timesheet timesheet_sts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY timesheet
    ADD CONSTRAINT timesheet_sts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

