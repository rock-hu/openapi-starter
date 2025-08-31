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
-- Name: tax_authority_rate_product; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tax_authority_rate_product (
    tax_authority_rate_seq_id character varying(20) NOT NULL,
    tax_auth_geo_id character varying(20),
    tax_auth_party_id character varying(20),
    tax_authority_rate_type_id character varying(20),
    product_store_id character varying(20),
    product_category_id character varying(20),
    title_transfer_enum_id character varying(20),
    min_item_price numeric(18,2),
    min_purchase numeric(18,2),
    tax_shipping character(1),
    tax_percentage numeric(18,6),
    tax_promotions character(1),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    description character varying(255),
    is_tax_in_shipping_price character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tax_authority_rate_product OWNER TO ofbiz;

--
-- Name: tax_authority_rate_product pk_tax_authority_rate_product; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_rate_product
    ADD CONSTRAINT pk_tax_authority_rate_product PRIMARY KEY (tax_authority_rate_seq_id);


--
-- Name: taxauthrtep_pcat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthrtep_pcat ON tax_authority_rate_product USING btree (product_category_id);


--
-- Name: taxauthrtep_pstr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthrtep_pstr ON tax_authority_rate_product USING btree (product_store_id);


--
-- Name: taxauthrtep_rttp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthrtep_rttp ON tax_authority_rate_product USING btree (tax_authority_rate_type_id);


--
-- Name: taxauthrtep_txa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthrtep_txa ON tax_authority_rate_product USING btree (tax_auth_geo_id, tax_auth_party_id);


--
-- Name: tx_att_rt_prt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_att_rt_prt_txcs ON tax_authority_rate_product USING btree (created_tx_stamp);


--
-- Name: tx_att_rt_prt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_att_rt_prt_txsp ON tax_authority_rate_product USING btree (last_updated_tx_stamp);


--
-- Name: tax_authority_rate_product taxauthrtep_pcat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_rate_product
    ADD CONSTRAINT taxauthrtep_pcat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: tax_authority_rate_product taxauthrtep_pstr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_rate_product
    ADD CONSTRAINT taxauthrtep_pstr FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: tax_authority_rate_product taxauthrtep_rttp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_rate_product
    ADD CONSTRAINT taxauthrtep_rttp FOREIGN KEY (tax_authority_rate_type_id) REFERENCES tax_authority_rate_type(tax_authority_rate_type_id);


--
-- Name: tax_authority_rate_product taxauthrtep_txa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_rate_product
    ADD CONSTRAINT taxauthrtep_txa FOREIGN KEY (tax_auth_geo_id, tax_auth_party_id) REFERENCES tax_authority(tax_auth_geo_id, tax_auth_party_id);


--
-- PostgreSQL database dump complete
--

