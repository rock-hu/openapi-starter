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
-- Name: order_item_group_order; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_group_order (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    group_order_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_group_order OWNER TO ofbiz;

--
-- Name: order_item_group_order pk_order_item_group_order; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_group_order
    ADD CONSTRAINT pk_order_item_group_order PRIMARY KEY (order_id, order_item_seq_id, group_order_id);


--
-- Name: oigo_group_order; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX oigo_group_order ON order_item_group_order USING btree (group_order_id);


--
-- Name: oigo_order_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX oigo_order_item ON order_item_group_order USING btree (order_id, order_item_seq_id);


--
-- Name: orr_itm_grp_orr_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_grp_orr_tp ON order_item_group_order USING btree (last_updated_tx_stamp);


--
-- Name: orr_itm_grp_orr_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_grp_orr_ts ON order_item_group_order USING btree (created_tx_stamp);


--
-- Name: order_item_group_order oigo_group_order; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_group_order
    ADD CONSTRAINT oigo_group_order FOREIGN KEY (group_order_id) REFERENCES product_group_order(group_order_id);


--
-- Name: order_item_group_order oigo_order_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_group_order
    ADD CONSTRAINT oigo_order_item FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- PostgreSQL database dump complete
--

