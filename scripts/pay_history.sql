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
-- Name: pay_history; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE pay_history (
    role_type_id_from character varying(20) NOT NULL,
    role_type_id_to character varying(20) NOT NULL,
    party_id_from character varying(20) NOT NULL,
    party_id_to character varying(20) NOT NULL,
    empl_from_date timestamp with time zone NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    salary_step_seq_id character varying(20),
    pay_grade_id character varying(20),
    period_type_id character varying(20),
    amount numeric(18,2),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.pay_history OWNER TO ofbiz;

--
-- Name: pay_history pk_pay_history; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY pay_history
    ADD CONSTRAINT pk_pay_history PRIMARY KEY (role_type_id_from, role_type_id_to, party_id_from, party_id_to, empl_from_date, from_date);


--
-- Name: pay_hist_emplmnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pay_hist_emplmnt ON pay_history USING btree (role_type_id_from, role_type_id_to, party_id_from, party_id_to, empl_from_date);


--
-- Name: pay_hist_pdtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pay_hist_pdtp ON pay_history USING btree (period_type_id);


--
-- Name: pay_hist_pgrd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pay_hist_pgrd ON pay_history USING btree (pay_grade_id);


--
-- Name: pay_history_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pay_history_txcrts ON pay_history USING btree (created_tx_stamp);


--
-- Name: pay_history_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pay_history_txstmp ON pay_history USING btree (last_updated_tx_stamp);


--
-- Name: pay_history pay_hist_emplmnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY pay_history
    ADD CONSTRAINT pay_hist_emplmnt FOREIGN KEY (role_type_id_from, role_type_id_to, party_id_from, party_id_to, empl_from_date) REFERENCES employment(role_type_id_from, role_type_id_to, party_id_from, party_id_to, from_date);


--
-- Name: pay_history pay_hist_pdtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY pay_history
    ADD CONSTRAINT pay_hist_pdtp FOREIGN KEY (period_type_id) REFERENCES period_type(period_type_id);


--
-- Name: pay_history pay_hist_pgrd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY pay_history
    ADD CONSTRAINT pay_hist_pgrd FOREIGN KEY (pay_grade_id) REFERENCES pay_grade(pay_grade_id);


--
-- PostgreSQL database dump complete
--

