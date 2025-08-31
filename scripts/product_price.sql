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
-- Name: product_price; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_price (
    product_id character varying(20) NOT NULL,
    product_price_type_id character varying(20) NOT NULL,
    product_price_purpose_id character varying(20) NOT NULL,
    currency_uom_id character varying(20) NOT NULL,
    product_store_group_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    price numeric(18,3),
    term_uom_id character varying(20),
    custom_price_calc_service character varying(20),
    price_without_tax numeric(18,3),
    price_with_tax numeric(18,3),
    tax_amount numeric(18,3),
    tax_percentage numeric(18,6),
    tax_auth_party_id character varying(20),
    tax_auth_geo_id character varying(20),
    tax_in_price character(1),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_price OWNER TO ofbiz;

--
-- Name: product_price pk_product_price; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT pk_product_price PRIMARY KEY (product_id, product_price_type_id, product_price_purpose_id, currency_uom_id, product_store_group_id, from_date);


--
-- Name: prd_prc_genlkp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_prc_genlkp ON product_price USING btree (product_id, product_price_purpose_id, currency_uom_id, product_store_group_id);


--
-- Name: prdct_prc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_prc_txcrts ON product_price USING btree (created_tx_stamp);


--
-- Name: prdct_prc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_prc_txstmp ON product_price USING btree (last_updated_tx_stamp);


--
-- Name: prod_prc_taxgeo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prc_taxgeo ON product_price USING btree (tax_auth_geo_id);


--
-- Name: prod_prc_taxpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prc_taxpty ON product_price USING btree (tax_auth_party_id);


--
-- Name: prod_price_cbul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_price_cbul ON product_price USING btree (created_by_user_login);


--
-- Name: prod_price_cmet; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_price_cmet ON product_price USING btree (custom_price_calc_service);


--
-- Name: prod_price_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_price_cuom ON product_price USING btree (currency_uom_id);


--
-- Name: prod_price_lmbul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_price_lmbul ON product_price USING btree (last_modified_by_user_login);


--
-- Name: prod_price_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_price_prod ON product_price USING btree (product_id);


--
-- Name: prod_price_pstg; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_price_pstg ON product_price USING btree (product_store_group_id);


--
-- Name: prod_price_purp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_price_purp ON product_price USING btree (product_price_purpose_id);


--
-- Name: prod_price_tuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_price_tuom ON product_price USING btree (term_uom_id);


--
-- Name: prod_price_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_price_type ON product_price USING btree (product_price_type_id);


--
-- Name: product_price prod_prc_taxgeo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_prc_taxgeo FOREIGN KEY (tax_auth_geo_id) REFERENCES geo(geo_id);


--
-- Name: product_price prod_prc_taxpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_prc_taxpty FOREIGN KEY (tax_auth_party_id) REFERENCES party(party_id);


--
-- Name: product_price prod_price_cbul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_price_cbul FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product_price prod_price_cmet; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_price_cmet FOREIGN KEY (custom_price_calc_service) REFERENCES custom_method(custom_method_id);


--
-- Name: product_price prod_price_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_price_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_price prod_price_lmbul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_price_lmbul FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: product_price prod_price_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_price_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_price prod_price_pstg; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_price_pstg FOREIGN KEY (product_store_group_id) REFERENCES product_store_group(product_store_group_id);


--
-- Name: product_price prod_price_purp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_price_purp FOREIGN KEY (product_price_purpose_id) REFERENCES product_price_purpose(product_price_purpose_id);


--
-- Name: product_price prod_price_tuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_price_tuom FOREIGN KEY (term_uom_id) REFERENCES uom(uom_id);


--
-- Name: product_price prod_price_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price
    ADD CONSTRAINT prod_price_type FOREIGN KEY (product_price_type_id) REFERENCES product_price_type(product_price_type_id);


--
-- PostgreSQL database dump complete
--

