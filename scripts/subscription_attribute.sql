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
-- Name: subscription_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE subscription_attribute (
    subscription_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.subscription_attribute OWNER TO ofbiz;

--
-- Name: subscription_attribute pk_subscription_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_attribute
    ADD CONSTRAINT pk_subscription_attribute PRIMARY KEY (subscription_id, attr_name);


--
-- Name: sbscrpn_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrpn_attt_txcrs ON subscription_attribute USING btree (created_tx_stamp);


--
-- Name: sbscrpn_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrpn_attt_txstp ON subscription_attribute USING btree (last_updated_tx_stamp);


--
-- Name: subsc_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_attr ON subscription_attribute USING btree (subscription_id);


--
-- Name: subscription_attribute subsc_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_attribute
    ADD CONSTRAINT subsc_attr FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id);


--
-- PostgreSQL database dump complete
--

