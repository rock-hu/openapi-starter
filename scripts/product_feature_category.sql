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
-- Name: product_feature_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_feature_category (
    product_feature_category_id character varying(20) NOT NULL,
    parent_category_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_feature_category OWNER TO ofbiz;

--
-- Name: product_feature_category pk_product_feature_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_category
    ADD CONSTRAINT pk_product_feature_category PRIMARY KEY (product_feature_category_id);


--
-- Name: prdt_ftr_ctr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ftr_ctr_txcrs ON product_feature_category USING btree (created_tx_stamp);


--
-- Name: prdt_ftr_ctr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ftr_ctr_txstp ON product_feature_category USING btree (last_updated_tx_stamp);


--
-- Name: prod_feat_cat_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_feat_cat_par ON product_feature_category USING btree (parent_category_id);


--
-- Name: product_feature_category prod_feat_cat_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_category
    ADD CONSTRAINT prod_feat_cat_par FOREIGN KEY (parent_category_id) REFERENCES product_feature_category(product_feature_category_id);


--
-- PostgreSQL database dump complete
--

