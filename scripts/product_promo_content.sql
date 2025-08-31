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
-- Name: product_promo_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_content (
    product_promo_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    product_promo_content_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_content OWNER TO ofbiz;

--
-- Name: product_promo_content pk_product_promo_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_content
    ADD CONSTRAINT pk_product_promo_content PRIMARY KEY (product_promo_id, content_id, product_promo_content_type_id, from_date);


--
-- Name: prdt_prm_cnt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_cnt_txcrs ON product_promo_content USING btree (created_tx_stamp);


--
-- Name: prdt_prm_cnt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_cnt_txstp ON product_promo_content USING btree (last_updated_tx_stamp);


--
-- Name: prodpr_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodpr_cnt_cnt ON product_promo_content USING btree (content_id);


--
-- Name: prodpr_cnt_prod_pr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodpr_cnt_prod_pr ON product_promo_content USING btree (product_promo_id);


--
-- Name: prodpr_cnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodpr_cnt_type ON product_promo_content USING btree (product_promo_content_type_id);


--
-- Name: product_promo_content prodpr_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_content
    ADD CONSTRAINT prodpr_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: product_promo_content prodpr_cnt_prod_pr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_content
    ADD CONSTRAINT prodpr_cnt_prod_pr FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- Name: product_promo_content prodpr_cnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_content
    ADD CONSTRAINT prodpr_cnt_type FOREIGN KEY (product_promo_content_type_id) REFERENCES product_content_type(product_content_type_id);


--
-- PostgreSQL database dump complete
--

