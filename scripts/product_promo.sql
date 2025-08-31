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
-- Name: product_promo; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo (
    product_promo_id character varying(20) NOT NULL,
    promo_name character varying(100),
    promo_text character varying(255),
    user_entered character(1),
    show_to_customer character(1),
    require_code character(1),
    use_limit_per_order numeric(20,0),
    use_limit_per_customer numeric(20,0),
    use_limit_per_promotion numeric(20,0),
    billback_factor numeric(18,6),
    override_org_party_id character varying(20),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo OWNER TO ofbiz;

--
-- Name: product_promo pk_product_promo; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo
    ADD CONSTRAINT pk_product_promo PRIMARY KEY (product_promo_id);


--
-- Name: prdct_prm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_prm_txcrts ON product_promo USING btree (created_tx_stamp);


--
-- Name: prdct_prm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_prm_txstmp ON product_promo USING btree (last_updated_tx_stamp);


--
-- Name: prod_prmo_cul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prmo_cul ON product_promo USING btree (created_by_user_login);


--
-- Name: prod_prmo_lmcul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prmo_lmcul ON product_promo USING btree (last_modified_by_user_login);


--
-- Name: prod_prmo_opa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prmo_opa ON product_promo USING btree (override_org_party_id);


--
-- Name: product_promo prod_prmo_cul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo
    ADD CONSTRAINT prod_prmo_cul FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product_promo prod_prmo_lmcul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo
    ADD CONSTRAINT prod_prmo_lmcul FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product_promo prod_prmo_opa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo
    ADD CONSTRAINT prod_prmo_opa FOREIGN KEY (override_org_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

