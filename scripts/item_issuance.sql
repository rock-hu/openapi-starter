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
-- Name: item_issuance; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE item_issuance (
    item_issuance_id character varying(20) NOT NULL,
    order_id character varying(20),
    order_item_seq_id character varying(20),
    ship_group_seq_id character varying(20),
    inventory_item_id character varying(20),
    shipment_id character varying(20),
    shipment_item_seq_id character varying(20),
    fixed_asset_id character varying(20),
    maint_hist_seq_id character varying(20),
    issued_date_time timestamp with time zone,
    issued_by_user_login_id character varying(255),
    quantity numeric(18,6),
    cancel_quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.item_issuance OWNER TO ofbiz;

--
-- Name: item_issuance pk_item_issuance; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance
    ADD CONSTRAINT pk_item_issuance PRIMARY KEY (item_issuance_id);


--
-- Name: item_iss_famnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX item_iss_famnt ON item_issuance USING btree (fixed_asset_id, maint_hist_seq_id);


--
-- Name: item_iss_ibul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX item_iss_ibul ON item_issuance USING btree (issued_by_user_login_id);


--
-- Name: item_iss_invitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX item_iss_invitm ON item_issuance USING btree (inventory_item_id);


--
-- Name: item_iss_oritm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX item_iss_oritm ON item_issuance USING btree (order_id, order_item_seq_id);


--
-- Name: item_iss_shitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX item_iss_shitm ON item_issuance USING btree (shipment_id, shipment_item_seq_id);


--
-- Name: itm_issnc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX itm_issnc_txcrts ON item_issuance USING btree (created_tx_stamp);


--
-- Name: itm_issnc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX itm_issnc_txstmp ON item_issuance USING btree (last_updated_tx_stamp);


--
-- Name: item_issuance item_iss_famnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance
    ADD CONSTRAINT item_iss_famnt FOREIGN KEY (fixed_asset_id, maint_hist_seq_id) REFERENCES fixed_asset_maint(fixed_asset_id, maint_hist_seq_id);


--
-- Name: item_issuance item_iss_ibul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance
    ADD CONSTRAINT item_iss_ibul FOREIGN KEY (issued_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: item_issuance item_iss_invitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance
    ADD CONSTRAINT item_iss_invitm FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: item_issuance item_iss_oritm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance
    ADD CONSTRAINT item_iss_oritm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: item_issuance item_iss_shitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY item_issuance
    ADD CONSTRAINT item_iss_shitm FOREIGN KEY (shipment_id, shipment_item_seq_id) REFERENCES shipment_item(shipment_id, shipment_item_seq_id);


--
-- PostgreSQL database dump complete
--

