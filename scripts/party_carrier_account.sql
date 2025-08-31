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
-- Name: party_carrier_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_carrier_account (
    party_id character varying(20) NOT NULL,
    carrier_party_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    account_number character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_carrier_account OWNER TO ofbiz;

--
-- Name: party_carrier_account pk_party_carrier_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_carrier_account
    ADD CONSTRAINT pk_party_carrier_account PRIMARY KEY (party_id, carrier_party_id, from_date);


--
-- Name: party_crract_cpt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_crract_cpt ON party_carrier_account USING btree (carrier_party_id);


--
-- Name: party_crract_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_crract_pty ON party_carrier_account USING btree (party_id);


--
-- Name: prt_crr_acct_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_crr_acct_txcrs ON party_carrier_account USING btree (created_tx_stamp);


--
-- Name: prt_crr_acct_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_crr_acct_txstp ON party_carrier_account USING btree (last_updated_tx_stamp);


--
-- Name: party_carrier_account party_crract_cpt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_carrier_account
    ADD CONSTRAINT party_crract_cpt FOREIGN KEY (carrier_party_id) REFERENCES party(party_id);


--
-- Name: party_carrier_account party_crract_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_carrier_account
    ADD CONSTRAINT party_crract_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

