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
-- Name: product_category_rollup; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_category_rollup (
    product_category_id character varying(20) NOT NULL,
    parent_product_category_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_category_rollup OWNER TO ofbiz;

--
-- Name: product_category_rollup pk_product_category_rollup; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_rollup
    ADD CONSTRAINT pk_product_category_rollup PRIMARY KEY (product_category_id, parent_product_category_id, from_date);


--
-- Name: prdcr_parpc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdcr_parpc ON product_category_rollup USING btree (parent_product_category_id);


--
-- Name: prdt_ctr_rlp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_rlp_txcrs ON product_category_rollup USING btree (created_tx_stamp);


--
-- Name: prdt_ctr_rlp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_rlp_txstp ON product_category_rollup USING btree (last_updated_tx_stamp);


--
-- Name: prod_crlp_current; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_crlp_current ON product_category_rollup USING btree (product_category_id);


--
-- Name: prod_crlp_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_crlp_parent ON product_category_rollup USING btree (parent_product_category_id);


--
-- Name: product_category_rollup prod_crlp_current; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_rollup
    ADD CONSTRAINT prod_crlp_current FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product_category_rollup prod_crlp_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_rollup
    ADD CONSTRAINT prod_crlp_parent FOREIGN KEY (parent_product_category_id) REFERENCES product_category(product_category_id);


--
-- PostgreSQL database dump complete
--

