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
-- Name: order_delivery_schedule; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_delivery_schedule (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    estimated_ready_date timestamp with time zone,
    cartons numeric(20,0),
    skids_pallets numeric(20,0),
    units_pieces numeric(18,6),
    total_cubic_size numeric(18,6),
    total_cubic_uom_id character varying(20),
    total_weight numeric(18,6),
    total_weight_uom_id character varying(20),
    status_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_delivery_schedule OWNER TO ofbiz;

--
-- Name: order_delivery_schedule pk_order_delivery_schedule; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_delivery_schedule
    ADD CONSTRAINT pk_order_delivery_schedule PRIMARY KEY (order_id, order_item_seq_id);


--
-- Name: order_delsch_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_delsch_ohdr ON order_delivery_schedule USING btree (order_id);


--
-- Name: order_delsch_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_delsch_stts ON order_delivery_schedule USING btree (status_id);


--
-- Name: order_delsch_tcuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_delsch_tcuom ON order_delivery_schedule USING btree (total_cubic_uom_id);


--
-- Name: order_delsch_twuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_delsch_twuom ON order_delivery_schedule USING btree (total_weight_uom_id);


--
-- Name: orr_dlr_schl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_dlr_schl_txcrs ON order_delivery_schedule USING btree (created_tx_stamp);


--
-- Name: orr_dlr_schl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_dlr_schl_txstp ON order_delivery_schedule USING btree (last_updated_tx_stamp);


--
-- Name: order_delivery_schedule order_delsch_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_delivery_schedule
    ADD CONSTRAINT order_delsch_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_delivery_schedule order_delsch_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_delivery_schedule
    ADD CONSTRAINT order_delsch_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: order_delivery_schedule order_delsch_tcuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_delivery_schedule
    ADD CONSTRAINT order_delsch_tcuom FOREIGN KEY (total_cubic_uom_id) REFERENCES uom(uom_id);


--
-- Name: order_delivery_schedule order_delsch_twuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_delivery_schedule
    ADD CONSTRAINT order_delsch_twuom FOREIGN KEY (total_weight_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

