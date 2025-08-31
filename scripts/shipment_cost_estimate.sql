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
-- Name: shipment_cost_estimate; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_cost_estimate (
    shipment_cost_estimate_id character varying(20) NOT NULL,
    shipment_method_type_id character varying(20),
    carrier_party_id character varying(20),
    carrier_role_type_id character varying(20),
    product_store_ship_meth_id character varying(20),
    product_store_id character varying(20),
    party_id character varying(20),
    role_type_id character varying(20),
    geo_id_to character varying(20),
    geo_id_from character varying(20),
    weight_break_id character varying(20),
    weight_uom_id character varying(20),
    weight_unit_price numeric(18,2),
    quantity_break_id character varying(20),
    quantity_uom_id character varying(20),
    quantity_unit_price numeric(18,2),
    price_break_id character varying(20),
    price_uom_id character varying(20),
    price_unit_price numeric(18,2),
    order_flat_price numeric(18,2),
    order_price_percent numeric(18,6),
    order_item_flat_price numeric(18,2),
    shipping_price_percent numeric(18,6),
    product_feature_group_id character varying(20),
    oversize_unit numeric(18,6),
    oversize_price numeric(18,2),
    feature_percent numeric(18,6),
    feature_price numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_cost_estimate OWNER TO ofbiz;

--
-- Name: shipment_cost_estimate pk_shipment_cost_estimate; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT pk_shipment_cost_estimate PRIMARY KEY (shipment_cost_estimate_id);


--
-- Name: shpmnt_ce_cshmth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_cshmth ON shipment_cost_estimate USING btree (shipment_method_type_id, carrier_party_id, carrier_role_type_id);


--
-- Name: shpmnt_ce_fgeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_fgeo ON shipment_cost_estimate USING btree (geo_id_from);


--
-- Name: shpmnt_ce_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_party ON shipment_cost_estimate USING btree (party_id);


--
-- Name: shpmnt_ce_prc_qb; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_prc_qb ON shipment_cost_estimate USING btree (price_break_id);


--
-- Name: shpmnt_ce_puom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_puom ON shipment_cost_estimate USING btree (price_uom_id);


--
-- Name: shpmnt_ce_qnt_qb; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_qnt_qb ON shipment_cost_estimate USING btree (quantity_break_id);


--
-- Name: shpmnt_ce_quom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_quom ON shipment_cost_estimate USING btree (quantity_uom_id);


--
-- Name: shpmnt_ce_rolet; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_rolet ON shipment_cost_estimate USING btree (role_type_id);


--
-- Name: shpmnt_ce_tgeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_tgeo ON shipment_cost_estimate USING btree (geo_id_to);


--
-- Name: shpmnt_ce_wht_qb; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_wht_qb ON shipment_cost_estimate USING btree (weight_break_id);


--
-- Name: shpmnt_ce_wuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ce_wuom ON shipment_cost_estimate USING btree (weight_uom_id);


--
-- Name: shpmnt_ps_sh_meth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ps_sh_meth ON shipment_cost_estimate USING btree (product_store_ship_meth_id);


--
-- Name: shpt_cst_est_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_cst_est_txcrs ON shipment_cost_estimate USING btree (created_tx_stamp);


--
-- Name: shpt_cst_est_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpt_cst_est_txstp ON shipment_cost_estimate USING btree (last_updated_tx_stamp);


--
-- Name: shipment_cost_estimate shpmnt_ce_cshmth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_cshmth FOREIGN KEY (shipment_method_type_id, carrier_party_id, carrier_role_type_id) REFERENCES carrier_shipment_method(shipment_method_type_id, party_id, role_type_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_fgeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_fgeo FOREIGN KEY (geo_id_from) REFERENCES geo(geo_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_prc_qb; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_prc_qb FOREIGN KEY (price_break_id) REFERENCES quantity_break(quantity_break_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_puom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_puom FOREIGN KEY (price_uom_id) REFERENCES uom(uom_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_qnt_qb; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_qnt_qb FOREIGN KEY (quantity_break_id) REFERENCES quantity_break(quantity_break_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_quom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_quom FOREIGN KEY (quantity_uom_id) REFERENCES uom(uom_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_rolet; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_rolet FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_tgeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_tgeo FOREIGN KEY (geo_id_to) REFERENCES geo(geo_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_wht_qb; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_wht_qb FOREIGN KEY (weight_break_id) REFERENCES quantity_break(quantity_break_id);


--
-- Name: shipment_cost_estimate shpmnt_ce_wuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ce_wuom FOREIGN KEY (weight_uom_id) REFERENCES uom(uom_id);


--
-- Name: shipment_cost_estimate shpmnt_ps_sh_meth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_cost_estimate
    ADD CONSTRAINT shpmnt_ps_sh_meth FOREIGN KEY (product_store_ship_meth_id) REFERENCES product_store_shipment_meth(product_store_ship_meth_id);


--
-- PostgreSQL database dump complete
--

