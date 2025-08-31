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
-- Name: subscription_fulfillment_piece; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE subscription_fulfillment_piece (
    subscription_activity_id character varying(20) NOT NULL,
    subscription_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.subscription_fulfillment_piece OWNER TO ofbiz;

--
-- Name: subscription_fulfillment_piece pk_subscription_fulfillment_pi; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_fulfillment_piece
    ADD CONSTRAINT pk_subscription_fulfillment_pi PRIMARY KEY (subscription_activity_id, subscription_id);


--
-- Name: sbscn_flflt_pc_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscn_flflt_pc_txp ON subscription_fulfillment_piece USING btree (last_updated_tx_stamp);


--
-- Name: sbscn_flflt_pc_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscn_flflt_pc_txs ON subscription_fulfillment_piece USING btree (created_tx_stamp);


--
-- Name: subsc_fp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_fp ON subscription_fulfillment_piece USING btree (subscription_id);


--
-- Name: subsc_fp_act; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_fp_act ON subscription_fulfillment_piece USING btree (subscription_activity_id);


--
-- Name: subscription_fulfillment_piece subsc_fp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_fulfillment_piece
    ADD CONSTRAINT subsc_fp FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id);


--
-- Name: subscription_fulfillment_piece subsc_fp_act; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription_fulfillment_piece
    ADD CONSTRAINT subsc_fp_act FOREIGN KEY (subscription_activity_id) REFERENCES subscription_activity(subscription_activity_id);


--
-- PostgreSQL database dump complete
--

