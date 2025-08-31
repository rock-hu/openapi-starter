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
-- Name: inventory_item_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_item_attribute (
    inventory_item_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_item_attribute OWNER TO ofbiz;

--
-- Name: inventory_item_attribute pk_inventory_item_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_attribute
    ADD CONSTRAINT pk_inventory_item_attribute PRIMARY KEY (inventory_item_id, attr_name);


--
-- Name: inv_item_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_attr ON inventory_item_attribute USING btree (inventory_item_id);


--
-- Name: invr_itm_attt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_attt_txcs ON inventory_item_attribute USING btree (created_tx_stamp);


--
-- Name: invr_itm_attt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_attt_txsp ON inventory_item_attribute USING btree (last_updated_tx_stamp);


--
-- Name: inventory_item_attribute inv_item_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_attribute
    ADD CONSTRAINT inv_item_attr FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- PostgreSQL database dump complete
--

