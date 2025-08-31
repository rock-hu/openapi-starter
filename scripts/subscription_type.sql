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
-- Name: subscription_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE subscription_type (
    subscription_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.subscription_type OWNER TO ofbiz;

--
-- Name: subscription_type pk_subscription_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_type
    ADD CONSTRAINT pk_subscription_type PRIMARY KEY (subscription_type_id);


--
-- Name: sbscrptn_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrptn_tp_txcrts ON subscription_type USING btree (created_tx_stamp);


--
-- Name: sbscrptn_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrptn_tp_txstmp ON subscription_type USING btree (last_updated_tx_stamp);


--
-- Name: subsc_type_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_type_parent ON subscription_type USING btree (parent_type_id);


--
-- Name: subscription_type subsc_type_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_type
    ADD CONSTRAINT subsc_type_parent FOREIGN KEY (parent_type_id) REFERENCES subscription_type(subscription_type_id);


--
-- PostgreSQL database dump complete
--

