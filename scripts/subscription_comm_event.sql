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
-- Name: subscription_comm_event; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE subscription_comm_event (
    subscription_id character varying(20) NOT NULL,
    communication_event_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.subscription_comm_event OWNER TO ofbiz;

--
-- Name: subscription_comm_event pk_subscription_comm_event; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_comm_event
    ADD CONSTRAINT pk_subscription_comm_event PRIMARY KEY (subscription_id, communication_event_id);


--
-- Name: sbscn_cmm_evt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscn_cmm_evt_txcs ON subscription_comm_event USING btree (created_tx_stamp);


--
-- Name: sbscn_cmm_evt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscn_cmm_evt_txsp ON subscription_comm_event USING btree (last_updated_tx_stamp);


--
-- Name: subsc_com_event; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_com_event ON subscription_comm_event USING btree (communication_event_id);


--
-- Name: subsc_subsc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_subsc ON subscription_comm_event USING btree (subscription_id);


--
-- Name: subscription_comm_event subsc_com_event; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_comm_event
    ADD CONSTRAINT subsc_com_event FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: subscription_comm_event subsc_subsc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_comm_event
    ADD CONSTRAINT subsc_subsc FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id);


--
-- PostgreSQL database dump complete
--

