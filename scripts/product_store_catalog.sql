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
-- Name: product_store_catalog; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_catalog (
    product_store_id character varying(20) NOT NULL,
    prod_catalog_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_catalog OWNER TO ofbiz;

--
-- Name: product_store_catalog pk_product_store_catalog; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_catalog
    ADD CONSTRAINT pk_product_store_catalog PRIMARY KEY (product_store_id, prod_catalog_id, from_date);


--
-- Name: prdt_str_ctg_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_str_ctg_txcrs ON product_store_catalog USING btree (created_tx_stamp);


--
-- Name: prdt_str_ctg_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_str_ctg_txstp ON product_store_catalog USING btree (last_updated_tx_stamp);


--
-- Name: ps_cat_catalog; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ps_cat_catalog ON product_store_catalog USING btree (prod_catalog_id);


--
-- Name: ps_cat_prdstr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ps_cat_prdstr ON product_store_catalog USING btree (product_store_id);


--
-- Name: product_store_catalog ps_cat_catalog; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_catalog
    ADD CONSTRAINT ps_cat_catalog FOREIGN KEY (prod_catalog_id) REFERENCES prod_catalog(prod_catalog_id);


--
-- Name: product_store_catalog ps_cat_prdstr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_catalog
    ADD CONSTRAINT ps_cat_prdstr FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- PostgreSQL database dump complete
--

