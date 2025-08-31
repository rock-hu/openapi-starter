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
-- Name: fin_account_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fin_account_status (
    fin_account_id character varying(20) NOT NULL,
    status_id character varying(20) NOT NULL,
    status_date timestamp with time zone NOT NULL,
    status_end_date timestamp with time zone,
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fin_account_status OWNER TO ofbiz;

--
-- Name: fin_account_status pk_fin_account_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_status
    ADD CONSTRAINT pk_fin_account_status PRIMARY KEY (fin_account_id, status_id, status_date);


--
-- Name: finact_stts_fna; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finact_stts_fna ON fin_account_status USING btree (fin_account_id);


--
-- Name: finact_stts_sti; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finact_stts_sti ON fin_account_status USING btree (status_id);


--
-- Name: finact_stts_user; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finact_stts_user ON fin_account_status USING btree (change_by_user_login_id);


--
-- Name: fn_acct_sts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fn_acct_sts_txcrts ON fin_account_status USING btree (created_tx_stamp);


--
-- Name: fn_acct_sts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fn_acct_sts_txstmp ON fin_account_status USING btree (last_updated_tx_stamp);


--
-- Name: fin_account_status finact_stts_fna; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_status
    ADD CONSTRAINT finact_stts_fna FOREIGN KEY (fin_account_id) REFERENCES fin_account(fin_account_id);


--
-- Name: fin_account_status finact_stts_sti; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_status
    ADD CONSTRAINT finact_stts_sti FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: fin_account_status finact_stts_user; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_status
    ADD CONSTRAINT finact_stts_user FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

