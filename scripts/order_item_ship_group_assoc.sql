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
-- Name: order_item_ship_group_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_ship_group_assoc (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    ship_group_seq_id character varying(20) NOT NULL,
    quantity numeric(18,6),
    cancel_quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_ship_group_assoc OWNER TO ofbiz;

--
-- Name: order_item_ship_group_assoc pk_order_item_ship_group_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group_assoc
    ADD CONSTRAINT pk_order_item_ship_group_assoc PRIMARY KEY (order_id, order_item_seq_id, ship_group_seq_id);


--
-- Name: order_isga_oisg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_isga_oisg ON order_item_ship_group_assoc USING btree (order_id, ship_group_seq_id);


--
-- Name: order_isga_ordh; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_isga_ordh ON order_item_ship_group_assoc USING btree (order_id);


--
-- Name: order_isga_ordi; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_isga_ordi ON order_item_ship_group_assoc USING btree (order_id, order_item_seq_id);


--
-- Name: orr_shp_grp_asc_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_shp_grp_asc_tp ON order_item_ship_group_assoc USING btree (last_updated_tx_stamp);


--
-- Name: orr_shp_grp_asc_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_shp_grp_asc_ts ON order_item_ship_group_assoc USING btree (created_tx_stamp);


--
-- Name: order_item_ship_group_assoc order_isga_oisg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group_assoc
    ADD CONSTRAINT order_isga_oisg FOREIGN KEY (order_id, ship_group_seq_id) REFERENCES order_item_ship_group(order_id, ship_group_seq_id);


--
-- Name: order_item_ship_group_assoc order_isga_ordh; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group_assoc
    ADD CONSTRAINT order_isga_ordh FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_item_ship_group_assoc order_isga_ordi; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group_assoc
    ADD CONSTRAINT order_isga_ordi FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- PostgreSQL database dump complete
--

