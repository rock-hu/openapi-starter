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
-- Name: gl_budget_xref; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_budget_xref (
    gl_account_id character varying(20) NOT NULL,
    budget_item_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    allocation_percentage numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_budget_xref OWNER TO ofbiz;

--
-- Name: gl_budget_xref pk_gl_budget_xref; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_budget_xref
    ADD CONSTRAINT pk_gl_budget_xref PRIMARY KEY (gl_account_id, budget_item_type_id, from_date);


--
-- Name: gl_bdgt_xrf_bit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_bdgt_xrf_bit ON gl_budget_xref USING btree (budget_item_type_id);


--
-- Name: gl_bdgt_xrf_gla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_bdgt_xrf_gla ON gl_budget_xref USING btree (gl_account_id);


--
-- Name: gl_bdgt_xrf_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_bdgt_xrf_txcrts ON gl_budget_xref USING btree (created_tx_stamp);


--
-- Name: gl_bdgt_xrf_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_bdgt_xrf_txstmp ON gl_budget_xref USING btree (last_updated_tx_stamp);


--
-- Name: gl_budget_xref gl_bdgt_xrf_bit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_budget_xref
    ADD CONSTRAINT gl_bdgt_xrf_bit FOREIGN KEY (budget_item_type_id) REFERENCES budget_item_type(budget_item_type_id);


--
-- Name: gl_budget_xref gl_bdgt_xrf_gla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_budget_xref
    ADD CONSTRAINT gl_bdgt_xrf_gla FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- PostgreSQL database dump complete
--

