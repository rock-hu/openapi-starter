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
-- Name: supplier_product_feature; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE supplier_product_feature (
    party_id character varying(20) NOT NULL,
    product_feature_id character varying(20) NOT NULL,
    description character varying(100),
    uom_id character varying(20),
    id_code character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.supplier_product_feature OWNER TO ofbiz;

--
-- Name: supplier_product_feature pk_supplier_product_feature; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product_feature
    ADD CONSTRAINT pk_supplier_product_feature PRIMARY KEY (party_id, product_feature_id);


--
-- Name: sppr_prt_ftr_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sppr_prt_ftr_txcrs ON supplier_product_feature USING btree (created_tx_stamp);


--
-- Name: sppr_prt_ftr_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sppr_prt_ftr_txstp ON supplier_product_feature USING btree (last_updated_tx_stamp);


--
-- Name: suppl_feat_feat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_feat_feat ON supplier_product_feature USING btree (product_feature_id);


--
-- Name: suppl_feat_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_feat_party ON supplier_product_feature USING btree (party_id);


--
-- Name: suppl_feat_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX suppl_feat_uom ON supplier_product_feature USING btree (uom_id);


--
-- Name: supplier_product_feature suppl_feat_feat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product_feature
    ADD CONSTRAINT suppl_feat_feat FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- Name: supplier_product_feature suppl_feat_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product_feature
    ADD CONSTRAINT suppl_feat_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: supplier_product_feature suppl_feat_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY supplier_product_feature
    ADD CONSTRAINT suppl_feat_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

