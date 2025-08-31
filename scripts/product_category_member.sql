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
-- Name: product_category_member; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_category_member (
    product_category_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    comments character varying(255),
    sequence_num numeric(20,0),
    quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_category_member OWNER TO ofbiz;

--
-- Name: product_category_member pk_product_category_member; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_member
    ADD CONSTRAINT pk_product_category_member PRIMARY KEY (product_category_id, product_id, from_date);


--
-- Name: prd_cmbr_pct; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_cmbr_pct ON product_category_member USING btree (product_category_id);


--
-- Name: prdt_ctr_mmr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_mmr_txcrs ON product_category_member USING btree (created_tx_stamp);


--
-- Name: prdt_ctr_mmr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_mmr_txstp ON product_category_member USING btree (last_updated_tx_stamp);


--
-- Name: prod_cmbr_category; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cmbr_category ON product_category_member USING btree (product_category_id);


--
-- Name: prod_cmbr_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cmbr_product ON product_category_member USING btree (product_id);


--
-- Name: product_category_member prod_cmbr_category; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_member
    ADD CONSTRAINT prod_cmbr_category FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product_category_member prod_cmbr_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_member
    ADD CONSTRAINT prod_cmbr_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

