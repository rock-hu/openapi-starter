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
-- Name: budget_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE budget_status (
    budget_id character varying(20) NOT NULL,
    status_id character varying(20) NOT NULL,
    status_date timestamp with time zone,
    comments character varying(255),
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.budget_status OWNER TO ofbiz;

--
-- Name: budget_status pk_budget_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_status
    ADD CONSTRAINT pk_budget_status PRIMARY KEY (budget_id, status_id);


--
-- Name: bdgt_stts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_stts_txcrts ON budget_status USING btree (created_tx_stamp);


--
-- Name: bdgt_stts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bdgt_stts_txstmp ON budget_status USING btree (last_updated_tx_stamp);


--
-- Name: budget_stts_bdgt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_stts_bdgt ON budget_status USING btree (budget_id);


--
-- Name: budget_stts_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_stts_stts ON budget_status USING btree (status_id);


--
-- Name: budget_stts_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX budget_stts_usrlgn ON budget_status USING btree (change_by_user_login_id);


--
-- Name: budget_status budget_stts_bdgt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_status
    ADD CONSTRAINT budget_stts_bdgt FOREIGN KEY (budget_id) REFERENCES budget(budget_id);


--
-- Name: budget_status budget_stts_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_status
    ADD CONSTRAINT budget_stts_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: budget_status budget_stts_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY budget_status
    ADD CONSTRAINT budget_stts_usrlgn FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

