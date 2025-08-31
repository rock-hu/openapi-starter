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
-- Name: shipment_route_segment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment_route_segment (
    shipment_id character varying(20) NOT NULL,
    shipment_route_segment_id character varying(20) NOT NULL,
    delivery_id character varying(20),
    origin_facility_id character varying(20),
    dest_facility_id character varying(20),
    origin_contact_mech_id character varying(20),
    origin_telecom_number_id character varying(20),
    dest_contact_mech_id character varying(20),
    dest_telecom_number_id character varying(20),
    carrier_party_id character varying(20),
    shipment_method_type_id character varying(20),
    carrier_service_status_id character varying(20),
    carrier_delivery_zone character varying(60),
    carrier_restriction_codes character varying(60),
    carrier_restriction_desc text,
    billing_weight numeric(18,6),
    billing_weight_uom_id character varying(20),
    actual_transport_cost numeric(18,2),
    actual_service_cost numeric(18,2),
    actual_other_cost numeric(18,2),
    actual_cost numeric(18,2),
    currency_uom_id character varying(20),
    actual_start_date timestamp with time zone,
    actual_arrival_date timestamp with time zone,
    estimated_start_date timestamp with time zone,
    estimated_arrival_date timestamp with time zone,
    tracking_id_number character varying(60),
    tracking_digest text,
    updated_by_user_login_id character varying(255),
    last_updated_date timestamp with time zone,
    home_delivery_type character varying(20),
    home_delivery_date timestamp with time zone,
    third_party_account_number character varying(20),
    third_party_postal_code character varying(20),
    third_party_country_geo_code character varying(20),
    ups_high_value_report bytea,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment_route_segment OWNER TO ofbiz;

--
-- Name: shipment_route_segment pk_shipment_route_segment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT pk_shipment_route_segment PRIMARY KEY (shipment_id, shipment_route_segment_id);


--
-- Name: shpkrtsg_bwuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpkrtsg_bwuom ON shipment_route_segment USING btree (billing_weight_uom_id);


--
-- Name: shpkrtsg_cssts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpkrtsg_cssts ON shipment_route_segment USING btree (carrier_service_status_id);


--
-- Name: shpmt_rt_sgt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rt_sgt_txcrs ON shipment_route_segment USING btree (created_tx_stamp);


--
-- Name: shpmt_rt_sgt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rt_sgt_txstp ON shipment_route_segment USING btree (last_updated_tx_stamp);


--
-- Name: shpmt_rtseg_cpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_cpty ON shipment_route_segment USING btree (carrier_party_id);


--
-- Name: shpmt_rtseg_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_cuom ON shipment_route_segment USING btree (currency_uom_id);


--
-- Name: shpmt_rtseg_del; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_del ON shipment_route_segment USING btree (delivery_id);


--
-- Name: shpmt_rtseg_dfac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_dfac ON shipment_route_segment USING btree (dest_facility_id);


--
-- Name: shpmt_rtseg_dpad; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_dpad ON shipment_route_segment USING btree (dest_contact_mech_id);


--
-- Name: shpmt_rtseg_dtcn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_dtcn ON shipment_route_segment USING btree (dest_telecom_number_id);


--
-- Name: shpmt_rtseg_ofac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_ofac ON shipment_route_segment USING btree (origin_facility_id);


--
-- Name: shpmt_rtseg_opad; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_opad ON shipment_route_segment USING btree (origin_contact_mech_id);


--
-- Name: shpmt_rtseg_otcn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_otcn ON shipment_route_segment USING btree (origin_telecom_number_id);


--
-- Name: shpmt_rtseg_shmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_shmt ON shipment_route_segment USING btree (shipment_method_type_id);


--
-- Name: shpmt_rtseg_shpmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmt_rtseg_shpmt ON shipment_route_segment USING btree (shipment_id);


--
-- Name: shipment_route_segment shpkrtsg_bwuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpkrtsg_bwuom FOREIGN KEY (billing_weight_uom_id) REFERENCES uom(uom_id);


--
-- Name: shipment_route_segment shpkrtsg_cssts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpkrtsg_cssts FOREIGN KEY (carrier_service_status_id) REFERENCES status_item(status_id);


--
-- Name: shipment_route_segment shpmt_rtseg_cpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_cpty FOREIGN KEY (carrier_party_id) REFERENCES party(party_id);


--
-- Name: shipment_route_segment shpmt_rtseg_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: shipment_route_segment shpmt_rtseg_del; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_del FOREIGN KEY (delivery_id) REFERENCES delivery(delivery_id);


--
-- Name: shipment_route_segment shpmt_rtseg_dfac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_dfac FOREIGN KEY (dest_facility_id) REFERENCES facility(facility_id);


--
-- Name: shipment_route_segment shpmt_rtseg_dpad; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_dpad FOREIGN KEY (dest_contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: shipment_route_segment shpmt_rtseg_dtcn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_dtcn FOREIGN KEY (dest_telecom_number_id) REFERENCES telecom_number(contact_mech_id);


--
-- Name: shipment_route_segment shpmt_rtseg_ofac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_ofac FOREIGN KEY (origin_facility_id) REFERENCES facility(facility_id);


--
-- Name: shipment_route_segment shpmt_rtseg_opad; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_opad FOREIGN KEY (origin_contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: shipment_route_segment shpmt_rtseg_otcn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_otcn FOREIGN KEY (origin_telecom_number_id) REFERENCES telecom_number(contact_mech_id);


--
-- Name: shipment_route_segment shpmt_rtseg_shmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_shmt FOREIGN KEY (shipment_method_type_id) REFERENCES shipment_method_type(shipment_method_type_id);


--
-- Name: shipment_route_segment shpmt_rtseg_shpmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment_route_segment
    ADD CONSTRAINT shpmt_rtseg_shpmt FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id);


--
-- PostgreSQL database dump complete
--

