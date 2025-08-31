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
-- Name: product_promo_rule; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_rule (
    product_promo_id character varying(20) NOT NULL,
    product_promo_rule_id character varying(20) NOT NULL,
    rule_name character varying(100),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_rule OWNER TO ofbiz;

--
-- Name: product_promo_rule pk_product_promo_rule; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_rule
    ADD CONSTRAINT pk_product_promo_rule PRIMARY KEY (product_promo_id, product_promo_rule_id);


--
-- Name: prdt_prm_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_rl_txcrts ON product_promo_rule USING btree (created_tx_stamp);


--
-- Name: prdt_prm_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_rl_txstmp ON product_promo_rule USING btree (last_updated_tx_stamp);


--
-- Name: prod_prrle_promo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prrle_promo ON product_promo_rule USING btree (product_promo_id);


--
-- Name: product_promo_rule prod_prrle_promo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_rule
    ADD CONSTRAINT prod_prrle_promo FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- PostgreSQL database dump complete
--

