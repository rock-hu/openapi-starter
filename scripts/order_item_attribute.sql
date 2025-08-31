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
-- Name: order_item_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_attribute (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_attribute OWNER TO ofbiz;

--
-- Name: order_item_attribute pk_order_item_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_attribute
    ADD CONSTRAINT pk_order_item_attribute PRIMARY KEY (order_id, order_item_seq_id, attr_name);


--
-- Name: order_item_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_attr ON order_item_attribute USING btree (order_id, order_item_seq_id);


--
-- Name: orr_itm_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_attt_txcrs ON order_item_attribute USING btree (created_tx_stamp);


--
-- Name: orr_itm_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_attt_txstp ON order_item_attribute USING btree (last_updated_tx_stamp);


--
-- Name: order_item_attribute order_item_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_attribute
    ADD CONSTRAINT order_item_attr FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- PostgreSQL database dump complete
--

