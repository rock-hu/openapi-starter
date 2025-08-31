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
-- Name: order_item_billing; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_billing (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    invoice_id character varying(20) NOT NULL,
    invoice_item_seq_id character varying(20) NOT NULL,
    item_issuance_id character varying(20),
    shipment_receipt_id character varying(20),
    quantity numeric(18,6),
    amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_billing OWNER TO ofbiz;

--
-- Name: order_item_billing pk_order_item_billing; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_billing
    ADD CONSTRAINT pk_order_item_billing PRIMARY KEY (order_id, order_item_seq_id, invoice_id, invoice_item_seq_id);


--
-- Name: order_itbl_shiprcp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itbl_shiprcp ON order_item_billing USING btree (shipment_receipt_id);


--
-- Name: order_itblng_iiss; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itblng_iiss ON order_item_billing USING btree (item_issuance_id);


--
-- Name: order_itblng_iitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itblng_iitm ON order_item_billing USING btree (invoice_id, invoice_item_seq_id);


--
-- Name: order_itblng_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itblng_ohdr ON order_item_billing USING btree (order_id);


--
-- Name: order_itblng_oitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itblng_oitm ON order_item_billing USING btree (order_id, order_item_seq_id);


--
-- Name: orr_itm_bllg_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_bllg_txcrs ON order_item_billing USING btree (created_tx_stamp);


--
-- Name: orr_itm_bllg_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_bllg_txstp ON order_item_billing USING btree (last_updated_tx_stamp);


--
-- Name: order_item_billing order_itbl_shiprcp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_billing
    ADD CONSTRAINT order_itbl_shiprcp FOREIGN KEY (shipment_receipt_id) REFERENCES shipment_receipt(receipt_id);


--
-- Name: order_item_billing order_itblng_iiss; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_billing
    ADD CONSTRAINT order_itblng_iiss FOREIGN KEY (item_issuance_id) REFERENCES item_issuance(item_issuance_id);


--
-- Name: order_item_billing order_itblng_iitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_billing
    ADD CONSTRAINT order_itblng_iitm FOREIGN KEY (invoice_id, invoice_item_seq_id) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- Name: order_item_billing order_itblng_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_billing
    ADD CONSTRAINT order_itblng_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_item_billing order_itblng_oitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_billing
    ADD CONSTRAINT order_itblng_oitm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- PostgreSQL database dump complete
--

