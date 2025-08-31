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
-- Name: product_category_attribute; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_category_attribute (
    product_category_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    attr_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_category_attribute OWNER TO ofbiz;

--
-- Name: product_category_attribute pk_product_category_attribute; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_attribute
    ADD CONSTRAINT pk_product_category_attribute PRIMARY KEY (product_category_id, attr_name);


--
-- Name: prod_ctgry_attr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_ctgry_attr ON product_category_attribute USING btree (product_category_id);


--
-- Name: prt_ctr_attt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ctr_attt_txcrs ON product_category_attribute USING btree (created_tx_stamp);


--
-- Name: prt_ctr_attt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ctr_attt_txstp ON product_category_attribute USING btree (last_updated_tx_stamp);


--
-- Name: product_category_attribute prod_ctgry_attr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_attribute
    ADD CONSTRAINT prod_ctgry_attr FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- PostgreSQL database dump complete
--

