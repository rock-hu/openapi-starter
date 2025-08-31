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
-- Name: prod_catalog_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE prod_catalog_category (
    prod_catalog_id character varying(20) NOT NULL,
    product_category_id character varying(20) NOT NULL,
    prod_catalog_category_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.prod_catalog_category OWNER TO ofbiz;

--
-- Name: prod_catalog_category pk_prod_catalog_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_category
    ADD CONSTRAINT pk_prod_catalog_category PRIMARY KEY (prod_catalog_id, product_category_id, prod_catalog_category_type_id, from_date);


--
-- Name: prd_ctg_ctr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctg_ctr_txcrts ON prod_catalog_category USING btree (created_tx_stamp);


--
-- Name: prd_ctg_ctr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctg_ctr_txstmp ON prod_catalog_category USING btree (last_updated_tx_stamp);


--
-- Name: prod_cc_catalog; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cc_catalog ON prod_catalog_category USING btree (prod_catalog_id);


--
-- Name: prod_cc_category; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cc_category ON prod_catalog_category USING btree (product_category_id);


--
-- Name: prod_cc_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cc_type ON prod_catalog_category USING btree (prod_catalog_category_type_id);


--
-- Name: prod_catalog_category prod_cc_catalog; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_category
    ADD CONSTRAINT prod_cc_catalog FOREIGN KEY (prod_catalog_id) REFERENCES prod_catalog(prod_catalog_id);


--
-- Name: prod_catalog_category prod_cc_category; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_category
    ADD CONSTRAINT prod_cc_category FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: prod_catalog_category prod_cc_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_category
    ADD CONSTRAINT prod_cc_type FOREIGN KEY (prod_catalog_category_type_id) REFERENCES prod_catalog_category_type(prod_catalog_category_type_id);


--
-- PostgreSQL database dump complete
--

