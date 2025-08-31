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
-- Name: subscription_activity; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE subscription_activity (
    subscription_activity_id character varying(20) NOT NULL,
    comments character varying(255),
    date_sent timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.subscription_activity OWNER TO ofbiz;

--
-- Name: subscription_activity pk_subscription_activity; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_activity
    ADD CONSTRAINT pk_subscription_activity PRIMARY KEY (subscription_activity_id);


--
-- Name: sbscrpn_actt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrpn_actt_txcrs ON subscription_activity USING btree (created_tx_stamp);


--
-- Name: sbscrpn_actt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrpn_actt_txstp ON subscription_activity USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

