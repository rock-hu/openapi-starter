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
-- Name: order_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_item (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    external_id character varying(20),
    order_item_type_id character varying(20),
    order_item_group_seq_id character varying(20),
    is_item_group_primary character(1),
    from_inventory_item_id character varying(20),
    budget_id character varying(20),
    budget_item_seq_id character varying(20),
    product_id character varying(20),
    supplier_product_id character varying(60),
    product_feature_id character varying(20),
    prod_catalog_id character varying(20),
    product_category_id character varying(20),
    is_promo character(1),
    quote_id character varying(20),
    quote_item_seq_id character varying(20),
    shopping_list_id character varying(20),
    shopping_list_item_seq_id character varying(20),
    subscription_id character varying(20),
    deployment_id character varying(20),
    quantity numeric(18,6),
    cancel_quantity numeric(18,6),
    selected_amount numeric(18,6),
    unit_price numeric(18,3),
    unit_list_price numeric(18,3),
    unit_average_cost numeric(18,2),
    unit_recurring_price numeric(18,2),
    is_modified_price character(1),
    recurring_freq_uom_id character varying(20),
    item_description character varying(255),
    comments character varying(255),
    corresponding_po_id character varying(20),
    status_id character varying(20),
    sync_status_id character varying(20),
    estimated_ship_date timestamp with time zone,
    estimated_delivery_date timestamp with time zone,
    auto_cancel_date timestamp with time zone,
    dont_cancel_set_date timestamp with time zone,
    dont_cancel_set_user_login character varying(255),
    ship_before_date timestamp with time zone,
    ship_after_date timestamp with time zone,
    reserve_after_date timestamp with time zone,
    cancel_back_order_date timestamp with time zone,
    override_gl_account_id character varying(20),
    sales_opportunity_id character varying(20),
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_item OWNER TO ofbiz;

--
-- Name: order_item pk_order_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT pk_order_item PRIMARY KEY (order_id, order_item_seq_id);


--
-- Name: order_item_dcul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_dcul ON order_item USING btree (dont_cancel_set_user_login);


--
-- Name: order_item_fminv; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_fminv ON order_item USING btree (from_inventory_item_id);


--
-- Name: order_item_hdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_hdr ON order_item USING btree (order_id);


--
-- Name: order_item_itgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_itgrp ON order_item USING btree (order_id, order_item_group_seq_id);


--
-- Name: order_item_ogla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_ogla ON order_item USING btree (override_gl_account_id);


--
-- Name: order_item_ortyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_ortyp ON order_item USING btree (order_item_type_id);


--
-- Name: order_item_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_product ON order_item USING btree (product_id);


--
-- Name: order_item_quit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_quit ON order_item USING btree (quote_id, quote_item_seq_id);


--
-- Name: order_item_rfuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_rfuom ON order_item USING btree (recurring_freq_uom_id);


--
-- Name: order_item_slsopp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_slsopp ON order_item USING btree (sales_opportunity_id);


--
-- Name: order_item_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_stts ON order_item USING btree (status_id);


--
-- Name: order_item_syst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_syst ON order_item USING btree (sync_status_id);


--
-- Name: order_item_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_txcrts ON order_item USING btree (created_tx_stamp);


--
-- Name: order_item_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_txstmp ON order_item USING btree (last_updated_tx_stamp);


--
-- Name: order_item_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_item_usrlgn ON order_item USING btree (change_by_user_login_id);


--
-- Name: orditmext_id_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orditmext_id_idx ON order_item USING btree (external_id);


--
-- Name: order_item order_item_dcul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_dcul FOREIGN KEY (dont_cancel_set_user_login) REFERENCES user_login(user_login_id);


--
-- Name: order_item order_item_fminv; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_fminv FOREIGN KEY (from_inventory_item_id) REFERENCES inventory_item(inventory_item_id);


--
-- Name: order_item order_item_hdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_hdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_item order_item_itgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_itgrp FOREIGN KEY (order_id, order_item_group_seq_id) REFERENCES order_item_group(order_id, order_item_group_seq_id);


--
-- Name: order_item order_item_ogla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_ogla FOREIGN KEY (override_gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: order_item order_item_ortyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_ortyp FOREIGN KEY (order_item_type_id) REFERENCES order_item_type(order_item_type_id);


--
-- Name: order_item order_item_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: order_item order_item_quit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_quit FOREIGN KEY (quote_id, quote_item_seq_id) REFERENCES quote_item(quote_id, quote_item_seq_id);


--
-- Name: order_item order_item_rfuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_rfuom FOREIGN KEY (recurring_freq_uom_id) REFERENCES uom(uom_id);


--
-- Name: order_item order_item_slsopp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_slsopp FOREIGN KEY (sales_opportunity_id) REFERENCES sales_opportunity(sales_opportunity_id);


--
-- Name: order_item order_item_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: order_item order_item_syst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_syst FOREIGN KEY (sync_status_id) REFERENCES status_item(status_id);


--
-- Name: order_item order_item_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_usrlgn FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

