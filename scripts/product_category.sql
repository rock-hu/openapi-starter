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
-- Name: product_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_category (
    product_category_id character varying(20) NOT NULL,
    product_category_type_id character varying(20),
    primary_parent_category_id character varying(20),
    category_name character varying(100),
    description character varying(255),
    long_description text,
    category_image_url character varying(2000),
    link_one_image_url character varying(2000),
    link_two_image_url character varying(2000),
    detail_screen character varying(255),
    show_in_select character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_category OWNER TO ofbiz;

--
-- Name: product_category pk_product_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category
    ADD CONSTRAINT pk_product_category PRIMARY KEY (product_category_id);


--
-- Name: prdct_ctgr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_ctgr_txcrts ON product_category USING btree (created_tx_stamp);


--
-- Name: prdct_ctgr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_ctgr_txstmp ON product_category USING btree (last_updated_tx_stamp);


--
-- Name: prod_ctgry_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_ctgry_parent ON product_category USING btree (primary_parent_category_id);


--
-- Name: prod_ctgry_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_ctgry_type ON product_category USING btree (product_category_type_id);


--
-- Name: product_category prod_ctgry_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category
    ADD CONSTRAINT prod_ctgry_parent FOREIGN KEY (primary_parent_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product_category prod_ctgry_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category
    ADD CONSTRAINT prod_ctgry_type FOREIGN KEY (product_category_type_id) REFERENCES product_category_type(product_category_type_id);


--
-- PostgreSQL database dump complete
--

