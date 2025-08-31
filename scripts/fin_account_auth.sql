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
-- Name: fin_account_auth; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fin_account_auth (
    fin_account_auth_id character varying(20) NOT NULL,
    fin_account_id character varying(20),
    amount numeric(18,2),
    currency_uom_id character varying(20),
    authorization_date timestamp with time zone,
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fin_account_auth OWNER TO ofbiz;

--
-- Name: fin_account_auth pk_fin_account_auth; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_auth
    ADD CONSTRAINT pk_fin_account_auth PRIMARY KEY (fin_account_auth_id);


--
-- Name: finact_auth_finact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX finact_auth_finact ON fin_account_auth USING btree (fin_account_id);


--
-- Name: fn_acct_ath_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fn_acct_ath_txcrts ON fin_account_auth USING btree (created_tx_stamp);


--
-- Name: fn_acct_ath_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fn_acct_ath_txstmp ON fin_account_auth USING btree (last_updated_tx_stamp);


--
-- Name: fin_account_auth finact_auth_finact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fin_account_auth
    ADD CONSTRAINT finact_auth_finact FOREIGN KEY (fin_account_id) REFERENCES fin_account(fin_account_id);


--
-- PostgreSQL database dump complete
--

