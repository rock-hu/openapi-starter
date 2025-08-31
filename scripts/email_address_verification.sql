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
-- Name: email_address_verification; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE email_address_verification (
    email_address character varying(255) NOT NULL,
    verify_hash character varying(255),
    expire_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.email_address_verification OWNER TO ofbiz;

--
-- Name: email_address_verification pk_email_address_verification; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY email_address_verification
    ADD CONSTRAINT pk_email_address_verification PRIMARY KEY (email_address);


--
-- Name: email_verify_hash; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE UNIQUE INDEX email_verify_hash ON email_address_verification USING btree (verify_hash);


--
-- Name: eml_adds_vrfn_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_adds_vrfn_txcs ON email_address_verification USING btree (created_tx_stamp);


--
-- Name: eml_adds_vrfn_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX eml_adds_vrfn_txsp ON email_address_verification USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

