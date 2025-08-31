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
-- Name: perf_review; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE perf_review (
    employee_party_id character varying(20) NOT NULL,
    employee_role_type_id character varying(20) NOT NULL,
    perf_review_id character varying(20) NOT NULL,
    manager_party_id character varying(20),
    manager_role_type_id character varying(20),
    payment_id character varying(20),
    empl_position_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.perf_review OWNER TO ofbiz;

--
-- Name: perf_review pk_perf_review; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review
    ADD CONSTRAINT pk_perf_review PRIMARY KEY (employee_party_id, employee_role_type_id, perf_review_id);


--
-- Name: perf_rev_eptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_rev_eptrl ON perf_review USING btree (employee_party_id, employee_role_type_id);


--
-- Name: perf_rev_epty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_rev_epty ON perf_review USING btree (employee_party_id);


--
-- Name: perf_rev_mpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_rev_mpty ON perf_review USING btree (manager_party_id);


--
-- Name: perf_rev_pmnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_rev_pmnt ON perf_review USING btree (payment_id);


--
-- Name: perf_review_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_review_txcrts ON perf_review USING btree (created_tx_stamp);


--
-- Name: perf_review_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_review_txstmp ON perf_review USING btree (last_updated_tx_stamp);


--
-- Name: perf_review perf_rev_eptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review
    ADD CONSTRAINT perf_rev_eptrl FOREIGN KEY (employee_party_id, employee_role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: perf_review perf_rev_epty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review
    ADD CONSTRAINT perf_rev_epty FOREIGN KEY (employee_party_id) REFERENCES party(party_id);


--
-- Name: perf_review perf_rev_mpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review
    ADD CONSTRAINT perf_rev_mpty FOREIGN KEY (manager_party_id) REFERENCES party(party_id);


--
-- Name: perf_review perf_rev_pmnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review
    ADD CONSTRAINT perf_rev_pmnt FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- PostgreSQL database dump complete
--

