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
-- Name: work_order_item_fulfillment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE work_order_item_fulfillment (
    work_effort_id character varying(20) NOT NULL,
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    ship_group_seq_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.work_order_item_fulfillment OWNER TO ofbiz;

--
-- Name: work_order_item_fulfillment pk_work_order_item_fulfillment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_order_item_fulfillment
    ADD CONSTRAINT pk_work_order_item_fulfillment PRIMARY KEY (work_effort_id, order_id, order_item_seq_id);


--
-- Name: worder_itfmt_ohdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX worder_itfmt_ohdr ON work_order_item_fulfillment USING btree (order_id);


--
-- Name: worder_itfmt_oitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX worder_itfmt_oitm ON work_order_item_fulfillment USING btree (order_id, order_item_seq_id);


--
-- Name: worder_itfmt_wefrt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX worder_itfmt_wefrt ON work_order_item_fulfillment USING btree (work_effort_id);


--
-- Name: wrk_orr_itm_flt_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_orr_itm_flt_tp ON work_order_item_fulfillment USING btree (last_updated_tx_stamp);


--
-- Name: wrk_orr_itm_flt_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wrk_orr_itm_flt_ts ON work_order_item_fulfillment USING btree (created_tx_stamp);


--
-- Name: work_order_item_fulfillment worder_itfmt_ohdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_order_item_fulfillment
    ADD CONSTRAINT worder_itfmt_ohdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: work_order_item_fulfillment worder_itfmt_oitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_order_item_fulfillment
    ADD CONSTRAINT worder_itfmt_oitm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: work_order_item_fulfillment worder_itfmt_wefrt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY work_order_item_fulfillment
    ADD CONSTRAINT worder_itfmt_wefrt FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

