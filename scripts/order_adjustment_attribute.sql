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
-- Name: order_adjustment_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_adjustment_attribute (
    order_adjustment_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_adjustment_attribute OWNER TO ofbiz;

--
-- Name: order_adjustment_attribute pk_order_adjustment_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_adjustment_attribute
    ADD CONSTRAINT pk_order_adjustment_attribute PRIMARY KEY (order_adjustment_id, attr_name);


--
-- Name: order_adj_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_adj_attr ON order_adjustment_attribute USING btree (order_adjustment_id);


--
-- Name: orr_adjst_att_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_adjst_att_txcs ON order_adjustment_attribute USING btree (created_tx_stamp);


--
-- Name: orr_adjst_att_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_adjst_att_txsp ON order_adjustment_attribute USING btree (last_updated_tx_stamp);


--
-- Name: order_adjustment_attribute order_adj_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_adjustment_attribute
    ADD CONSTRAINT order_adj_attr FOREIGN KEY (order_adjustment_id) REFERENCES order_adjustment(order_adjustment_id);


--
-- PostgreSQL database dump complete
--

