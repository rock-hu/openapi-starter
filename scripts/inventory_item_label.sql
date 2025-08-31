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
-- Name: inventory_item_label; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_item_label (
    inventory_item_label_id character varying(20) NOT NULL,
    inventory_item_label_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_item_label OWNER TO ofbiz;

--
-- Name: inventory_item_label pk_inventory_item_label; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_label
    ADD CONSTRAINT pk_inventory_item_label PRIMARY KEY (inventory_item_label_id);


--
-- Name: inv_itla_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itla_type ON inventory_item_label USING btree (inventory_item_label_type_id);


--
-- Name: invr_itm_lbl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_lbl_txcrs ON inventory_item_label USING btree (created_tx_stamp);


--
-- Name: invr_itm_lbl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_lbl_txstp ON inventory_item_label USING btree (last_updated_tx_stamp);


--
-- Name: inventory_item_label inv_itla_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_label
    ADD CONSTRAINT inv_itla_type FOREIGN KEY (inventory_item_label_type_id) REFERENCES inventory_item_label_type(inventory_item_label_type_id);


--
-- PostgreSQL database dump complete
--

