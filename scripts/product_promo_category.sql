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
-- Name: product_promo_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_category (
    product_promo_id character varying(20) NOT NULL,
    product_promo_rule_id character varying(20) NOT NULL,
    product_promo_action_seq_id character varying(20) NOT NULL,
    product_promo_cond_seq_id character varying(20) NOT NULL,
    product_category_id character varying(20) NOT NULL,
    and_group_id character varying(20) NOT NULL,
    product_promo_appl_enum_id character varying(20),
    include_sub_categories character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_category OWNER TO ofbiz;

--
-- Name: product_promo_category pk_product_promo_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_category
    ADD CONSTRAINT pk_product_promo_category PRIMARY KEY (product_promo_id, product_promo_rule_id, product_promo_action_seq_id, product_promo_cond_seq_id, product_category_id, and_group_id);


--
-- Name: prdt_prm_ctr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_ctr_txcrs ON product_promo_category USING btree (created_tx_stamp);


--
-- Name: prdt_prm_ctr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_ctr_txstp ON product_promo_category USING btree (last_updated_tx_stamp);


--
-- Name: prod_prcat_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcat_enum ON product_promo_category USING btree (product_promo_appl_enum_id);


--
-- Name: prod_prcat_prcat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcat_prcat ON product_promo_category USING btree (product_category_id);


--
-- Name: prod_prcat_promo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcat_promo ON product_promo_category USING btree (product_promo_id);


--
-- Name: product_promo_category prod_prcat_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_category
    ADD CONSTRAINT prod_prcat_enum FOREIGN KEY (product_promo_appl_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_promo_category prod_prcat_prcat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_category
    ADD CONSTRAINT prod_prcat_prcat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product_promo_category prod_prcat_promo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_category
    ADD CONSTRAINT prod_prcat_promo FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- PostgreSQL database dump complete
--

