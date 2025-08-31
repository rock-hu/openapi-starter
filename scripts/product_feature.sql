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
-- Name: product_feature; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_feature (
    product_feature_id character varying(20) NOT NULL,
    product_feature_type_id character varying(20),
    product_feature_category_id character varying(20),
    description character varying(255),
    uom_id character varying(20),
    number_specified numeric(18,6),
    default_amount numeric(18,2),
    default_sequence_num numeric(20,0),
    abbrev character varying(20),
    id_code character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_feature OWNER TO ofbiz;

--
-- Name: product_feature pk_product_feature; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature
    ADD CONSTRAINT pk_product_feature PRIMARY KEY (product_feature_id);


--
-- Name: prdct_ftr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_ftr_txcrts ON product_feature USING btree (created_tx_stamp);


--
-- Name: prdct_ftr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_ftr_txstmp ON product_feature USING btree (last_updated_tx_stamp);


--
-- Name: prod_feat_category; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_feat_category ON product_feature USING btree (product_feature_category_id);


--
-- Name: prod_feat_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_feat_type ON product_feature USING btree (product_feature_type_id);


--
-- Name: prod_feat_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_feat_uom ON product_feature USING btree (uom_id);


--
-- Name: product_feature prod_feat_category; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature
    ADD CONSTRAINT prod_feat_category FOREIGN KEY (product_feature_category_id) REFERENCES product_feature_category(product_feature_category_id);


--
-- Name: product_feature prod_feat_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature
    ADD CONSTRAINT prod_feat_type FOREIGN KEY (product_feature_type_id) REFERENCES product_feature_type(product_feature_type_id);


--
-- Name: product_feature prod_feat_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature
    ADD CONSTRAINT prod_feat_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

