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
-- Name: order_item_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_group (
    order_id character varying(20) NOT NULL,
    order_item_group_seq_id character varying(20) NOT NULL,
    parent_group_seq_id character varying(20),
    group_name character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_group OWNER TO ofbiz;

--
-- Name: order_item_group pk_order_item_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_group
    ADD CONSTRAINT pk_order_item_group PRIMARY KEY (order_id, order_item_group_seq_id);


--
-- Name: orderitmgrp_hdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orderitmgrp_hdr ON order_item_group USING btree (order_id);


--
-- Name: orderitmgrp_pgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orderitmgrp_pgrp ON order_item_group USING btree (order_id, parent_group_seq_id);


--
-- Name: orr_itm_grp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_grp_txcrts ON order_item_group USING btree (created_tx_stamp);


--
-- Name: orr_itm_grp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_grp_txstmp ON order_item_group USING btree (last_updated_tx_stamp);


--
-- Name: order_item_group orderitmgrp_hdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_group
    ADD CONSTRAINT orderitmgrp_hdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_item_group orderitmgrp_pgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_group
    ADD CONSTRAINT orderitmgrp_pgrp FOREIGN KEY (order_id, parent_group_seq_id) REFERENCES order_item_group(order_id, order_item_group_seq_id);


--
-- PostgreSQL database dump complete
--

