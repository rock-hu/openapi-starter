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
-- Name: tax_authority_category; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tax_authority_category (
    tax_auth_geo_id character varying(20) NOT NULL,
    tax_auth_party_id character varying(20) NOT NULL,
    product_category_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tax_authority_category OWNER TO ofbiz;

--
-- Name: tax_authority_category pk_tax_authority_category; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_category
    ADD CONSTRAINT pk_tax_authority_category PRIMARY KEY (tax_auth_geo_id, tax_auth_party_id, product_category_id);


--
-- Name: taxauthcat_cat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthcat_cat ON tax_authority_category USING btree (product_category_id);


--
-- Name: taxauthcat_txa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthcat_txa ON tax_authority_category USING btree (tax_auth_geo_id, tax_auth_party_id);


--
-- Name: tx_atht_ctr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_atht_ctr_txcrts ON tax_authority_category USING btree (created_tx_stamp);


--
-- Name: tx_atht_ctr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_atht_ctr_txstmp ON tax_authority_category USING btree (last_updated_tx_stamp);


--
-- Name: tax_authority_category taxauthcat_cat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_category
    ADD CONSTRAINT taxauthcat_cat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: tax_authority_category taxauthcat_txa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_category
    ADD CONSTRAINT taxauthcat_txa FOREIGN KEY (tax_auth_geo_id, tax_auth_party_id) REFERENCES tax_authority(tax_auth_geo_id, tax_auth_party_id);


--
-- PostgreSQL database dump complete
--

