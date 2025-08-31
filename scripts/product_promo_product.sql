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
-- Name: product_promo_product; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_product (
    product_promo_id character varying(20) NOT NULL,
    product_promo_rule_id character varying(20) NOT NULL,
    product_promo_action_seq_id character varying(20) NOT NULL,
    product_promo_cond_seq_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    product_promo_appl_enum_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_product OWNER TO ofbiz;

--
-- Name: product_promo_product pk_product_promo_product; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_product
    ADD CONSTRAINT pk_product_promo_product PRIMARY KEY (product_promo_id, product_promo_rule_id, product_promo_action_seq_id, product_promo_cond_seq_id, product_id);


--
-- Name: prdt_prm_prt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_prt_txcrs ON product_promo_product USING btree (created_tx_stamp);


--
-- Name: prdt_prm_prt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_prt_txstp ON product_promo_product USING btree (last_updated_tx_stamp);


--
-- Name: prod_prprd_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prprd_enum ON product_promo_product USING btree (product_promo_appl_enum_id);


--
-- Name: prod_prprd_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prprd_prod ON product_promo_product USING btree (product_id);


--
-- Name: prod_prprd_promo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prprd_promo ON product_promo_product USING btree (product_promo_id);


--
-- Name: product_promo_product prod_prprd_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_product
    ADD CONSTRAINT prod_prprd_enum FOREIGN KEY (product_promo_appl_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_promo_product prod_prprd_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_product
    ADD CONSTRAINT prod_prprd_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_promo_product prod_prprd_promo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_product
    ADD CONSTRAINT prod_prprd_promo FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- PostgreSQL database dump complete
--

