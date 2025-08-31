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
-- Name: inventory_item_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_item_type_attr (
    inventory_item_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_item_type_attr OWNER TO ofbiz;

--
-- Name: inventory_item_type_attr pk_inventory_item_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_type_attr
    ADD CONSTRAINT pk_inventory_item_type_attr PRIMARY KEY (inventory_item_type_id, attr_name);


--
-- Name: inr_itm_tp_atr_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inr_itm_tp_atr_txp ON inventory_item_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: inr_itm_tp_atr_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inr_itm_tp_atr_txs ON inventory_item_type_attr USING btree (created_tx_stamp);


--
-- Name: inv_item_typ_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_typ_attr ON inventory_item_type_attr USING btree (inventory_item_type_id);


--
-- Name: inventory_item_type_attr inv_item_typ_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_type_attr
    ADD CONSTRAINT inv_item_typ_attr FOREIGN KEY (inventory_item_type_id) REFERENCES inventory_item_type(inventory_item_type_id);


--
-- PostgreSQL database dump complete
--

