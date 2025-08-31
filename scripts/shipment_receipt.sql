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
-- Name: shipment_receipt; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_receipt (
    receipt_id character varying(20) NOT NULL,
    inventory_item_id character varying(20),
    product_id character varying(20),
    shipment_id character varying(20),
    shipment_item_seq_id character varying(20),
    shipment_package_seq_id character varying(20),
    order_id character varying(20),
    order_item_seq_id character varying(20),
    return_id character varying(20),
    return_item_seq_id character varying(20),
    rejection_id character varying(20),
    received_by_user_login_id character varying(255),
    datetime_received timestamp with time zone,
    item_description character varying(255),
    quantity_accepted numeric(18,6),
    quantity_rejected numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_receipt OWNER TO ofbiz;

--
-- Name: shipment_receipt pk_shipment_receipt; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt
    ADD CONSTRAINT pk_shipment_receipt PRIMARY KEY (receipt_id);


--
-- Name: shp_rcpt_invitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcpt_invitm ON shipment_receipt USING btree (inventory_item_id);


--
-- Name: shp_rcpt_orditm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcpt_orditm ON shipment_receipt USING btree (order_id, order_item_seq_id);


--
-- Name: shp_rcpt_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcpt_prod ON shipment_receipt USING btree (product_id);


--
-- Name: shp_rcpt_rejrsn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcpt_rejrsn ON shipment_receipt USING btree (rejection_id);


--
-- Name: shp_rcpt_retinvitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcpt_retinvitm ON shipment_receipt USING btree (return_id, return_item_seq_id);


--
-- Name: shp_rcpt_shpkg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcpt_shpkg ON shipment_receipt USING btree (shipment_id, shipment_package_seq_id);


--
-- Name: shp_rcpt_userlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shp_rcpt_userlgn ON shipment_receipt USING btree (received_by_user_login_id);


--
-- Name: shpmnt_rcpt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_rcpt_txcrts ON shipment_receipt USING btree (created_tx_stamp);


--
-- Name: shpmnt_rcpt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_rcpt_txstmp ON shipment_receipt USING btree (last_updated_tx_stamp);


--
-- Name: shipment_receipt shp_rcpt_invitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt
    ADD CONSTRAINT shp_rcpt_invitm FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: shipment_receipt shp_rcpt_orditm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt
    ADD CONSTRAINT shp_rcpt_orditm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: shipment_receipt shp_rcpt_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt
    ADD CONSTRAINT shp_rcpt_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: shipment_receipt shp_rcpt_rejrsn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt
    ADD CONSTRAINT shp_rcpt_rejrsn FOREIGN KEY (rejection_id) REFERENCES rejection_reason(rejection_id);


--
-- Name: shipment_receipt shp_rcpt_retinvitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt
    ADD CONSTRAINT shp_rcpt_retinvitm FOREIGN KEY (return_id, return_item_seq_id) REFERENCES return_item(return_id, return_item_seq_id);


--
-- Name: shipment_receipt shp_rcpt_shpkg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt
    ADD CONSTRAINT shp_rcpt_shpkg FOREIGN KEY (shipment_id, shipment_package_seq_id) REFERENCES shipment_package(shipment_id, shipment_package_seq_id);


--
-- Name: shipment_receipt shp_rcpt_userlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_receipt
    ADD CONSTRAINT shp_rcpt_userlgn FOREIGN KEY (received_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

