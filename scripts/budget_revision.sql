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
-- Name: budget_revision; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_revision (
    budget_id character varying(20) NOT NULL,
    revision_seq_id character varying(20) NOT NULL,
    date_revised timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_revision OWNER TO ofbiz;

--
-- Name: budget_revision pk_budget_revision; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_revision
    ADD CONSTRAINT pk_budget_revision PRIMARY KEY (budget_id, revision_seq_id);


--
-- Name: bdgt_rvsn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_rvsn_txcrts ON budget_revision USING btree (created_tx_stamp);


--
-- Name: bdgt_rvsn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_rvsn_txstmp ON budget_revision USING btree (last_updated_tx_stamp);


--
-- Name: budget_rvsn_bdgt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_rvsn_bdgt ON budget_revision USING btree (budget_id);


--
-- Name: budget_revision budget_rvsn_bdgt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_revision
    ADD CONSTRAINT budget_rvsn_bdgt FOREIGN KEY (budget_id) REFERENCES budget(budget_id);


--
-- PostgreSQL database dump complete
--

