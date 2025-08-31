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
-- Name: vendor_product; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE vendor_product (
    product_id character varying(20) NOT NULL,
    vendor_party_id character varying(20) NOT NULL,
    product_store_group_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.vendor_product OWNER TO ofbiz;

--
-- Name: vendor_product pk_vendor_product; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY vendor_product
    ADD CONSTRAINT pk_vendor_product PRIMARY KEY (product_id, vendor_party_id, product_store_group_id);


--
-- Name: vendprod_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vendprod_prod ON vendor_product USING btree (product_id);


--
-- Name: vendprod_psgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vendprod_psgrp ON vendor_product USING btree (product_store_group_id);


--
-- Name: vendprod_vpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vendprod_vpty ON vendor_product USING btree (vendor_party_id);


--
-- Name: vndr_prdct_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vndr_prdct_txcrts ON vendor_product USING btree (created_tx_stamp);


--
-- Name: vndr_prdct_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vndr_prdct_txstmp ON vendor_product USING btree (last_updated_tx_stamp);


--
-- Name: vendor_product vendprod_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY vendor_product
    ADD CONSTRAINT vendprod_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: vendor_product vendprod_psgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY vendor_product
    ADD CONSTRAINT vendprod_psgrp FOREIGN KEY (product_store_group_id) REFERENCES product_store_group(product_store_group_id);


--
-- Name: vendor_product vendprod_vpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY vendor_product
    ADD CONSTRAINT vendprod_vpty FOREIGN KEY (vendor_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

