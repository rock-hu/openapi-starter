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
-- Name: product_review; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_review (
    product_review_id character varying(20) NOT NULL,
    product_store_id character varying(20),
    product_id character varying(20),
    user_login_id character varying(255),
    status_id character varying(20),
    posted_anonymous character(1),
    posted_date_time timestamp with time zone,
    product_rating numeric(18,6),
    product_review text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_review OWNER TO ofbiz;

--
-- Name: product_review pk_product_review; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_review
    ADD CONSTRAINT pk_product_review PRIMARY KEY (product_review_id);


--
-- Name: prdct_rvw_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_rvw_txcrts ON product_review USING btree (created_tx_stamp);


--
-- Name: prdct_rvw_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_rvw_txstmp ON product_review USING btree (last_updated_tx_stamp);


--
-- Name: prod_review_prdstr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_review_prdstr ON product_review USING btree (product_store_id);


--
-- Name: prod_review_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_review_prod ON product_review USING btree (product_id);


--
-- Name: prod_review_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_review_stts ON product_review USING btree (status_id);


--
-- Name: prod_review_ulh; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_review_ulh ON product_review USING btree (user_login_id);


--
-- Name: product_review prod_review_prdstr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_review
    ADD CONSTRAINT prod_review_prdstr FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: product_review prod_review_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_review
    ADD CONSTRAINT prod_review_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_review prod_review_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_review
    ADD CONSTRAINT prod_review_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: product_review prod_review_ulh; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_review
    ADD CONSTRAINT prod_review_ulh FOREIGN KEY (user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

