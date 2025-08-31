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
-- Name: inventory_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_item (
    inventory_item_id character varying(20) NOT NULL,
    inventory_item_type_id character varying(20),
    product_id character varying(20),
    party_id character varying(20),
    owner_party_id character varying(20),
    status_id character varying(20),
    datetime_received timestamp with time zone,
    datetime_manufactured timestamp with time zone,
    expire_date timestamp with time zone,
    facility_id character varying(20),
    container_id character varying(20),
    lot_id character varying(20),
    uom_id character varying(20),
    bin_number character varying(20),
    location_seq_id character varying(20),
    comments character varying(255),
    quantity_on_hand_total numeric(18,6),
    available_to_promise_total numeric(18,6),
    accounting_quantity_total numeric(18,6),
    quantity_on_hand numeric(18,6),
    available_to_promise numeric(18,6),
    serial_number character varying(255),
    soft_identifier character varying(255),
    activation_number character varying(255),
    activation_valid_thru timestamp with time zone,
    unit_cost numeric(18,6),
    currency_uom_id character varying(20),
    fixed_asset_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_item OWNER TO ofbiz;

--
-- Name: inventory_item pk_inventory_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT pk_inventory_item PRIMARY KEY (inventory_item_id);


--
-- Name: inv_item_container; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_container ON inventory_item USING btree (container_id);


--
-- Name: inv_item_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_cuom ON inventory_item USING btree (currency_uom_id);


--
-- Name: inv_item_facility; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_facility ON inventory_item USING btree (facility_id);


--
-- Name: inv_item_lot; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_lot ON inventory_item USING btree (lot_id);


--
-- Name: inv_item_ownparty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_ownparty ON inventory_item USING btree (owner_party_id);


--
-- Name: inv_item_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_party ON inventory_item USING btree (party_id);


--
-- Name: inv_item_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_product ON inventory_item USING btree (product_id);


--
-- Name: inv_item_sn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_sn ON inventory_item USING btree (serial_number);


--
-- Name: inv_item_sttsitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_sttsitm ON inventory_item USING btree (status_id);


--
-- Name: inv_item_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_type ON inventory_item USING btree (inventory_item_type_id);


--
-- Name: inv_item_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_item_uom ON inventory_item USING btree (uom_id);


--
-- Name: invitem_actnm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE UNIQUE INDEX invitem_actnm ON inventory_item USING btree (activation_number);


--
-- Name: invitem_sofid; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE UNIQUE INDEX invitem_sofid ON inventory_item USING btree (soft_identifier);


--
-- Name: invntr_itm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invntr_itm_txcrts ON inventory_item USING btree (created_tx_stamp);


--
-- Name: invntr_itm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invntr_itm_txstmp ON inventory_item USING btree (last_updated_tx_stamp);


--
-- Name: iyim_fast; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX iyim_fast ON inventory_item USING btree (fixed_asset_id);


--
-- Name: inventory_item inv_item_container; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_container FOREIGN KEY (container_id) REFERENCES container(container_id);


--
-- Name: inventory_item inv_item_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: inventory_item inv_item_facility; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_facility FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: inventory_item inv_item_lot; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_lot FOREIGN KEY (lot_id) REFERENCES lot(lot_id);


--
-- Name: inventory_item inv_item_ownparty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_ownparty FOREIGN KEY (owner_party_id) REFERENCES party(party_id);


--
-- Name: inventory_item inv_item_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: inventory_item inv_item_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: inventory_item inv_item_sttsitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_sttsitm FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: inventory_item inv_item_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_type FOREIGN KEY (inventory_item_type_id) REFERENCES inventory_item_type(inventory_item_type_id);


--
-- Name: inventory_item inv_item_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT inv_item_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- Name: inventory_item iyim_fast; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item
    ADD CONSTRAINT iyim_fast FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- PostgreSQL database dump complete
--

