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
-- Name: order_adjustment_billing; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_adjustment_billing (
    order_adjustment_id character varying(20) NOT NULL,
    invoice_id character varying(20) NOT NULL,
    invoice_item_seq_id character varying(20) NOT NULL,
    amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_adjustment_billing OWNER TO ofbiz;

--
-- Name: order_adjustment_billing pk_order_adjustment_billing; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_adjustment_billing
    ADD CONSTRAINT pk_order_adjustment_billing PRIMARY KEY (order_adjustment_id, invoice_id, invoice_item_seq_id);


--
-- Name: order_adjblng_iitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_adjblng_iitm ON order_adjustment_billing USING btree (invoice_id, invoice_item_seq_id);


--
-- Name: order_adjblng_oa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_adjblng_oa ON order_adjustment_billing USING btree (order_adjustment_id);


--
-- Name: orr_adjst_blg_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_adjst_blg_txcs ON order_adjustment_billing USING btree (created_tx_stamp);


--
-- Name: orr_adjst_blg_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_adjst_blg_txsp ON order_adjustment_billing USING btree (last_updated_tx_stamp);


--
-- Name: order_adjustment_billing order_adjblng_iitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_adjustment_billing
    ADD CONSTRAINT order_adjblng_iitm FOREIGN KEY (invoice_id, invoice_item_seq_id) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- Name: order_adjustment_billing order_adjblng_oa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_adjustment_billing
    ADD CONSTRAINT order_adjblng_oa FOREIGN KEY (order_adjustment_id) REFERENCES order_adjustment(order_adjustment_id);


--
-- PostgreSQL database dump complete
--

