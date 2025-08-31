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
-- Name: fixed_asset_product; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_product (
    fixed_asset_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    fixed_asset_product_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    comments character varying(255),
    sequence_num numeric(20,0),
    quantity numeric(18,6),
    quantity_uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_product OWNER TO ofbiz;

--
-- Name: fixed_asset_product pk_fixed_asset_product; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_product
    ADD CONSTRAINT pk_fixed_asset_product PRIMARY KEY (fixed_asset_id, product_id, fixed_asset_product_type_id, from_date);


--
-- Name: fixdastprd_fa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdastprd_fa ON fixed_asset_product USING btree (fixed_asset_id);


--
-- Name: fixdastprd_fapt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdastprd_fapt ON fixed_asset_product USING btree (fixed_asset_product_type_id);


--
-- Name: fixdastprd_prd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdastprd_prd ON fixed_asset_product USING btree (product_id);


--
-- Name: fixdastprd_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdastprd_uom ON fixed_asset_product USING btree (quantity_uom_id);


--
-- Name: fxd_ast_prdt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_prdt_txcrs ON fixed_asset_product USING btree (created_tx_stamp);


--
-- Name: fxd_ast_prdt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_prdt_txstp ON fixed_asset_product USING btree (last_updated_tx_stamp);


--
-- Name: fixed_asset_product fixdastprd_fa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_product
    ADD CONSTRAINT fixdastprd_fa FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: fixed_asset_product fixdastprd_fapt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_product
    ADD CONSTRAINT fixdastprd_fapt FOREIGN KEY (fixed_asset_product_type_id) REFERENCES fixed_asset_product_type(fixed_asset_product_type_id);


--
-- Name: fixed_asset_product fixdastprd_prd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_product
    ADD CONSTRAINT fixdastprd_prd FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: fixed_asset_product fixdastprd_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_product
    ADD CONSTRAINT fixdastprd_uom FOREIGN KEY (quantity_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

