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
-- Name: product_feature_cat_grp_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_feature_cat_grp_appl (
    product_category_id character varying(20) NOT NULL,
    product_feature_group_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_feature_cat_grp_appl OWNER TO ofbiz;

--
-- Name: product_feature_cat_grp_appl pk_product_feature_cat_grp_app; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_cat_grp_appl
    ADD CONSTRAINT pk_product_feature_cat_grp_app PRIMARY KEY (product_category_id, product_feature_group_id, from_date);


--
-- Name: prod_fcgapl_cat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fcgapl_cat ON product_feature_cat_grp_appl USING btree (product_category_id);


--
-- Name: prod_fcgapl_fgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fcgapl_fgrp ON product_feature_cat_grp_appl USING btree (product_feature_group_id);


--
-- Name: prt_ct_grp_apl_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ct_grp_apl_tp ON product_feature_cat_grp_appl USING btree (last_updated_tx_stamp);


--
-- Name: prt_ct_grp_apl_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ct_grp_apl_ts ON product_feature_cat_grp_appl USING btree (created_tx_stamp);


--
-- Name: product_feature_cat_grp_appl prod_fcgapl_cat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_cat_grp_appl
    ADD CONSTRAINT prod_fcgapl_cat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product_feature_cat_grp_appl prod_fcgapl_fgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_cat_grp_appl
    ADD CONSTRAINT prod_fcgapl_fgrp FOREIGN KEY (product_feature_group_id) REFERENCES product_feature_group(product_feature_group_id);


--
-- PostgreSQL database dump complete
--

