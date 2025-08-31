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
-- Name: budget_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_attribute (
    budget_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_attribute OWNER TO ofbiz;

--
-- Name: budget_attribute pk_budget_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_attribute
    ADD CONSTRAINT pk_budget_attribute PRIMARY KEY (budget_id, attr_name);


--
-- Name: bdgt_attrbt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_attrbt_txcrts ON budget_attribute USING btree (created_tx_stamp);


--
-- Name: bdgt_attrbt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_attrbt_txstmp ON budget_attribute USING btree (last_updated_tx_stamp);


--
-- Name: budget_attr_bdgt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_attr_bdgt ON budget_attribute USING btree (budget_id);


--
-- Name: budget_attribute budget_attr_bdgt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_attribute
    ADD CONSTRAINT budget_attr_bdgt FOREIGN KEY (budget_id) REFERENCES budget(budget_id);


--
-- PostgreSQL database dump complete
--

