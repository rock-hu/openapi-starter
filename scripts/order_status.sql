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
-- Name: order_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_status (
    order_status_id character varying(20) NOT NULL,
    status_id character varying(20),
    order_id character varying(20),
    order_item_seq_id character varying(20),
    order_payment_preference_id character varying(20),
    status_datetime timestamp with time zone,
    status_user_login character varying(255),
    change_reason character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_status OWNER TO ofbiz;

--
-- Name: order_status pk_order_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_status
    ADD CONSTRAINT pk_order_status PRIMARY KEY (order_status_id);


--
-- Name: order_stts_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_stts_ohdr ON order_status USING btree (order_id);


--
-- Name: order_stts_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_stts_stts ON order_status USING btree (status_id);


--
-- Name: order_stts_user; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_stts_user ON order_status USING btree (status_user_login);


--
-- Name: ordr_stts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_stts_txcrts ON order_status USING btree (created_tx_stamp);


--
-- Name: ordr_stts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_stts_txstmp ON order_status USING btree (last_updated_tx_stamp);


--
-- Name: order_status order_stts_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_status
    ADD CONSTRAINT order_stts_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_status order_stts_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_status
    ADD CONSTRAINT order_stts_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: order_status order_stts_user; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_status
    ADD CONSTRAINT order_stts_user FOREIGN KEY (status_user_login) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

