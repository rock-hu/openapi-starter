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
-- Name: budget_review; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_review (
    budget_id character varying(20) NOT NULL,
    budget_review_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    budget_review_result_type_id character varying(20) NOT NULL,
    review_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_review OWNER TO ofbiz;

--
-- Name: budget_review pk_budget_review; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_review
    ADD CONSTRAINT pk_budget_review PRIMARY KEY (budget_id, budget_review_id, party_id, budget_review_result_type_id);


--
-- Name: bdgt_rvw_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_rvw_txcrts ON budget_review USING btree (created_tx_stamp);


--
-- Name: bdgt_rvw_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_rvw_txstmp ON budget_review USING btree (last_updated_tx_stamp);


--
-- Name: budget_rvw_bdgt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_rvw_bdgt ON budget_review USING btree (budget_id);


--
-- Name: budget_rvw_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_rvw_party ON budget_review USING btree (party_id);


--
-- Name: budget_rvw_rtype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_rvw_rtype ON budget_review USING btree (budget_review_result_type_id);


--
-- Name: budget_review budget_rvw_bdgt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_review
    ADD CONSTRAINT budget_rvw_bdgt FOREIGN KEY (budget_id) REFERENCES budget(budget_id);


--
-- Name: budget_review budget_rvw_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_review
    ADD CONSTRAINT budget_rvw_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: budget_review budget_rvw_rtype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_review
    ADD CONSTRAINT budget_rvw_rtype FOREIGN KEY (budget_review_result_type_id) REFERENCES budget_review_result_type(budget_review_result_type_id);


--
-- PostgreSQL database dump complete
--

