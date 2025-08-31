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
-- Name: empl_leave; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE empl_leave (
    party_id character varying(20) NOT NULL,
    leave_type_id character varying(20) NOT NULL,
    empl_leave_reason_type_id character varying(20),
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    approver_party_id character varying(20),
    leave_status character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.empl_leave OWNER TO ofbiz;

--
-- Name: empl_leave pk_empl_leave; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_leave
    ADD CONSTRAINT pk_empl_leave PRIMARY KEY (party_id, leave_type_id, from_date);


--
-- Name: emp_leav_reas_eltp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emp_leav_reas_eltp ON empl_leave USING btree (empl_leave_reason_type_id);


--
-- Name: empl_leave_appr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_leave_appr ON empl_leave USING btree (approver_party_id);


--
-- Name: empl_leave_eletp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_leave_eletp ON empl_leave USING btree (leave_type_id);


--
-- Name: empl_leave_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_leave_prty ON empl_leave USING btree (party_id);


--
-- Name: empl_leave_sts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_leave_sts ON empl_leave USING btree (leave_status);


--
-- Name: empl_leave_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_leave_txcrts ON empl_leave USING btree (created_tx_stamp);


--
-- Name: empl_leave_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX empl_leave_txstmp ON empl_leave USING btree (last_updated_tx_stamp);


--
-- Name: empl_leave emp_leav_reas_eltp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_leave
    ADD CONSTRAINT emp_leav_reas_eltp FOREIGN KEY (empl_leave_reason_type_id) REFERENCES empl_leave_reason_type(empl_leave_reason_type_id);


--
-- Name: empl_leave empl_leave_appr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_leave
    ADD CONSTRAINT empl_leave_appr FOREIGN KEY (approver_party_id) REFERENCES party(party_id);


--
-- Name: empl_leave empl_leave_eletp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_leave
    ADD CONSTRAINT empl_leave_eletp FOREIGN KEY (leave_type_id) REFERENCES empl_leave_type(leave_type_id);


--
-- Name: empl_leave empl_leave_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_leave
    ADD CONSTRAINT empl_leave_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: empl_leave empl_leave_sts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY empl_leave
    ADD CONSTRAINT empl_leave_sts FOREIGN KEY (leave_status) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

