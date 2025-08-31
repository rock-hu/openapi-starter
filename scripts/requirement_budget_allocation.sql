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
-- Name: requirement_budget_allocation; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE requirement_budget_allocation (
    budget_id character varying(20) NOT NULL,
    budget_item_seq_id character varying(20) NOT NULL,
    requirement_id character varying(20) NOT NULL,
    amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.requirement_budget_allocation OWNER TO ofbiz;

--
-- Name: requirement_budget_allocation pk_requirement_budget_allocati; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_budget_allocation
    ADD CONSTRAINT pk_requirement_budget_allocati PRIMARY KEY (budget_id, budget_item_seq_id, requirement_id);


--
-- Name: req_bdgtal_bitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_bdgtal_bitm ON requirement_budget_allocation USING btree (budget_id, budget_item_seq_id);


--
-- Name: req_bdgtal_req; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX req_bdgtal_req ON requirement_budget_allocation USING btree (requirement_id);


--
-- Name: rqrt_bdt_alln_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rqrt_bdt_alln_txcs ON requirement_budget_allocation USING btree (created_tx_stamp);


--
-- Name: rqrt_bdt_alln_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rqrt_bdt_alln_txsp ON requirement_budget_allocation USING btree (last_updated_tx_stamp);


--
-- Name: requirement_budget_allocation req_bdgtal_bitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_budget_allocation
    ADD CONSTRAINT req_bdgtal_bitm FOREIGN KEY (budget_id, budget_item_seq_id) REFERENCES budget_item(budget_id, budget_item_seq_id);


--
-- Name: requirement_budget_allocation req_bdgtal_req; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY requirement_budget_allocation
    ADD CONSTRAINT req_bdgtal_req FOREIGN KEY (requirement_id) REFERENCES requirement(requirement_id);


--
-- PostgreSQL database dump complete
--

