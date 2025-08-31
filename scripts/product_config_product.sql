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
-- Name: product_config_product; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_config_product (
    config_item_id character varying(20) NOT NULL,
    config_option_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    quantity numeric(18,6),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_config_product OWNER TO ofbiz;

--
-- Name: product_config_product pk_product_config_product; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_product
    ADD CONSTRAINT pk_product_config_product PRIMARY KEY (config_item_id, config_option_id, product_id);


--
-- Name: prdt_cng_prt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_cng_prt_txcrs ON product_config_product USING btree (created_tx_stamp);


--
-- Name: prdt_cng_prt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_cng_prt_txstp ON product_config_product USING btree (last_updated_tx_stamp);


--
-- Name: prod_confp_item; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_confp_item ON product_config_product USING btree (config_item_id);


--
-- Name: prod_confp_optn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_confp_optn ON product_config_product USING btree (config_item_id, config_option_id);


--
-- Name: prod_confp_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_confp_prod ON product_config_product USING btree (product_id);


--
-- Name: product_config_product prod_confp_item; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_product
    ADD CONSTRAINT prod_confp_item FOREIGN KEY (config_item_id) REFERENCES product_config_item(config_item_id);


--
-- Name: product_config_product prod_confp_optn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_product
    ADD CONSTRAINT prod_confp_optn FOREIGN KEY (config_item_id, config_option_id) REFERENCES product_config_option(config_item_id, config_option_id);


--
-- Name: product_config_product prod_confp_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_config_product
    ADD CONSTRAINT prod_confp_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

