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
-- Name: product_keyword_new; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_keyword_new (
    product_id character varying(20) NOT NULL,
    keyword character varying(60) NOT NULL,
    keyword_type_id character varying(20) NOT NULL,
    relevancy_weight numeric(20,0),
    status_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_keyword_new OWNER TO ofbiz;

--
-- Name: product_keyword_new pk_product_keyword_new; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_keyword_new
    ADD CONSTRAINT pk_product_keyword_new PRIMARY KEY (product_id, keyword, keyword_type_id);


--
-- Name: prdt_kwd_nw_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_kwd_nw_txcrts ON product_keyword_new USING btree (created_tx_stamp);


--
-- Name: prdt_kwd_nw_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_kwd_nw_txstmp ON product_keyword_new USING btree (last_updated_tx_stamp);


--
-- Name: prod_kwd_kwd_new; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_kwd_kwd_new ON product_keyword_new USING btree (keyword);


--
-- Name: prod_kwd_prod_new; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_kwd_prod_new ON product_keyword_new USING btree (product_id);


--
-- Name: prod_kwd_stts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_kwd_stts ON product_keyword_new USING btree (status_id);


--
-- Name: prod_kwd_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_kwd_type ON product_keyword_new USING btree (keyword_type_id);


--
-- Name: product_keyword_new prod_kwd_prod_new; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_keyword_new
    ADD CONSTRAINT prod_kwd_prod_new FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_keyword_new prod_kwd_stts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_keyword_new
    ADD CONSTRAINT prod_kwd_stts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: product_keyword_new prod_kwd_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_keyword_new
    ADD CONSTRAINT prod_kwd_type FOREIGN KEY (keyword_type_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

