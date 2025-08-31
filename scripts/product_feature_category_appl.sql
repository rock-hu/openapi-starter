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
-- Name: product_feature_category_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_feature_category_appl (
    product_category_id character varying(20) NOT NULL,
    product_feature_category_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_feature_category_appl OWNER TO ofbiz;

--
-- Name: product_feature_category_appl pk_product_feature_category_ap; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_category_appl
    ADD CONSTRAINT pk_product_feature_category_ap PRIMARY KEY (product_category_id, product_feature_category_id, from_date);


--
-- Name: prod_fcappl_cat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fcappl_cat ON product_feature_category_appl USING btree (product_category_id);


--
-- Name: prod_fcappl_fcat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fcappl_fcat ON product_feature_category_appl USING btree (product_feature_category_id);


--
-- Name: prt_ftr_ctr_apl_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ftr_ctr_apl_tp ON product_feature_category_appl USING btree (last_updated_tx_stamp);


--
-- Name: prt_ftr_ctr_apl_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ftr_ctr_apl_ts ON product_feature_category_appl USING btree (created_tx_stamp);


--
-- Name: product_feature_category_appl prod_fcappl_cat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_category_appl
    ADD CONSTRAINT prod_fcappl_cat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product_feature_category_appl prod_fcappl_fcat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_category_appl
    ADD CONSTRAINT prod_fcappl_fcat FOREIGN KEY (product_feature_category_id) REFERENCES product_feature_category(product_feature_category_id);


--
-- PostgreSQL database dump complete
--

