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
-- Name: shopping_list; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE shopping_list (
    shopping_list_id character varying(20) NOT NULL,
    shopping_list_type_id character varying(20),
    parent_shopping_list_id character varying(20),
    product_store_id character varying(20),
    visitor_id character varying(20),
    party_id character varying(20),
    list_name character varying(100),
    description character varying(255),
    is_public character(1),
    is_active character(1),
    currency_uom character varying(20),
    shipment_method_type_id character varying(20),
    carrier_party_id character varying(20),
    carrier_role_type_id character varying(20),
    contact_mech_id character varying(20),
    payment_method_id character varying(20),
    recurrence_info_id character varying(20),
    last_ordered_date timestamp with time zone,
    last_admin_modified timestamp with time zone,
    product_promo_code_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.shopping_list OWNER TO ofbiz;

--
-- Name: shopping_list pk_shopping_list; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT pk_shopping_list PRIMARY KEY (shopping_list_id);


--
-- Name: shlist_cmech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_cmech ON shopping_list USING btree (contact_mech_id);


--
-- Name: shlist_cssm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_cssm ON shopping_list USING btree (shipment_method_type_id, carrier_party_id, carrier_role_type_id);


--
-- Name: shlist_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_parent ON shopping_list USING btree (parent_shopping_list_id);


--
-- Name: shlist_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_prds ON shopping_list USING btree (product_store_id);


--
-- Name: shlist_prmcd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_prmcd ON shopping_list USING btree (product_promo_code_id);


--
-- Name: shlist_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_pty ON shopping_list USING btree (party_id);


--
-- Name: shlist_pymeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_pymeth ON shopping_list USING btree (payment_method_id);


--
-- Name: shlist_recinfo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_recinfo ON shopping_list USING btree (recurrence_info_id);


--
-- Name: shlist_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shlist_type ON shopping_list USING btree (shopping_list_type_id);


--
-- Name: shppng_lst_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shppng_lst_txcrts ON shopping_list USING btree (created_tx_stamp);


--
-- Name: shppng_lst_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX shppng_lst_txstmp ON shopping_list USING btree (last_updated_tx_stamp);


--
-- Name: shopping_list shlist_cmech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT shlist_cmech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: shopping_list shlist_cssm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT shlist_cssm FOREIGN KEY (shipment_method_type_id, carrier_party_id, carrier_role_type_id) REFERENCES carrier_shipment_method(shipment_method_type_id, party_id, role_type_id);


--
-- Name: shopping_list shlist_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT shlist_parent FOREIGN KEY (parent_shopping_list_id) REFERENCES shopping_list(shopping_list_id);


--
-- Name: shopping_list shlist_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT shlist_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: shopping_list shlist_prmcd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT shlist_prmcd FOREIGN KEY (product_promo_code_id) REFERENCES product_promo_code(product_promo_code_id);


--
-- Name: shopping_list shlist_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT shlist_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: shopping_list shlist_pymeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT shlist_pymeth FOREIGN KEY (payment_method_id) REFERENCES payment_method(payment_method_id);


--
-- Name: shopping_list shlist_recinfo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT shlist_recinfo FOREIGN KEY (recurrence_info_id) REFERENCES recurrence_info(recurrence_info_id);


--
-- Name: shopping_list shlist_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY shopping_list
    ADD CONSTRAINT shlist_type FOREIGN KEY (shopping_list_type_id) REFERENCES shopping_list_type(shopping_list_type_id);


--
-- PostgreSQL database dump complete
--

