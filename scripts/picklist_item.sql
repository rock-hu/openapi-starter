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
-- Name: picklist_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE picklist_item (
    picklist_bin_id character varying(20) NOT NULL,
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    ship_group_seq_id character varying(20) NOT NULL,
    inventory_item_id character varying(20) NOT NULL,
    item_status_id character varying(20),
    quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.picklist_item OWNER TO ofbiz;

--
-- Name: picklist_item pk_picklist_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_item
    ADD CONSTRAINT pk_picklist_item PRIMARY KEY (picklist_bin_id, order_id, order_item_seq_id, ship_group_seq_id, inventory_item_id);


--
-- Name: pcklst_itm_bin; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_itm_bin ON picklist_item USING btree (picklist_bin_id);


--
-- Name: pcklst_itm_inv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_itm_inv ON picklist_item USING btree (inventory_item_id);


--
-- Name: pcklst_itm_odit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_itm_odit ON picklist_item USING btree (order_id, order_item_seq_id);


--
-- Name: pcklst_itm_oisg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_itm_oisg ON picklist_item USING btree (order_id, ship_group_seq_id);


--
-- Name: pcklst_itm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_itm_txcrts ON picklist_item USING btree (created_tx_stamp);


--
-- Name: pcklst_itm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pcklst_itm_txstmp ON picklist_item USING btree (last_updated_tx_stamp);


--
-- Name: picklst_itm_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX picklst_itm_stts ON picklist_item USING btree (item_status_id);


--
-- Name: picklist_item pcklst_itm_bin; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_item
    ADD CONSTRAINT pcklst_itm_bin FOREIGN KEY (picklist_bin_id) REFERENCES picklist_bin(picklist_bin_id);


--
-- Name: picklist_item pcklst_itm_inv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_item
    ADD CONSTRAINT pcklst_itm_inv FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: picklist_item pcklst_itm_odit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_item
    ADD CONSTRAINT pcklst_itm_odit FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: picklist_item pcklst_itm_oisg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_item
    ADD CONSTRAINT pcklst_itm_oisg FOREIGN KEY (order_id, ship_group_seq_id) REFERENCES order_item_ship_group(order_id, ship_group_seq_id);


--
-- Name: picklist_item picklst_itm_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY picklist_item
    ADD CONSTRAINT picklst_itm_stts FOREIGN KEY (item_status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

