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
-- Name: prod_catalog_category_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE prod_catalog_category_type (
    prod_catalog_category_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.prod_catalog_category_type OWNER TO ofbiz;

--
-- Name: prod_catalog_category_type pk_prod_catalog_category_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_category_type
    ADD CONSTRAINT pk_prod_catalog_category_type PRIMARY KEY (prod_catalog_category_type_id);


--
-- Name: prd_ctg_ctr_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctg_ctr_tp_txp ON prod_catalog_category_type USING btree (last_updated_tx_stamp);


--
-- Name: prd_ctg_ctr_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctg_ctr_tp_txs ON prod_catalog_category_type USING btree (created_tx_stamp);


--
-- Name: prod_pcct_typepar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pcct_typepar ON prod_catalog_category_type USING btree (parent_type_id);


--
-- Name: prod_catalog_category_type prod_pcct_typepar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_category_type
    ADD CONSTRAINT prod_pcct_typepar FOREIGN KEY (parent_type_id) REFERENCES prod_catalog_category_type(prod_catalog_category_type_id);


--
-- PostgreSQL database dump complete
--

