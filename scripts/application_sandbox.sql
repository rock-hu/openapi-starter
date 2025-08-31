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
-- Name: application_sandbox; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE application_sandbox (
    application_id character varying(20) NOT NULL,
    work_effort_id character varying(20),
    party_id character varying(20),
    role_type_id character varying(20),
    from_date timestamp with time zone,
    runtime_data_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.application_sandbox OWNER TO ofbiz;

--
-- Name: application_sandbox pk_application_sandbox; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY application_sandbox
    ADD CONSTRAINT pk_application_sandbox PRIMARY KEY (application_id);


--
-- Name: app_sndbx_rntmdta; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX app_sndbx_rntmdta ON application_sandbox USING btree (runtime_data_id);


--
-- Name: app_sndbx_wepa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX app_sndbx_wepa ON application_sandbox USING btree (work_effort_id, party_id, role_type_id, from_date);


--
-- Name: applcn_sndx_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX applcn_sndx_txcrts ON application_sandbox USING btree (created_tx_stamp);


--
-- Name: applcn_sndx_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX applcn_sndx_txstmp ON application_sandbox USING btree (last_updated_tx_stamp);


--
-- Name: application_sandbox app_sndbx_rntmdta; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY application_sandbox
    ADD CONSTRAINT app_sndbx_rntmdta FOREIGN KEY (runtime_data_id) REFERENCES runtime_data(runtime_data_id);


--
-- Name: application_sandbox app_sndbx_wepa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY application_sandbox
    ADD CONSTRAINT app_sndbx_wepa FOREIGN KEY (work_effort_id, party_id, role_type_id, from_date) REFERENCES work_effort_party_assignment(work_effort_id, party_id, role_type_id, from_date);


--
-- PostgreSQL database dump complete
--

