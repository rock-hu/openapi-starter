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
-- Name: credit_card_type_gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE credit_card_type_gl_account (
    card_type character varying(60) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.credit_card_type_gl_account OWNER TO ofbiz;

--
-- Name: credit_card_type_gl_account pk_credit_card_type_gl_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY credit_card_type_gl_account
    ADD CONSTRAINT pk_credit_card_type_gl_account PRIMARY KEY (card_type, organization_party_id);


--
-- Name: crt_tp_gl_act_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crt_tp_gl_act_tp ON credit_card_type_gl_account USING btree (last_updated_tx_stamp);


--
-- Name: crt_tp_gl_act_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX crt_tp_gl_act_ts ON credit_card_type_gl_account USING btree (created_tx_stamp);


--
-- PostgreSQL database dump complete
--

