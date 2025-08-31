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
-- Name: product_promo_code; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_code (
    product_promo_code_id character varying(20) NOT NULL,
    product_promo_id character varying(20),
    user_entered character(1),
    require_email_or_party character(1),
    use_limit_per_code numeric(20,0),
    use_limit_per_customer numeric(20,0),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_code OWNER TO ofbiz;

--
-- Name: product_promo_code pk_product_promo_code; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_code
    ADD CONSTRAINT pk_product_promo_code PRIMARY KEY (product_promo_code_id);


--
-- Name: prdt_prm_cd_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_cd_txcrts ON product_promo_code USING btree (created_tx_stamp);


--
-- Name: prdt_prm_cd_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_cd_txstmp ON product_promo_code USING btree (last_updated_tx_stamp);


--
-- Name: prod_prcod_cul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcod_cul ON product_promo_code USING btree (created_by_user_login);


--
-- Name: prod_prcod_lmcul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcod_lmcul ON product_promo_code USING btree (last_modified_by_user_login);


--
-- Name: prod_prcod_promo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcod_promo ON product_promo_code USING btree (product_promo_id);


--
-- Name: product_promo_code prod_prcod_cul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_code
    ADD CONSTRAINT prod_prcod_cul FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product_promo_code prod_prcod_lmcul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_code
    ADD CONSTRAINT prod_prcod_lmcul FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product_promo_code prod_prcod_promo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_code
    ADD CONSTRAINT prod_prcod_promo FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- PostgreSQL database dump complete
--

