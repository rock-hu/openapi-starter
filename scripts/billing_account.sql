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
-- Name: billing_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE billing_account (
    billing_account_id character varying(20) NOT NULL,
    account_limit numeric(18,2),
    account_currency_uom_id character varying(20),
    contact_mech_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    description character varying(255),
    external_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.billing_account OWNER TO ofbiz;

--
-- Name: billing_account pk_billing_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account
    ADD CONSTRAINT pk_billing_account PRIMARY KEY (billing_account_id);


--
-- Name: billacct_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_cmech ON billing_account USING btree (contact_mech_id);


--
-- Name: billacct_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_cuom ON billing_account USING btree (account_currency_uom_id);


--
-- Name: billacct_paddr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX billacct_paddr ON billing_account USING btree (contact_mech_id);


--
-- Name: bllng_accnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bllng_accnt_txcrts ON billing_account USING btree (created_tx_stamp);


--
-- Name: bllng_accnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bllng_accnt_txstmp ON billing_account USING btree (last_updated_tx_stamp);


--
-- Name: billing_account billacct_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account
    ADD CONSTRAINT billacct_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: billing_account billacct_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account
    ADD CONSTRAINT billacct_cuom FOREIGN KEY (account_currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: billing_account billacct_paddr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY billing_account
    ADD CONSTRAINT billacct_paddr FOREIGN KEY (contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- PostgreSQL database dump complete
--

