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
-- Name: product_category_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_category_type (
    product_category_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_category_type OWNER TO ofbiz;

--
-- Name: product_category_type pk_product_category_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_type
    ADD CONSTRAINT pk_product_category_type PRIMARY KEY (product_category_type_id);


--
-- Name: prdt_ctr_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_tp_txcrts ON product_category_type USING btree (created_tx_stamp);


--
-- Name: prdt_ctr_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_tp_txstmp ON product_category_type USING btree (last_updated_tx_stamp);


--
-- Name: prod_ctgry_typepar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_ctgry_typepar ON product_category_type USING btree (parent_type_id);


--
-- Name: product_category_type prod_ctgry_typepar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_type
    ADD CONSTRAINT prod_ctgry_typepar FOREIGN KEY (parent_type_id) REFERENCES product_category_type(product_category_type_id);


--
-- PostgreSQL database dump complete
--

