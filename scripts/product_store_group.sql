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
-- Name: product_store_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_group (
    product_store_group_id character varying(20) NOT NULL,
    product_store_group_type_id character varying(20),
    primary_parent_group_id character varying(20),
    product_store_group_name character varying(100),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_group OWNER TO ofbiz;

--
-- Name: product_store_group pk_product_store_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group
    ADD CONSTRAINT pk_product_store_group PRIMARY KEY (product_store_group_id);


--
-- Name: prdstr_gp_pgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstr_gp_pgrp ON product_store_group USING btree (primary_parent_group_id);


--
-- Name: prdstr_gp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstr_gp_type ON product_store_group USING btree (product_store_group_type_id);


--
-- Name: prdt_str_grp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_str_grp_txcrs ON product_store_group USING btree (created_tx_stamp);


--
-- Name: prdt_str_grp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_str_grp_txstp ON product_store_group USING btree (last_updated_tx_stamp);


--
-- Name: product_store_group prdstr_gp_pgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group
    ADD CONSTRAINT prdstr_gp_pgrp FOREIGN KEY (primary_parent_group_id) REFERENCES product_store_group(product_store_group_id);


--
-- Name: product_store_group prdstr_gp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_group
    ADD CONSTRAINT prdstr_gp_type FOREIGN KEY (product_store_group_type_id) REFERENCES product_store_group_type(product_store_group_type_id);


--
-- PostgreSQL database dump complete
--

