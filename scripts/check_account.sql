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
-- Name: check_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE check_account (
    payment_method_id character varying(20) NOT NULL,
    bank_name character varying(100),
    routing_number character varying(60),
    account_type character varying(60),
    account_number character varying(255),
    name_on_account character varying(100),
    company_name_on_account character varying(100),
    contact_mech_id character varying(20),
    branch_code character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.check_account OWNER TO ofbiz;

--
-- Name: check_account pk_check_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY check_account
    ADD CONSTRAINT pk_check_account PRIMARY KEY (payment_method_id);


--
-- Name: cacct_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cacct_cmech ON check_account USING btree (contact_mech_id);


--
-- Name: cacct_paddr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cacct_paddr ON check_account USING btree (contact_mech_id);


--
-- Name: cacct_pmeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cacct_pmeth ON check_account USING btree (payment_method_id);


--
-- Name: chck_accnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX chck_accnt_txcrts ON check_account USING btree (created_tx_stamp);


--
-- Name: chck_accnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX chck_accnt_txstmp ON check_account USING btree (last_updated_tx_stamp);


--
-- Name: check_account cacct_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY check_account
    ADD CONSTRAINT cacct_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: check_account cacct_paddr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY check_account
    ADD CONSTRAINT cacct_paddr FOREIGN KEY (contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: check_account cacct_pmeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY check_account
    ADD CONSTRAINT cacct_pmeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- PostgreSQL database dump complete
--

