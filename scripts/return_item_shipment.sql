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
-- Name: return_item_shipment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE return_item_shipment (
    return_id character varying(20) NOT NULL,
    return_item_seq_id character varying(20) NOT NULL,
    shipment_id character varying(20) NOT NULL,
    shipment_item_seq_id character varying(20) NOT NULL,
    quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.return_item_shipment OWNER TO ofbiz;

--
-- Name: return_item_shipment pk_return_item_shipment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_shipment
    ADD CONSTRAINT pk_return_item_shipment PRIMARY KEY (return_id, return_item_seq_id, shipment_id, shipment_item_seq_id);


--
-- Name: rit_shpmt_rhdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rit_shpmt_rhdr ON return_item_shipment USING btree (return_id);


--
-- Name: rit_shpmt_ritm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rit_shpmt_ritm ON return_item_shipment USING btree (return_id, return_item_seq_id);


--
-- Name: rit_shpmt_shpitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rit_shpmt_shpitm ON return_item_shipment USING btree (shipment_id, shipment_item_seq_id);


--
-- Name: rit_shpmt_shpmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rit_shpmt_shpmt ON return_item_shipment USING btree (shipment_id);


--
-- Name: rtn_itm_shpt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_itm_shpt_txcrs ON return_item_shipment USING btree (created_tx_stamp);


--
-- Name: rtn_itm_shpt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_itm_shpt_txstp ON return_item_shipment USING btree (last_updated_tx_stamp);


--
-- Name: return_item_shipment rit_shpmt_rhdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_shipment
    ADD CONSTRAINT rit_shpmt_rhdr FOREIGN KEY (return_id) REFERENCES return_header(return_id);


--
-- Name: return_item_shipment rit_shpmt_ritm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_shipment
    ADD CONSTRAINT rit_shpmt_ritm FOREIGN KEY (return_id, return_item_seq_id) REFERENCES return_item(return_id, return_item_seq_id);


--
-- Name: return_item_shipment rit_shpmt_shpitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_shipment
    ADD CONSTRAINT rit_shpmt_shpitm FOREIGN KEY (shipment_id, shipment_item_seq_id) REFERENCES shipment_item(shipment_id, shipment_item_seq_id);


--
-- Name: return_item_shipment rit_shpmt_shpmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_item_shipment
    ADD CONSTRAINT rit_shpmt_shpmt FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id);


--
-- PostgreSQL database dump complete
--

