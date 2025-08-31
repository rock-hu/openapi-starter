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
-- Name: order_item_ship_grp_inv_res; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_ship_grp_inv_res (
    order_id character varying(20) NOT NULL,
    ship_group_seq_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    inventory_item_id character varying(20) NOT NULL,
    reserve_order_enum_id character varying(20),
    quantity numeric(18,6),
    quantity_not_available numeric(18,6),
    reserved_datetime timestamp with time zone,
    created_datetime timestamp with time zone,
    promised_datetime timestamp with time zone,
    current_promised_date timestamp with time zone,
    priority character(1),
    sequence_id numeric(20,0),
    pick_start_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_ship_grp_inv_res OWNER TO ofbiz;

--
-- Name: order_item_ship_grp_inv_res pk_order_item_ship_grp_inv_res; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_grp_inv_res
    ADD CONSTRAINT pk_order_item_ship_grp_inv_res PRIMARY KEY (order_id, ship_group_seq_id, order_item_seq_id, inventory_item_id);


--
-- Name: order_itir_invitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itir_invitm ON order_item_ship_grp_inv_res USING btree (inventory_item_id);


--
-- Name: order_itir_oitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itir_oitm ON order_item_ship_grp_inv_res USING btree (order_id, order_item_seq_id);


--
-- Name: orr_grp_inv_rs_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_grp_inv_rs_tp ON order_item_ship_grp_inv_res USING btree (last_updated_tx_stamp);


--
-- Name: orr_grp_inv_rs_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_grp_inv_rs_ts ON order_item_ship_grp_inv_res USING btree (created_tx_stamp);


--
-- Name: order_item_ship_grp_inv_res order_itir_invitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_grp_inv_res
    ADD CONSTRAINT order_itir_invitm FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: order_item_ship_grp_inv_res order_itir_oitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_grp_inv_res
    ADD CONSTRAINT order_itir_oitm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- PostgreSQL database dump complete
--

