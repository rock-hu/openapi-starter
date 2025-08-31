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
-- Name: subscription; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE subscription (
    subscription_id character varying(20) NOT NULL,
    description character varying(255),
    subscription_resource_id character varying(20),
    communication_event_id character varying(20),
    contact_mech_id character varying(20),
    originated_from_party_id character varying(20),
    originated_from_role_type_id character varying(20),
    party_id character varying(20),
    role_type_id character varying(20),
    party_need_id character varying(20),
    need_type_id character varying(20),
    order_id character varying(20),
    order_item_seq_id character varying(20),
    product_id character varying(20),
    product_category_id character varying(20),
    inventory_item_id character varying(20),
    subscription_type_id character varying(20),
    external_subscription_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    purchase_from_date timestamp with time zone,
    purchase_thru_date timestamp with time zone,
    max_life_time numeric(20,0),
    max_life_time_uom_id character varying(20),
    available_time numeric(20,0),
    available_time_uom_id character varying(20),
    use_count_limit numeric(20,0),
    use_time numeric(20,0),
    use_time_uom_id character varying(20),
    automatic_extend character(1),
    cancl_autm_ext_time numeric(20,0),
    cancl_autm_ext_time_uom_id character varying(20),
    grace_period_on_expiry numeric(20,0),
    grace_period_on_expiry_uom_id character varying(20),
    expiration_completed_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.subscription OWNER TO ofbiz;

--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (subscription_id);


--
-- Name: sbscrptn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrptn_txcrts ON subscription USING btree (created_tx_stamp);


--
-- Name: sbscrptn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sbscrptn_txstmp ON subscription USING btree (last_updated_tx_stamp);


--
-- Name: subsc_atu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_atu ON subscription USING btree (available_time_uom_id);


--
-- Name: subsc_cont_mech; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_cont_mech ON subscription USING btree (contact_mech_id);


--
-- Name: subsc_ctu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_ctu ON subscription USING btree (cancl_autm_ext_time_uom_id);


--
-- Name: subsc_gtu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_gtu ON subscription USING btree (grace_period_on_expiry_uom_id);


--
-- Name: subsc_inv_itm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_inv_itm ON subscription USING btree (inventory_item_id);


--
-- Name: subsc_mtu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_mtu ON subscription USING btree (max_life_time_uom_id);


--
-- Name: subsc_need_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_need_type ON subscription USING btree (need_type_id);


--
-- Name: subsc_oparty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_oparty ON subscription USING btree (originated_from_party_id);


--
-- Name: subsc_orderitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_orderitm ON subscription USING btree (order_id, order_item_seq_id);


--
-- Name: subsc_orole_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_orole_type ON subscription USING btree (originated_from_role_type_id);


--
-- Name: subsc_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_party ON subscription USING btree (party_id);


--
-- Name: subsc_prod_cat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_prod_cat ON subscription USING btree (product_category_id);


--
-- Name: subsc_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_product ON subscription USING btree (product_id);


--
-- Name: subsc_role_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_role_type ON subscription USING btree (role_type_id);


--
-- Name: subsc_sresrc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_sresrc ON subscription USING btree (subscription_resource_id);


--
-- Name: subsc_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_to_type ON subscription USING btree (subscription_type_id);


--
-- Name: subsc_utu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX subsc_utu ON subscription USING btree (use_time_uom_id);


--
-- Name: subscription subsc_atu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_atu FOREIGN KEY (available_time_uom_id) REFERENCES uom(uom_id);


--
-- Name: subscription subsc_cont_mech; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_cont_mech FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: subscription subsc_ctu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_ctu FOREIGN KEY (cancl_autm_ext_time_uom_id) REFERENCES uom(uom_id);


--
-- Name: subscription subsc_gtu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_gtu FOREIGN KEY (grace_period_on_expiry_uom_id) REFERENCES uom(uom_id);


--
-- Name: subscription subsc_inv_itm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_inv_itm FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: subscription subsc_mtu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_mtu FOREIGN KEY (max_life_time_uom_id) REFERENCES uom(uom_id);


--
-- Name: subscription subsc_need_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_need_type FOREIGN KEY (need_type_id) REFERENCES need_type(need_type_id);


--
-- Name: subscription subsc_oparty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_oparty FOREIGN KEY (originated_from_party_id) REFERENCES party(party_id);


--
-- Name: subscription subsc_orderitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_orderitm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: subscription subsc_orole_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_orole_type FOREIGN KEY (originated_from_role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: subscription subsc_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: subscription subsc_prod_cat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_prod_cat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: subscription subsc_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: subscription subsc_role_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_role_type FOREIGN KEY (role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: subscription subsc_sresrc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_sresrc FOREIGN KEY (subscription_resource_id) REFERENCES subscription_resource(subscription_resource_id);


--
-- Name: subscription subsc_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_to_type FOREIGN KEY (subscription_type_id) REFERENCES subscription_type(subscription_type_id);


--
-- Name: subscription subsc_utu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY subscription
    ADD CONSTRAINT subsc_utu FOREIGN KEY (use_time_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

