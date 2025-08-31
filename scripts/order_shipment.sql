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
-- Name: order_shipment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_shipment (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    ship_group_seq_id character varying(20) NOT NULL,
    shipment_id character varying(20) NOT NULL,
    shipment_item_seq_id character varying(20) NOT NULL,
    quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_shipment OWNER TO ofbiz;

--
-- Name: order_shipment pk_order_shipment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_shipment
    ADD CONSTRAINT pk_order_shipment PRIMARY KEY (order_id, order_item_seq_id, ship_group_seq_id, shipment_id, shipment_item_seq_id);


--
-- Name: order_shpmt_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_shpmt_ohdr ON order_shipment USING btree (order_id);


--
-- Name: order_shpmt_shpmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_shpmt_shpmt ON order_shipment USING btree (shipment_id);


--
-- Name: ordr_shpmnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_shpmnt_txcrts ON order_shipment USING btree (created_tx_stamp);


--
-- Name: ordr_shpmnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_shpmnt_txstmp ON order_shipment USING btree (last_updated_tx_stamp);


--
-- Name: order_shipment order_shpmt_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_shipment
    ADD CONSTRAINT order_shpmt_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_shipment order_shpmt_shpmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_shipment
    ADD CONSTRAINT order_shpmt_shpmt FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id);


--
-- PostgreSQL database dump complete
--

