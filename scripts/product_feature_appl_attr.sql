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
-- Name: product_feature_appl_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_feature_appl_attr (
    product_id character varying(20) NOT NULL,
    product_feature_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    attr_name character varying(60) NOT NULL,
    attr_value character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_feature_appl_attr OWNER TO ofbiz;

--
-- Name: product_feature_appl_attr pk_product_feature_appl_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_appl_attr
    ADD CONSTRAINT pk_product_feature_appl_attr PRIMARY KEY (product_id, product_feature_id, from_date, attr_name);


--
-- Name: prod_fappa_featapp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fappa_featapp ON product_feature_appl_attr USING btree (product_id, product_feature_id, from_date);


--
-- Name: prod_fappa_feature; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fappa_feature ON product_feature_appl_attr USING btree (product_feature_id);


--
-- Name: prod_fappa_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fappa_product ON product_feature_appl_attr USING btree (product_id);


--
-- Name: prt_ftr_apl_atr_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ftr_apl_atr_tp ON product_feature_appl_attr USING btree (last_updated_tx_stamp);


--
-- Name: prt_ftr_apl_atr_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ftr_apl_atr_ts ON product_feature_appl_attr USING btree (created_tx_stamp);


--
-- Name: product_feature_appl_attr prod_fappa_featapp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_appl_attr
    ADD CONSTRAINT prod_fappa_featapp FOREIGN KEY (product_id, product_feature_id, from_date) REFERENCES product_feature_appl(product_id, product_feature_id, from_date);


--
-- Name: product_feature_appl_attr prod_fappa_feature; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_appl_attr
    ADD CONSTRAINT prod_fappa_feature FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- Name: product_feature_appl_attr prod_fappa_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_appl_attr
    ADD CONSTRAINT prod_fappa_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

