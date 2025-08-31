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
-- Name: inventory_item_detail; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE inventory_item_detail (
    inventory_item_id character varying(20) NOT NULL,
    inventory_item_detail_seq_id character varying(20) NOT NULL,
    effective_date timestamp with time zone,
    quantity_on_hand_diff numeric(18,6),
    available_to_promise_diff numeric(18,6),
    accounting_quantity_diff numeric(18,6),
    unit_cost numeric(18,6),
    order_id character varying(20),
    order_item_seq_id character varying(20),
    ship_group_seq_id character varying(20),
    shipment_id character varying(20),
    shipment_item_seq_id character varying(20),
    return_id character varying(20),
    return_item_seq_id character varying(20),
    work_effort_id character varying(20),
    fixed_asset_id character varying(20),
    maint_hist_seq_id character varying(20),
    item_issuance_id character varying(20),
    receipt_id character varying(20),
    physical_inventory_id character varying(20),
    reason_enum_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.inventory_item_detail OWNER TO ofbiz;

--
-- Name: inventory_item_detail pk_inventory_item_detail; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_detail
    ADD CONSTRAINT pk_inventory_item_detail PRIMARY KEY (inventory_item_id, inventory_item_detail_seq_id);


--
-- Name: inv_itdtl_famnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itdtl_famnt ON inventory_item_detail USING btree (fixed_asset_id, maint_hist_seq_id);


--
-- Name: inv_itdtl_invit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itdtl_invit ON inventory_item_detail USING btree (inventory_item_id);


--
-- Name: inv_itdtl_itmis; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itdtl_itmis ON inventory_item_detail USING btree (item_issuance_id);


--
-- Name: inv_itdtl_phinv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itdtl_phinv ON inventory_item_detail USING btree (physical_inventory_id);


--
-- Name: inv_itdtl_reas; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itdtl_reas ON inventory_item_detail USING btree (reason_enum_id);


--
-- Name: inv_itdtl_shrct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itdtl_shrct ON inventory_item_detail USING btree (receipt_id);


--
-- Name: inv_itdtl_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_itdtl_weff ON inventory_item_detail USING btree (work_effort_id);


--
-- Name: invr_itm_dtl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_dtl_txcrs ON inventory_item_detail USING btree (created_tx_stamp);


--
-- Name: invr_itm_dtl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invr_itm_dtl_txstp ON inventory_item_detail USING btree (last_updated_tx_stamp);


--
-- Name: inventory_item_detail inv_itdtl_famnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_detail
    ADD CONSTRAINT inv_itdtl_famnt FOREIGN KEY (fixed_asset_id, maint_hist_seq_id) REFERENCES fixed_asset_maint(fixed_asset_id, maint_hist_seq_id);


--
-- Name: inventory_item_detail inv_itdtl_invit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_detail
    ADD CONSTRAINT inv_itdtl_invit FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: inventory_item_detail inv_itdtl_itmis; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_detail
    ADD CONSTRAINT inv_itdtl_itmis FOREIGN KEY (item_issuance_id) REFERENCES item_issuance(item_issuance_id);


--
-- Name: inventory_item_detail inv_itdtl_phinv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_detail
    ADD CONSTRAINT inv_itdtl_phinv FOREIGN KEY (physical_inventory_id) REFERENCES physical_inventory(physical_inventory_id);


--
-- Name: inventory_item_detail inv_itdtl_reas; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_detail
    ADD CONSTRAINT inv_itdtl_reas FOREIGN KEY (reason_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: inventory_item_detail inv_itdtl_shrct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_detail
    ADD CONSTRAINT inv_itdtl_shrct FOREIGN KEY (receipt_id) REFERENCES shipment_receipt(receipt_id);


--
-- Name: inventory_item_detail inv_itdtl_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY inventory_item_detail
    ADD CONSTRAINT inv_itdtl_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

