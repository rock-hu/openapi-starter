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
-- Name: job_sandbox; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE job_sandbox (
    job_id character varying(20) NOT NULL,
    job_name character varying(100),
    run_time timestamp with time zone,
    priority numeric(20,0),
    pool_id character varying(100),
    status_id character varying(20),
    parent_job_id character varying(20),
    previous_job_id character varying(20),
    service_name character varying(100),
    loader_name character varying(100),
    max_retry numeric(20,0),
    current_retry_count numeric(20,0),
    auth_user_login_id character varying(255),
    run_as_user character varying(255),
    runtime_data_id character varying(20),
    recurrence_info_id character varying(20),
    temp_expr_id character varying(20),
    current_recurrence_count numeric(20,0),
    max_recurrence_count numeric(20,0),
    run_by_instance_id character varying(20),
    start_date_time timestamp with time zone,
    finish_date_time timestamp with time zone,
    cancel_date_time timestamp with time zone,
    job_result character varying(255),
    recurrence_time_zone character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.job_sandbox OWNER TO ofbiz;

--
-- Name: job_sandbox pk_job_sandbox; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_sandbox
    ADD CONSTRAINT pk_job_sandbox PRIMARY KEY (job_id);


--
-- Name: job_sandbox_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_sandbox_txcrts ON job_sandbox USING btree (created_tx_stamp);


--
-- Name: job_sandbox_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_sandbox_txstmp ON job_sandbox USING btree (last_updated_tx_stamp);


--
-- Name: job_sndbx_ausrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_sndbx_ausrlgn ON job_sandbox USING btree (auth_user_login_id);


--
-- Name: job_sndbx_recinfo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_sndbx_recinfo ON job_sandbox USING btree (recurrence_info_id);


--
-- Name: job_sndbx_rntmdta; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_sndbx_rntmdta ON job_sandbox USING btree (runtime_data_id);


--
-- Name: job_sndbx_runstat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_sndbx_runstat ON job_sandbox USING btree (run_by_instance_id, status_id);


--
-- Name: job_sndbx_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_sndbx_stts ON job_sandbox USING btree (status_id);


--
-- Name: job_sndbx_tempexpr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_sndbx_tempexpr ON job_sandbox USING btree (temp_expr_id);


--
-- Name: job_sndbx_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX job_sndbx_usrlgn ON job_sandbox USING btree (run_as_user);


--
-- Name: job_sandbox job_sndbx_ausrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_sandbox
    ADD CONSTRAINT job_sndbx_ausrlgn FOREIGN KEY (auth_user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: job_sandbox job_sndbx_recinfo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_sandbox
    ADD CONSTRAINT job_sndbx_recinfo FOREIGN KEY (recurrence_info_id) REFERENCES recurrence_info(recurrence_info_id);


--
-- Name: job_sandbox job_sndbx_rntmdta; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_sandbox
    ADD CONSTRAINT job_sndbx_rntmdta FOREIGN KEY (runtime_data_id) REFERENCES runtime_data(runtime_data_id);


--
-- Name: job_sandbox job_sndbx_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_sandbox
    ADD CONSTRAINT job_sndbx_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: job_sandbox job_sndbx_tempexpr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_sandbox
    ADD CONSTRAINT job_sndbx_tempexpr FOREIGN KEY (temp_expr_id) REFERENCES temporal_expression(temp_expr_id);


--
-- Name: job_sandbox job_sndbx_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_sandbox
    ADD CONSTRAINT job_sndbx_usrlgn FOREIGN KEY (run_as_user) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

