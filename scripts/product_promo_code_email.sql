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
-- Name: product_promo_code_email; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_code_email (
    product_promo_code_id character varying(20) NOT NULL,
    email_address character varying(320) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_code_email OWNER TO ofbiz;

--
-- Name: product_promo_code_email pk_product_promo_code_email; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_code_email
    ADD CONSTRAINT pk_product_promo_code_email PRIMARY KEY (product_promo_code_id, email_address);


--
-- Name: prod_prcde_opcd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcde_opcd ON product_promo_code_email USING btree (product_promo_code_id);


--
-- Name: prt_prm_cd_eml_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_prm_cd_eml_txp ON product_promo_code_email USING btree (last_updated_tx_stamp);


--
-- Name: prt_prm_cd_eml_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_prm_cd_eml_txs ON product_promo_code_email USING btree (created_tx_stamp);


--
-- Name: product_promo_code_email prod_prcde_opcd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_code_email
    ADD CONSTRAINT prod_prcde_opcd FOREIGN KEY (product_promo_code_id) REFERENCES product_promo_code(product_promo_code_id);


--
-- PostgreSQL database dump complete
--

