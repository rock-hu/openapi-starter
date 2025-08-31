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
-- Name: product; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product (
    product_id character varying(20) NOT NULL,
    product_type_id character varying(20),
    primary_product_category_id character varying(20),
    facility_id character varying(20),
    introduction_date timestamp with time zone,
    release_date timestamp with time zone,
    support_discontinuation_date timestamp with time zone,
    sales_discontinuation_date timestamp with time zone,
    sales_disc_when_not_avail character(1),
    internal_name character varying(255),
    brand_name character varying(100),
    comments character varying(255),
    product_name character varying(100),
    description character varying(255),
    long_description text,
    price_detail_text character varying(255),
    small_image_url character varying(2000),
    medium_image_url character varying(2000),
    large_image_url character varying(2000),
    detail_image_url character varying(2000),
    original_image_url character varying(2000),
    detail_screen character varying(255),
    inventory_message character varying(255),
    inventory_item_type_id character varying(20),
    require_inventory character(1),
    quantity_uom_id character varying(20),
    quantity_included numeric(18,6),
    pieces_included numeric(20,0),
    require_amount character(1),
    fixed_amount numeric(18,2),
    amount_uom_type_id character varying(20),
    weight_uom_id character varying(20),
    shipping_weight numeric(18,6),
    product_weight numeric(18,6),
    height_uom_id character varying(20),
    product_height numeric(18,6),
    shipping_height numeric(18,6),
    width_uom_id character varying(20),
    product_width numeric(18,6),
    shipping_width numeric(18,6),
    depth_uom_id character varying(20),
    product_depth numeric(18,6),
    shipping_depth numeric(18,6),
    diameter_uom_id character varying(20),
    product_diameter numeric(18,6),
    product_rating numeric(18,6),
    rating_type_enum character varying(20),
    returnable character(1),
    taxable character(1),
    charge_shipping character(1),
    auto_create_keywords character(1),
    include_in_promotions character(1),
    is_virtual character(1),
    is_variant character(1),
    virtual_variant_method_enum character varying(20),
    origin_geo_id character varying(20),
    requirement_method_enum_id character varying(20),
    bill_of_material_level numeric(20,0),
    reserv_max_persons numeric(18,6),
    reserv2nd_p_p_perc numeric(18,6),
    reserv_nth_p_p_perc numeric(18,6),
    config_id character varying(20),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    in_shipping_box character(1),
    default_shipment_box_type_id character varying(20),
    lot_id_filled_in character varying(255),
    order_decimal_quantity character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product OWNER TO ofbiz;

--
-- Name: product pk_product; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT pk_product PRIMARY KEY (product_id);


--
-- Name: prod_amount_uomt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_amount_uomt ON product USING btree (amount_uom_type_id);


--
-- Name: prod_cb_userlogin; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cb_userlogin ON product USING btree (created_by_user_login);


--
-- Name: prod_depth_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_depth_uom ON product USING btree (depth_uom_id);


--
-- Name: prod_diamtr_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_diamtr_uom ON product USING btree (diameter_uom_id);


--
-- Name: prod_facility; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_facility ON product USING btree (facility_id);


--
-- Name: prod_height_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_height_uom ON product USING btree (height_uom_id);


--
-- Name: prod_inv_item_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_inv_item_type ON product USING btree (inventory_item_type_id);


--
-- Name: prod_lmb_userlogin; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_lmb_userlogin ON product USING btree (last_modified_by_user_login);


--
-- Name: prod_org_geo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_org_geo ON product USING btree (origin_geo_id);


--
-- Name: prod_primary_cat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_primary_cat ON product USING btree (primary_product_category_id);


--
-- Name: prod_quant_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_quant_uom ON product USING btree (quantity_uom_id);


--
-- Name: prod_rate_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_rate_enum ON product USING btree (rating_type_enum);


--
-- Name: prod_rqmt_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_rqmt_enum ON product USING btree (requirement_method_enum_id);


--
-- Name: prod_shbx_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_shbx_type ON product USING btree (default_shipment_box_type_id);


--
-- Name: prod_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_type ON product USING btree (product_type_id);


--
-- Name: prod_vvmethod_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_vvmethod_enum ON product USING btree (virtual_variant_method_enum);


--
-- Name: prod_weight_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_weight_uom ON product USING btree (weight_uom_id);


--
-- Name: prod_width_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_width_uom ON product USING btree (width_uom_id);


--
-- Name: product_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX product_txcrts ON product USING btree (created_tx_stamp);


--
-- Name: product_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX product_txstmp ON product USING btree (last_updated_tx_stamp);


--
-- Name: product prod_amount_uomt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_amount_uomt FOREIGN KEY (amount_uom_type_id) REFERENCES uom_type(uom_type_id);


--
-- Name: product prod_cb_userlogin; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_cb_userlogin FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product prod_depth_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_depth_uom FOREIGN KEY (depth_uom_id) REFERENCES uom(uom_id);


--
-- Name: product prod_diamtr_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_diamtr_uom FOREIGN KEY (diameter_uom_id) REFERENCES uom(uom_id);


--
-- Name: product prod_facility; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_facility FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: product prod_height_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_height_uom FOREIGN KEY (height_uom_id) REFERENCES uom(uom_id);


--
-- Name: product prod_inv_item_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_inv_item_type FOREIGN KEY (inventory_item_type_id) REFERENCES inventory_item_type(inventory_item_type_id);


--
-- Name: product prod_lmb_userlogin; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_lmb_userlogin FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product prod_org_geo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_org_geo FOREIGN KEY (origin_geo_id) REFERENCES geo(geo_id);


--
-- Name: product prod_primary_cat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_primary_cat FOREIGN KEY (primary_product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product prod_quant_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_quant_uom FOREIGN KEY (quantity_uom_id) REFERENCES uom(uom_id);


--
-- Name: product prod_rate_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_rate_enum FOREIGN KEY (rating_type_enum) REFERENCES enumeration(enum_id);


--
-- Name: product prod_rqmt_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_rqmt_enum FOREIGN KEY (requirement_method_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product prod_shbx_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_shbx_type FOREIGN KEY (default_shipment_box_type_id) REFERENCES shipment_box_type(shipment_box_type_id);


--
-- Name: product prod_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_type FOREIGN KEY (product_type_id) REFERENCES product_type(product_type_id);


--
-- Name: product prod_vvmethod_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_vvmethod_enum FOREIGN KEY (virtual_variant_method_enum) REFERENCES enumeration(enum_id);


--
-- Name: product prod_weight_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_weight_uom FOREIGN KEY (weight_uom_id) REFERENCES uom(uom_id);


--
-- Name: product prod_width_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product
    ADD CONSTRAINT prod_width_uom FOREIGN KEY (width_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

