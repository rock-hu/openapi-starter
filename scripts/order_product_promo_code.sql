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
-- Name: order_product_promo_code; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_product_promo_code (
    order_id character varying(20) NOT NULL,
    product_promo_code_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_product_promo_code OWNER TO ofbiz;

--
-- Name: order_product_promo_code pk_order_product_promo_code; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_product_promo_code
    ADD CONSTRAINT pk_order_product_promo_code PRIMARY KEY (order_id, product_promo_code_id);


--
-- Name: order_ppcd_ord; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_ppcd_ord ON order_product_promo_code USING btree (order_id);


--
-- Name: order_ppcd_ppc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_ppcd_ppc ON order_product_promo_code USING btree (product_promo_code_id);


--
-- Name: orr_prt_prm_cd_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_prt_prm_cd_txp ON order_product_promo_code USING btree (last_updated_tx_stamp);


--
-- Name: orr_prt_prm_cd_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_prt_prm_cd_txs ON order_product_promo_code USING btree (created_tx_stamp);


--
-- Name: order_product_promo_code order_ppcd_ord; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_product_promo_code
    ADD CONSTRAINT order_ppcd_ord FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_product_promo_code order_ppcd_ppc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_product_promo_code
    ADD CONSTRAINT order_ppcd_ppc FOREIGN KEY (product_promo_code_id) REFERENCES product_promo_code(product_promo_code_id);


--
-- PostgreSQL database dump complete
--

