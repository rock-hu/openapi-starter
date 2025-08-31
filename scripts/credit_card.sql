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
-- Name: credit_card; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE credit_card (
    payment_method_id character varying(20) NOT NULL,
    card_type character varying(60),
    card_number character varying(255),
    valid_from_date character varying(7),
    expire_date character varying(7),
    issue_number character varying(7),
    company_name_on_card character varying(100),
    title_on_card character varying(100),
    first_name_on_card character varying(100),
    middle_name_on_card character varying(100),
    last_name_on_card character varying(100),
    suffix_on_card character varying(100),
    contact_mech_id character varying(20),
    consecutive_failed_auths numeric(20,0),
    last_failed_auth_date timestamp with time zone,
    consecutive_failed_nsf numeric(20,0),
    last_failed_nsf_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.credit_card OWNER TO ofbiz;

--
-- Name: credit_card pk_credit_card; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY credit_card
    ADD CONSTRAINT pk_credit_card PRIMARY KEY (payment_method_id);


--
-- Name: credcard_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX credcard_cmech ON credit_card USING btree (contact_mech_id);


--
-- Name: credcard_paddr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX credcard_paddr ON credit_card USING btree (contact_mech_id);


--
-- Name: credcard_pmntmeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX credcard_pmntmeth ON credit_card USING btree (payment_method_id);


--
-- Name: credit_card_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX credit_card_txcrts ON credit_card USING btree (created_tx_stamp);


--
-- Name: credit_card_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX credit_card_txstmp ON credit_card USING btree (last_updated_tx_stamp);


--
-- Name: credit_card credcard_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY credit_card
    ADD CONSTRAINT credcard_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: credit_card credcard_paddr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY credit_card
    ADD CONSTRAINT credcard_paddr FOREIGN KEY (contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: credit_card credcard_pmntmeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY credit_card
    ADD CONSTRAINT credcard_pmntmeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- PostgreSQL database dump complete
--

