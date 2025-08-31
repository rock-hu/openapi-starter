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
-- Name: return_item_billing; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE return_item_billing (
    return_id character varying(20) NOT NULL,
    return_item_seq_id character varying(20) NOT NULL,
    invoice_id character varying(20) NOT NULL,
    invoice_item_seq_id character varying(20) NOT NULL,
    shipment_receipt_id character varying(20),
    quantity numeric(18,6),
    amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.return_item_billing OWNER TO ofbiz;

--
-- Name: return_item_billing pk_return_item_billing; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_billing
    ADD CONSTRAINT pk_return_item_billing PRIMARY KEY (return_id, return_item_seq_id, invoice_id, invoice_item_seq_id);


--
-- Name: return_itblng_iitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX return_itblng_iitm ON return_item_billing USING btree (invoice_id, invoice_item_seq_id);


--
-- Name: ritbl_shiprcpt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ritbl_shiprcpt ON return_item_billing USING btree (shipment_receipt_id);


--
-- Name: rtn_itblng_rhdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_itblng_rhdr ON return_item_billing USING btree (return_id);


--
-- Name: rtn_itblng_ritm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_itblng_ritm ON return_item_billing USING btree (return_id, return_item_seq_id);


--
-- Name: rtn_itm_bllg_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_itm_bllg_txcrs ON return_item_billing USING btree (created_tx_stamp);


--
-- Name: rtn_itm_bllg_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_itm_bllg_txstp ON return_item_billing USING btree (last_updated_tx_stamp);


--
-- Name: return_item_billing return_itblng_iitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_billing
    ADD CONSTRAINT return_itblng_iitm FOREIGN KEY (invoice_id, invoice_item_seq_id) REFERENCES invoice_item(invoice_id, invoice_item_seq_id);


--
-- Name: return_item_billing ritbl_shiprcpt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_billing
    ADD CONSTRAINT ritbl_shiprcpt FOREIGN KEY (shipment_receipt_id) REFERENCES shipment_receipt(receipt_id);


--
-- Name: return_item_billing rtn_itblng_rhdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_billing
    ADD CONSTRAINT rtn_itblng_rhdr FOREIGN KEY (return_id) REFERENCES return_header(return_id);


--
-- Name: return_item_billing rtn_itblng_ritm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_billing
    ADD CONSTRAINT rtn_itblng_ritm FOREIGN KEY (return_id, return_item_seq_id) REFERENCES return_item(return_id, return_item_seq_id);


--
-- PostgreSQL database dump complete
--

