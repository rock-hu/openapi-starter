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
-- Name: salary_step_new; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE salary_step_new (
    salary_step_seq_id character varying(20) NOT NULL,
    pay_grade_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    date_modified timestamp with time zone,
    amount numeric(18,2),
    created_by_user_login character varying(255),
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.salary_step_new OWNER TO ofbiz;

--
-- Name: salary_step_new pk_salary_step_new; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY salary_step_new
    ADD CONSTRAINT pk_salary_step_new PRIMARY KEY (salary_step_seq_id, pay_grade_id, from_date);


--
-- Name: slr_stp_nw_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slr_stp_nw_txcrts ON salary_step_new USING btree (created_tx_stamp);


--
-- Name: slr_stp_nw_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slr_stp_nw_txstmp ON salary_step_new USING btree (last_updated_tx_stamp);


--
-- Name: slry_stp_pgrd_new; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX slry_stp_pgrd_new ON salary_step_new USING btree (pay_grade_id);


--
-- Name: salary_step_new slry_stp_pgrd_new; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY salary_step_new
    ADD CONSTRAINT slry_stp_pgrd_new FOREIGN KEY (pay_grade_id) REFERENCES pay_grade(pay_grade_id);


--
-- PostgreSQL database dump complete
--

