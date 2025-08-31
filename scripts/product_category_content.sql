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
-- Name: product_category_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_category_content (
    product_category_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    prod_cat_content_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    purchase_from_date timestamp with time zone,
    purchase_thru_date timestamp with time zone,
    use_count_limit numeric(20,0),
    use_days_limit numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_category_content OWNER TO ofbiz;

--
-- Name: product_category_content pk_product_category_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_content
    ADD CONSTRAINT pk_product_category_content PRIMARY KEY (product_category_id, content_id, prod_cat_content_type_id, from_date);


--
-- Name: prdcat_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdcat_cnt_cnt ON product_category_content USING btree (content_id);


--
-- Name: prdcat_cnt_cttp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdcat_cnt_cttp ON product_category_content USING btree (product_category_id, prod_cat_content_type_id);


--
-- Name: prdcat_cnt_prdcat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdcat_cnt_prdcat ON product_category_content USING btree (product_category_id);


--
-- Name: prdcat_cnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdcat_cnt_type ON product_category_content USING btree (prod_cat_content_type_id);


--
-- Name: prdt_ctr_cnt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_cnt_txcrs ON product_category_content USING btree (created_tx_stamp);


--
-- Name: prdt_ctr_cnt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ctr_cnt_txstp ON product_category_content USING btree (last_updated_tx_stamp);


--
-- Name: product_category_content prdcat_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_content
    ADD CONSTRAINT prdcat_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: product_category_content prdcat_cnt_prdcat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_content
    ADD CONSTRAINT prdcat_cnt_prdcat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product_category_content prdcat_cnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_content
    ADD CONSTRAINT prdcat_cnt_type FOREIGN KEY (prod_cat_content_type_id) REFERENCES product_category_content_type(prod_cat_content_type_id);


--
-- PostgreSQL database dump complete
--

