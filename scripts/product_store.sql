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
-- Name: product_store; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store (
    product_store_id character varying(20) NOT NULL,
    primary_store_group_id character varying(20),
    store_name character varying(100),
    company_name character varying(100),
    title character varying(100),
    subtitle character varying(255),
    pay_to_party_id character varying(20),
    days_to_cancel_non_pay numeric(20,0),
    manual_auth_is_capture character(1),
    prorate_shipping character(1),
    prorate_taxes character(1),
    view_cart_on_add character(1),
    auto_save_cart character(1),
    auto_approve_reviews character(1),
    is_demo_store character(1),
    is_immediately_fulfilled character(1),
    inventory_facility_id character varying(20),
    one_inventory_facility character(1),
    check_inventory character(1),
    reserve_inventory character(1),
    reserve_order_enum_id character varying(20),
    require_inventory character(1),
    balance_res_on_order_creation character(1),
    requirement_method_enum_id character varying(20),
    order_number_prefix character varying(60),
    default_locale_string character varying(10),
    default_currency_uom_id character varying(20),
    default_time_zone_string character varying(60),
    default_sales_channel_enum_id character varying(20),
    allow_password character(1),
    default_password character varying(255),
    explode_order_items character(1),
    check_gc_balance character(1),
    retry_failed_auths character(1),
    header_approved_status character varying(20),
    item_approved_status character varying(20),
    digital_item_approved_status character varying(20),
    header_declined_status character varying(20),
    item_declined_status character varying(20),
    header_cancel_status character varying(20),
    item_cancel_status character varying(20),
    auth_declined_message character varying(255),
    auth_fraud_message character varying(255),
    auth_error_message character varying(255),
    visual_theme_id character varying(20),
    store_credit_account_enum_id character varying(20),
    use_primary_email_username character(1),
    require_customer_role character(1),
    auto_invoice_digital_items character(1),
    req_ship_addr_for_dig_items character(1),
    show_checkout_gift_options character(1),
    select_payment_type_per_item character(1),
    show_prices_with_vat_tax character(1),
    show_tax_is_exempt character(1),
    vat_tax_auth_geo_id character varying(20),
    vat_tax_auth_party_id character varying(20),
    enable_auto_suggestion_list character(1),
    enable_dig_prod_upload character(1),
    prod_search_exclude_variants character(1),
    dig_prod_upload_category_id character varying(20),
    auto_order_cc_try_exp character(1),
    auto_order_cc_try_other_cards character(1),
    auto_order_cc_try_later_nsf character(1),
    auto_order_cc_try_later_max numeric(20,0),
    store_credit_valid_days numeric(20,0),
    auto_approve_invoice character(1),
    auto_approve_order character(1),
    ship_if_capture_fails character(1),
    set_owner_upon_issuance character(1),
    req_return_inventory_receive character(1),
    add_to_cart_remove_incompat character(1),
    add_to_cart_replace_upsell character(1),
    split_pay_pref_per_shp_grp character(1),
    managed_by_lot character(1),
    show_out_of_stock_products character(1),
    order_decimal_quantity character(1),
    allow_comment character(1),
    allocate_inventory character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store OWNER TO ofbiz;

--
-- Name: product_store pk_product_store; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT pk_product_store PRIMARY KEY (product_store_id);


--
-- Name: prdct_str_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_str_txcrts ON product_store USING btree (created_tx_stamp);


--
-- Name: prdct_str_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_str_txstmp ON product_store USING btree (last_updated_tx_stamp);


--
-- Name: prod_str_curuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_curuom ON product_store USING btree (default_currency_uom_id);


--
-- Name: prod_str_diapsts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_diapsts ON product_store USING btree (digital_item_approved_status);


--
-- Name: prod_str_facility; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_facility ON product_store USING btree (inventory_facility_id);


--
-- Name: prod_str_hapsts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_hapsts ON product_store USING btree (header_approved_status);


--
-- Name: prod_str_hcnsts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_hcnsts ON product_store USING btree (header_cancel_status);


--
-- Name: prod_str_hdcsts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_hdcsts ON product_store USING btree (header_declined_status);


--
-- Name: prod_str_iapsts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_iapsts ON product_store USING btree (item_approved_status);


--
-- Name: prod_str_icnsts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_icnsts ON product_store USING btree (item_cancel_status);


--
-- Name: prod_str_idcsts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_idcsts ON product_store USING btree (item_declined_status);


--
-- Name: prod_str_paytopty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_paytopty ON product_store USING btree (pay_to_party_id);


--
-- Name: prod_str_prstrgp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_prstrgp ON product_store USING btree (primary_store_group_id);


--
-- Name: prod_str_rordenum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_rordenum ON product_store USING btree (reserve_order_enum_id);


--
-- Name: prod_str_rqmtenum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_rqmtenum ON product_store USING btree (requirement_method_enum_id);


--
-- Name: prod_str_salechn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_salechn ON product_store USING btree (default_sales_channel_enum_id);


--
-- Name: prod_str_strcrdact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_strcrdact ON product_store USING btree (store_credit_account_enum_id);


--
-- Name: prod_str_vattxa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_str_vattxa ON product_store USING btree (vat_tax_auth_geo_id, vat_tax_auth_party_id);


--
-- Name: product_store prod_str_curuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_curuom FOREIGN KEY (default_currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_store prod_str_diapsts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_diapsts FOREIGN KEY (digital_item_approved_status) REFERENCES status_item(status_id);


--
-- Name: product_store prod_str_facility; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_facility FOREIGN KEY (inventory_facility_id) REFERENCES facility(facility_id);


--
-- Name: product_store prod_str_hapsts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_hapsts FOREIGN KEY (header_approved_status) REFERENCES status_item(status_id);


--
-- Name: product_store prod_str_hcnsts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_hcnsts FOREIGN KEY (header_cancel_status) REFERENCES status_item(status_id);


--
-- Name: product_store prod_str_hdcsts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_hdcsts FOREIGN KEY (header_declined_status) REFERENCES status_item(status_id);


--
-- Name: product_store prod_str_iapsts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_iapsts FOREIGN KEY (item_approved_status) REFERENCES status_item(status_id);


--
-- Name: product_store prod_str_icnsts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_icnsts FOREIGN KEY (item_cancel_status) REFERENCES status_item(status_id);


--
-- Name: product_store prod_str_idcsts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_idcsts FOREIGN KEY (item_declined_status) REFERENCES status_item(status_id);


--
-- Name: product_store prod_str_paytopty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_paytopty FOREIGN KEY (pay_to_party_id) REFERENCES party(party_id);


--
-- Name: product_store prod_str_prstrgp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_prstrgp FOREIGN KEY (primary_store_group_id) REFERENCES product_store_group(product_store_group_id);


--
-- Name: product_store prod_str_rordenum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_rordenum FOREIGN KEY (reserve_order_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_store prod_str_rqmtenum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_rqmtenum FOREIGN KEY (requirement_method_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_store prod_str_salechn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_salechn FOREIGN KEY (default_sales_channel_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_store prod_str_strcrdact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_strcrdact FOREIGN KEY (store_credit_account_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_store prod_str_vattxa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store
    ADD CONSTRAINT prod_str_vattxa FOREIGN KEY (vat_tax_auth_geo_id, vat_tax_auth_party_id) REFERENCES tax_authority(tax_auth_geo_id, tax_auth_party_id);


--
-- PostgreSQL database dump complete
--

