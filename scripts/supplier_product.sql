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
-- Name: supplier_product; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE supplier_product (
    product_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    available_from_date timestamp with time zone NOT NULL,
    available_thru_date timestamp with time zone,
    supplier_pref_order_id character varying(20),
    supplier_rating_type_id character varying(20),
    standard_lead_time_days numeric(18,6),
    minimum_order_quantity numeric(18,6) NOT NULL,
    order_qty_increments numeric(18,6),
    units_included numeric(18,6),
    quantity_uom_id character varying(20),
    agreement_id character varying(20),
    agreement_item_seq_id character varying(20),
    last_price numeric(18,3),
    shipping_price numeric(18,3),
    currency_uom_id character varying(20) NOT NULL,
    supplier_product_name character varying(100),
    supplier_product_id character varying(60),
    can_drop_ship character(1),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.supplier_product OWNER TO ofbiz;

--
-- Name: supplier_product pk_supplier_product; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product
    ADD CONSTRAINT pk_supplier_product PRIMARY KEY (product_id, party_id, currency_uom_id, minimum_order_quantity, available_from_date);


--
-- Name: spplr_prdct_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX spplr_prdct_txcrts ON supplier_product USING btree (created_tx_stamp);


--
-- Name: spplr_prdct_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX spplr_prdct_txstmp ON supplier_product USING btree (last_updated_tx_stamp);


--
-- Name: suppl_prod_agrit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_prod_agrit ON supplier_product USING btree (agreement_id, agreement_item_seq_id);


--
-- Name: suppl_prod_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_prod_cuom ON supplier_product USING btree (currency_uom_id);


--
-- Name: suppl_prod_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_prod_party ON supplier_product USING btree (party_id);


--
-- Name: suppl_prod_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_prod_prod ON supplier_product USING btree (product_id);


--
-- Name: suppl_prod_quom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_prod_quom ON supplier_product USING btree (quantity_uom_id);


--
-- Name: suppl_prod_spord; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_prod_spord ON supplier_product USING btree (supplier_pref_order_id);


--
-- Name: suppl_prod_srtpe; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_prod_srtpe ON supplier_product USING btree (supplier_rating_type_id);


--
-- Name: supplier_product suppl_prod_agrit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product
    ADD CONSTRAINT suppl_prod_agrit FOREIGN KEY (agreement_id, agreement_item_seq_id) REFERENCES agreement_item(agreement_id, agreement_item_seq_id);


--
-- Name: supplier_product suppl_prod_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product
    ADD CONSTRAINT suppl_prod_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: supplier_product suppl_prod_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product
    ADD CONSTRAINT suppl_prod_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: supplier_product suppl_prod_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product
    ADD CONSTRAINT suppl_prod_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: supplier_product suppl_prod_quom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product
    ADD CONSTRAINT suppl_prod_quom FOREIGN KEY (quantity_uom_id) REFERENCES uom(uom_id);


--
-- Name: supplier_product suppl_prod_spord; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product
    ADD CONSTRAINT suppl_prod_spord FOREIGN KEY (supplier_pref_order_id) REFERENCES supplier_pref_order(supplier_pref_order_id);


--
-- Name: supplier_product suppl_prod_srtpe; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product
    ADD CONSTRAINT suppl_prod_srtpe FOREIGN KEY (supplier_rating_type_id) REFERENCES supplier_rating_type(supplier_rating_type_id);


--
-- PostgreSQL database dump complete
--

