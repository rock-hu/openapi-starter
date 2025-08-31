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
-- Name: order_header; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_header (
    order_id character varying(20) NOT NULL,
    order_type_id character varying(20),
    order_name character varying(100),
    external_id character varying(20),
    sales_channel_enum_id character varying(20),
    order_date timestamp with time zone,
    priority character(1),
    entry_date timestamp with time zone,
    pick_sheet_printed_date timestamp with time zone,
    visit_id character varying(20),
    status_id character varying(20),
    created_by character varying(255),
    first_attempt_order_id character varying(20),
    currency_uom character varying(20),
    sync_status_id character varying(20),
    billing_account_id character varying(20),
    origin_facility_id character varying(20),
    web_site_id character varying(20),
    product_store_id character varying(20),
    agreement_id character varying(20),
    terminal_id character varying(60),
    transaction_id character varying(60),
    auto_order_shopping_list_id character varying(20),
    needs_inventory_issuance character(1),
    is_rush_order character(1),
    internal_code character varying(60),
    remaining_sub_total numeric(18,2),
    grand_total numeric(18,2),
    is_viewed character(1),
    invoice_per_shipment character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_header OWNER TO ofbiz;

--
-- Name: order_header pk_order_header; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT pk_order_header PRIMARY KEY (order_id);


--
-- Name: order_hdr_aoshlst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_aoshlst ON order_header USING btree (auto_order_shopping_list_id);


--
-- Name: order_hdr_bacct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_bacct ON order_header USING btree (billing_account_id);


--
-- Name: order_hdr_cbul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_cbul ON order_header USING btree (created_by);


--
-- Name: order_hdr_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_cuom ON order_header USING btree (currency_uom);


--
-- Name: order_hdr_ofac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_ofac ON order_header USING btree (origin_facility_id);


--
-- Name: order_hdr_pdstr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_pdstr ON order_header USING btree (product_store_id);


--
-- Name: order_hdr_scenum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_scenum ON order_header USING btree (sales_channel_enum_id);


--
-- Name: order_hdr_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_stts ON order_header USING btree (status_id);


--
-- Name: order_hdr_syst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_syst ON order_header USING btree (sync_status_id);


--
-- Name: order_hdr_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_type ON order_header USING btree (order_type_id);


--
-- Name: order_hdr_ws; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdr_ws ON order_header USING btree (web_site_id);


--
-- Name: orderext_id_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orderext_id_idx ON order_header USING btree (external_id);


--
-- Name: ordr_hdr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_hdr_txcrts ON order_header USING btree (created_tx_stamp);


--
-- Name: ordr_hdr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_hdr_txstmp ON order_header USING btree (last_updated_tx_stamp);


--
-- Name: order_header order_hdr_aoshlst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_aoshlst FOREIGN KEY (auto_order_shopping_list_id) REFERENCES shopping_list(shopping_list_id);


--
-- Name: order_header order_hdr_bacct; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_bacct FOREIGN KEY (billing_account_id) REFERENCES billing_account(billing_account_id);


--
-- Name: order_header order_hdr_cbul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_cbul FOREIGN KEY (created_by) REFERENCES user_login(user_login_id);


--
-- Name: order_header order_hdr_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_cuom FOREIGN KEY (currency_uom) REFERENCES uom(uom_id);


--
-- Name: order_header order_hdr_ofac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_ofac FOREIGN KEY (origin_facility_id) REFERENCES facility(facility_id);


--
-- Name: order_header order_hdr_pdstr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_pdstr FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: order_header order_hdr_scenum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_scenum FOREIGN KEY (sales_channel_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: order_header order_hdr_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: order_header order_hdr_syst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_syst FOREIGN KEY (sync_status_id) REFERENCES status_item(status_id);


--
-- Name: order_header order_hdr_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_type FOREIGN KEY (order_type_id) REFERENCES order_type(order_type_id);


--
-- Name: order_header order_hdr_ws; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header
    ADD CONSTRAINT order_hdr_ws FOREIGN KEY (web_site_id) REFERENCES web_site(web_site_id);


--
-- PostgreSQL database dump complete
--

