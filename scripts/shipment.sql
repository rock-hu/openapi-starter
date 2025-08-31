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
-- Name: shipment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shipment (
    shipment_id character varying(20) NOT NULL,
    shipment_type_id character varying(20),
    status_id character varying(20),
    primary_order_id character varying(20),
    primary_return_id character varying(20),
    primary_ship_group_seq_id character varying(20),
    picklist_bin_id character varying(20),
    estimated_ready_date timestamp with time zone,
    estimated_ship_date timestamp with time zone,
    estimated_ship_work_eff_id character varying(20),
    estimated_arrival_date timestamp with time zone,
    estimated_arrival_work_eff_id character varying(20),
    latest_cancel_date timestamp with time zone,
    estimated_ship_cost numeric(18,2),
    currency_uom_id character varying(20),
    handling_instructions character varying(255),
    origin_facility_id character varying(20),
    destination_facility_id character varying(20),
    origin_contact_mech_id character varying(20),
    origin_telecom_number_id character varying(20),
    destination_contact_mech_id character varying(20),
    destination_telecom_number_id character varying(20),
    party_id_to character varying(20),
    party_id_from character varying(20),
    additional_shipping_charge numeric(18,2),
    addtl_shipping_charge_desc character varying(255),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shipment OWNER TO ofbiz;

--
-- Name: shipment pk_shipment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT pk_shipment PRIMARY KEY (shipment_id);


--
-- Name: shipment_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shipment_txcrts ON shipment USING btree (created_tx_stamp);


--
-- Name: shipment_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shipment_txstmp ON shipment USING btree (last_updated_tx_stamp);


--
-- Name: shpmnt_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_cuom ON shipment USING btree (currency_uom_id);


--
-- Name: shpmnt_dfac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_dfac ON shipment USING btree (destination_facility_id);


--
-- Name: shpmnt_dpad; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_dpad ON shipment USING btree (destination_contact_mech_id);


--
-- Name: shpmnt_dtcn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_dtcn ON shipment USING btree (destination_telecom_number_id);


--
-- Name: shpmnt_earrweff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_earrweff ON shipment USING btree (estimated_arrival_work_eff_id);


--
-- Name: shpmnt_eshweff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_eshweff ON shipment USING btree (estimated_ship_work_eff_id);


--
-- Name: shpmnt_ofac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_ofac ON shipment USING btree (origin_facility_id);


--
-- Name: shpmnt_opad; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_opad ON shipment USING btree (origin_contact_mech_id);


--
-- Name: shpmnt_otcn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_otcn ON shipment USING btree (origin_telecom_number_id);


--
-- Name: shpmnt_pklstbin; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_pklstbin ON shipment USING btree (picklist_bin_id);


--
-- Name: shpmnt_podr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_podr ON shipment USING btree (primary_order_id);


--
-- Name: shpmnt_prtnhdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_prtnhdr ON shipment USING btree (primary_return_id);


--
-- Name: shpmnt_prtyfm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_prtyfm ON shipment USING btree (party_id_from);


--
-- Name: shpmnt_prtyto; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_prtyto ON shipment USING btree (party_id_to);


--
-- Name: shpmnt_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_stts ON shipment USING btree (status_id);


--
-- Name: shpmnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shpmnt_type ON shipment USING btree (shipment_type_id);


--
-- Name: shipment shpmnt_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: shipment shpmnt_dfac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_dfac FOREIGN KEY (destination_facility_id) REFERENCES facility(facility_id);


--
-- Name: shipment shpmnt_dpad; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_dpad FOREIGN KEY (destination_contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: shipment shpmnt_dtcn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_dtcn FOREIGN KEY (destination_telecom_number_id) REFERENCES telecom_number(contact_mech_id);


--
-- Name: shipment shpmnt_earrweff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_earrweff FOREIGN KEY (estimated_arrival_work_eff_id) REFERENCES work_effort(work_effort_id);


--
-- Name: shipment shpmnt_eshweff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_eshweff FOREIGN KEY (estimated_ship_work_eff_id) REFERENCES work_effort(work_effort_id);


--
-- Name: shipment shpmnt_ofac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_ofac FOREIGN KEY (origin_facility_id) REFERENCES facility(facility_id);


--
-- Name: shipment shpmnt_opad; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_opad FOREIGN KEY (origin_contact_mech_id) REFERENCES postal_address(contact_mech_id);


--
-- Name: shipment shpmnt_otcn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_otcn FOREIGN KEY (origin_telecom_number_id) REFERENCES telecom_number(contact_mech_id);


--
-- Name: shipment shpmnt_pklstbin; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_pklstbin FOREIGN KEY (picklist_bin_id) REFERENCES picklist_bin(picklist_bin_id);


--
-- Name: shipment shpmnt_podr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_podr FOREIGN KEY (primary_order_id) REFERENCES order_header(order_id);


--
-- Name: shipment shpmnt_prtnhdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_prtnhdr FOREIGN KEY (primary_return_id) REFERENCES return_header(return_id);


--
-- Name: shipment shpmnt_prtyfm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_prtyfm FOREIGN KEY (party_id_from) REFERENCES party(party_id);


--
-- Name: shipment shpmnt_prtyto; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_prtyto FOREIGN KEY (party_id_to) REFERENCES party(party_id);


--
-- Name: shipment shpmnt_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: shipment shpmnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shipment
    ADD CONSTRAINT shpmnt_type FOREIGN KEY (shipment_type_id) REFERENCES shipment_type(shipment_type_id);


--
-- PostgreSQL database dump complete
--

