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
-- Name: product_feature_iactn; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_feature_iactn (
    product_feature_id character varying(20) NOT NULL,
    product_feature_id_to character varying(20) NOT NULL,
    product_feature_iactn_type_id character varying(20),
    product_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_feature_iactn OWNER TO ofbiz;

--
-- Name: product_feature_iactn pk_product_feature_iactn; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_iactn
    ADD CONSTRAINT pk_product_feature_iactn PRIMARY KEY (product_feature_id, product_feature_id_to);


--
-- Name: prdt_ftr_icn_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ftr_icn_txcrs ON product_feature_iactn USING btree (created_tx_stamp);


--
-- Name: prdt_ftr_icn_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ftr_icn_txstp ON product_feature_iactn USING btree (last_updated_tx_stamp);


--
-- Name: prod_fictn_afeat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fictn_afeat ON product_feature_iactn USING btree (product_feature_id_to);


--
-- Name: prod_fictn_mfeat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fictn_mfeat ON product_feature_iactn USING btree (product_feature_id);


--
-- Name: prod_fictn_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fictn_type ON product_feature_iactn USING btree (product_feature_iactn_type_id);


--
-- Name: product_feature_iactn prod_fictn_afeat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_iactn
    ADD CONSTRAINT prod_fictn_afeat FOREIGN KEY (product_feature_id_to) REFERENCES product_feature(product_feature_id);


--
-- Name: product_feature_iactn prod_fictn_mfeat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_iactn
    ADD CONSTRAINT prod_fictn_mfeat FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- Name: product_feature_iactn prod_fictn_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_iactn
    ADD CONSTRAINT prod_fictn_type FOREIGN KEY (product_feature_iactn_type_id) REFERENCES product_feature_iactn_type(product_feature_iactn_type_id);


--
-- PostgreSQL database dump complete
--

