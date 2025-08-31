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
-- Name: communication_event_order; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE communication_event_order (
    order_id character varying(20) NOT NULL,
    communication_event_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.communication_event_order OWNER TO ofbiz;

--
-- Name: communication_event_order pk_communication_event_order; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_order
    ADD CONSTRAINT pk_communication_event_order PRIMARY KEY (order_id, communication_event_id);


--
-- Name: cmmnn_evt_orr_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_orr_txcs ON communication_event_order USING btree (created_tx_stamp);


--
-- Name: cmmnn_evt_orr_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmmnn_evt_orr_txsp ON communication_event_order USING btree (last_updated_tx_stamp);


--
-- Name: comev_order_cmev; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX comev_order_cmev ON communication_event_order USING btree (communication_event_id);


--
-- Name: comev_order_order; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX comev_order_order ON communication_event_order USING btree (order_id);


--
-- Name: communication_event_order comev_order_cmev; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_order
    ADD CONSTRAINT comev_order_cmev FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: communication_event_order comev_order_order; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY communication_event_order
    ADD CONSTRAINT comev_order_order FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- PostgreSQL database dump complete
--

