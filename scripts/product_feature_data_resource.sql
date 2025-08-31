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
-- Name: product_feature_data_resource; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_feature_data_resource (
    data_resource_id character varying(20) NOT NULL,
    product_feature_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_feature_data_resource OWNER TO ofbiz;

--
-- Name: product_feature_data_resource pk_product_feature_data_resour; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_data_resource
    ADD CONSTRAINT pk_product_feature_data_resour PRIMARY KEY (data_resource_id, product_feature_id);


--
-- Name: pfeat_dr_datres; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pfeat_dr_datres ON product_feature_data_resource USING btree (data_resource_id);


--
-- Name: pfeat_dr_feature; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pfeat_dr_feature ON product_feature_data_resource USING btree (product_feature_id);


--
-- Name: prt_ftr_dt_rsc_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ftr_dt_rsc_txp ON product_feature_data_resource USING btree (last_updated_tx_stamp);


--
-- Name: prt_ftr_dt_rsc_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ftr_dt_rsc_txs ON product_feature_data_resource USING btree (created_tx_stamp);


--
-- Name: product_feature_data_resource pfeat_dr_datres; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_data_resource
    ADD CONSTRAINT pfeat_dr_datres FOREIGN KEY (data_resource_id) REFERENCES data_resource(data_resource_id);


--
-- Name: product_feature_data_resource pfeat_dr_feature; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_data_resource
    ADD CONSTRAINT pfeat_dr_feature FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- PostgreSQL database dump complete
--

