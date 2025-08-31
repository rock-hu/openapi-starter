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
-- Name: budget; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget (
    budget_id character varying(20) NOT NULL,
    budget_type_id character varying(20),
    custom_time_period_id character varying(20),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget OWNER TO ofbiz;

--
-- Name: budget pk_budget; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget
    ADD CONSTRAINT pk_budget PRIMARY KEY (budget_id);


--
-- Name: budget_bgttyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_bgttyp ON budget USING btree (budget_type_id);


--
-- Name: budget_ctp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_ctp ON budget USING btree (custom_time_period_id);


--
-- Name: budget_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_txcrts ON budget USING btree (created_tx_stamp);


--
-- Name: budget_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_txstmp ON budget USING btree (last_updated_tx_stamp);


--
-- Name: budget budget_bgttyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget
    ADD CONSTRAINT budget_bgttyp FOREIGN KEY (budget_type_id) REFERENCES budget_type(budget_type_id);


--
-- Name: budget budget_ctp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget
    ADD CONSTRAINT budget_ctp FOREIGN KEY (custom_time_period_id) REFERENCES custom_time_period(custom_time_period_id);


--
-- PostgreSQL database dump complete
--

