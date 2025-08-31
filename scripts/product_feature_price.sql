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
-- Name: product_feature_price; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_feature_price (
    product_feature_id character varying(20) NOT NULL,
    product_price_type_id character varying(20) NOT NULL,
    currency_uom_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    price numeric(18,3),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_feature_price OWNER TO ofbiz;

--
-- Name: product_feature_price pk_product_feature_price; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_price
    ADD CONSTRAINT pk_product_feature_price PRIMARY KEY (product_feature_id, product_price_type_id, currency_uom_id, from_date);


--
-- Name: prd_ft_prc_genlkp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ft_prc_genlkp ON product_feature_price USING btree (product_feature_id, currency_uom_id);


--
-- Name: prdt_ftr_prc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ftr_prc_txcrs ON product_feature_price USING btree (created_tx_stamp);


--
-- Name: prdt_ftr_prc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ftr_prc_txstp ON product_feature_price USING btree (last_updated_tx_stamp);


--
-- Name: prod_f_price_cbul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_f_price_cbul ON product_feature_price USING btree (created_by_user_login);


--
-- Name: prod_f_price_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_f_price_cuom ON product_feature_price USING btree (currency_uom_id);


--
-- Name: prod_f_price_lmbul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_f_price_lmbul ON product_feature_price USING btree (last_modified_by_user_login);


--
-- Name: prod_f_price_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_f_price_type ON product_feature_price USING btree (product_price_type_id);


--
-- Name: product_feature_price prod_f_price_cbul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_price
    ADD CONSTRAINT prod_f_price_cbul FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product_feature_price prod_f_price_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_price
    ADD CONSTRAINT prod_f_price_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_feature_price prod_f_price_lmbul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_price
    ADD CONSTRAINT prod_f_price_lmbul FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product_feature_price prod_f_price_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_price
    ADD CONSTRAINT prod_f_price_type FOREIGN KEY (product_price_type_id) REFERENCES product_price_type(product_price_type_id);


--
-- PostgreSQL database dump complete
--

