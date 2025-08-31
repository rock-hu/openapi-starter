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
-- Name: eft_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE eft_account (
    payment_method_id character varying(20) NOT NULL,
    bank_name character varying(100),
    routing_number character varying(60),
    account_type character varying(60),
    account_number character varying(255),
    name_on_account character varying(100),
    company_name_on_account character varying(100),
    contact_mech_id character varying(20),
    years_at_bank numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.eft_account OWNER TO ofbiz;

--
-- Name: eft_account pk_eft_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY eft_account
    ADD CONSTRAINT pk_eft_account PRIMARY KEY (payment_method_id);


--
-- Name: eft_account_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eft_account_txcrts ON eft_account USING btree (created_tx_stamp);


--
-- Name: eft_account_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eft_account_txstmp ON eft_account USING btree (last_updated_tx_stamp);


--
-- Name: eftacct_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eftacct_cmech ON eft_account USING btree (contact_mech_id);


--
-- Name: eftacct_paddr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eftacct_paddr ON eft_account USING btree (contact_mech_id);


--
-- Name: eftacct_pmeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eftacct_pmeth ON eft_account USING btree (payment_method_id);


--
-- Name: eft_account eftacct_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY eft_account
    ADD CONSTRAINT eftacct_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: eft_account eftacct_paddr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY eft_account
    ADD CONSTRAINT eftacct_paddr FOREIGN KEY (contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: eft_account eftacct_pmeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY eft_account
    ADD CONSTRAINT eftacct_pmeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- PostgreSQL database dump complete
--

