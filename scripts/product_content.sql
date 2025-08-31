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
-- Name: product_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_content (
    product_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    product_content_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    purchase_from_date timestamp with time zone,
    purchase_thru_date timestamp with time zone,
    use_count_limit numeric(20,0),
    use_time numeric(20,0),
    use_time_uom_id character varying(20),
    use_role_type_id character varying(20),
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_content OWNER TO ofbiz;

--
-- Name: product_content pk_product_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_content
    ADD CONSTRAINT pk_product_content PRIMARY KEY (product_id, content_id, product_content_type_id, from_date);


--
-- Name: prdct_cntnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_cntnt_txcrts ON product_content USING btree (created_tx_stamp);


--
-- Name: prdct_cntnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_cntnt_txstmp ON product_content USING btree (last_updated_tx_stamp);


--
-- Name: prod_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cnt_cnt ON product_content USING btree (content_id);


--
-- Name: prod_cnt_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cnt_prod ON product_content USING btree (product_id);


--
-- Name: prod_cnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cnt_type ON product_content USING btree (product_content_type_id);


--
-- Name: prod_cnt_urt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cnt_urt ON product_content USING btree (use_role_type_id);


--
-- Name: prod_cnt_utu; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cnt_utu ON product_content USING btree (use_time_uom_id);


--
-- Name: product_content prod_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_content
    ADD CONSTRAINT prod_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: product_content prod_cnt_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_content
    ADD CONSTRAINT prod_cnt_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_content prod_cnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_content
    ADD CONSTRAINT prod_cnt_type FOREIGN KEY (product_content_type_id) REFERENCES product_content_type(product_content_type_id);


--
-- Name: product_content prod_cnt_urt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_content
    ADD CONSTRAINT prod_cnt_urt FOREIGN KEY (use_role_type_id) REFERENCES role_type(role_type_id);


--
-- Name: product_content prod_cnt_utu; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_content
    ADD CONSTRAINT prod_cnt_utu FOREIGN KEY (use_time_uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

