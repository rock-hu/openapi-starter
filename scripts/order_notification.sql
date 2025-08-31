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
-- Name: order_notification; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_notification (
    order_notification_id character varying(20) NOT NULL,
    order_id character varying(20),
    email_type character varying(20),
    comments character varying(255),
    notification_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_notification OWNER TO ofbiz;

--
-- Name: order_notification pk_order_notification; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_notification
    ADD CONSTRAINT pk_order_notification PRIMARY KEY (order_notification_id);


--
-- Name: ord_notify_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ord_notify_enum ON order_notification USING btree (email_type);


--
-- Name: ord_notify_ordhdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ord_notify_ordhdr ON order_notification USING btree (order_id);


--
-- Name: ordr_ntfctn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_ntfctn_txcrts ON order_notification USING btree (created_tx_stamp);


--
-- Name: ordr_ntfctn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_ntfctn_txstmp ON order_notification USING btree (last_updated_tx_stamp);


--
-- Name: order_notification ord_notify_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_notification
    ADD CONSTRAINT ord_notify_enum FOREIGN KEY (email_type) REFERENCES enumeration(enum_id);


--
-- Name: order_notification ord_notify_ordhdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_notification
    ADD CONSTRAINT ord_notify_ordhdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- PostgreSQL database dump complete
--

