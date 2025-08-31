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
-- Name: order_item_ship_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item_ship_group (
    order_id character varying(20) NOT NULL,
    ship_group_seq_id character varying(20) NOT NULL,
    shipment_method_type_id character varying(20),
    supplier_party_id character varying(20),
    supplier_agreement_id character varying(20),
    vendor_party_id character varying(20),
    carrier_party_id character varying(20),
    carrier_role_type_id character varying(20),
    facility_id character varying(20),
    contact_mech_id character varying(20),
    telecom_contact_mech_id character varying(20),
    tracking_number character varying(60),
    shipping_instructions character varying(255),
    may_split character(1),
    gift_message character varying(255),
    is_gift character(1),
    ship_after_date timestamp with time zone,
    ship_by_date timestamp with time zone,
    estimated_ship_date timestamp with time zone,
    estimated_delivery_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item_ship_group OWNER TO ofbiz;

--
-- Name: order_item_ship_group pk_order_item_ship_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT pk_order_item_ship_group PRIMARY KEY (order_id, ship_group_seq_id);


--
-- Name: order_itsg_cntm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_cntm ON order_item_ship_group USING btree (contact_mech_id);


--
-- Name: order_itsg_cprle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_cprle ON order_item_ship_group USING btree (carrier_party_id, carrier_role_type_id);


--
-- Name: order_itsg_cprty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_cprty ON order_item_ship_group USING btree (carrier_party_id);


--
-- Name: order_itsg_cshm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_cshm ON order_item_ship_group USING btree (shipment_method_type_id, carrier_party_id, carrier_role_type_id);


--
-- Name: order_itsg_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_fac ON order_item_ship_group USING btree (facility_id);


--
-- Name: order_itsg_ordh; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_ordh ON order_item_ship_group USING btree (order_id);


--
-- Name: order_itsg_padr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_padr ON order_item_ship_group USING btree (contact_mech_id);


--
-- Name: order_itsg_sagr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_sagr ON order_item_ship_group USING btree (supplier_agreement_id);


--
-- Name: order_itsg_shmtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_shmtp ON order_item_ship_group USING btree (shipment_method_type_id);


--
-- Name: order_itsg_sprty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_sprty ON order_item_ship_group USING btree (supplier_party_id);


--
-- Name: order_itsg_tcnb; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_tcnb ON order_item_ship_group USING btree (telecom_contact_mech_id);


--
-- Name: order_itsg_tcnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_tcnt ON order_item_ship_group USING btree (telecom_contact_mech_id);


--
-- Name: order_itsg_vprty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_itsg_vprty ON order_item_ship_group USING btree (vendor_party_id);


--
-- Name: orr_itm_shp_grp_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_shp_grp_tp ON order_item_ship_group USING btree (last_updated_tx_stamp);


--
-- Name: orr_itm_shp_grp_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_itm_shp_grp_ts ON order_item_ship_group USING btree (created_tx_stamp);


--
-- Name: order_item_ship_group order_itsg_cntm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_cntm FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: order_item_ship_group order_itsg_cprle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_cprle FOREIGN KEY (carrier_party_id, carrier_role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: order_item_ship_group order_itsg_cprty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_cprty FOREIGN KEY (carrier_party_id) REFERENCES party(party_id);


--
-- Name: order_item_ship_group order_itsg_cshm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_cshm FOREIGN KEY (shipment_method_type_id, carrier_party_id, carrier_role_type_id) REFERENCES carrier_shipment_method(shipment_method_type_id, party_id, role_type_id);


--
-- Name: order_item_ship_group order_itsg_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: order_item_ship_group order_itsg_ordh; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_ordh FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_item_ship_group order_itsg_padr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_padr FOREIGN KEY (contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: order_item_ship_group order_itsg_sagr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_sagr FOREIGN KEY (supplier_agreement_id) REFERENCES agreement(agreement_id);


--
-- Name: order_item_ship_group order_itsg_shmtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_shmtp FOREIGN KEY (shipment_method_type_id) REFERENCES shipment_method_type(shipment_method_type_id);


--
-- Name: order_item_ship_group order_itsg_sprty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_sprty FOREIGN KEY (supplier_party_id) REFERENCES party(party_id);


--
-- Name: order_item_ship_group order_itsg_tcnb; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_tcnb FOREIGN KEY (telecom_contact_mech_id) REFERENCES telecom_number(contact_mech_id);


--
-- Name: order_item_ship_group order_itsg_tcnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_tcnt FOREIGN KEY (telecom_contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: order_item_ship_group order_itsg_vprty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item_ship_group
    ADD CONSTRAINT order_itsg_vprty FOREIGN KEY (vendor_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

