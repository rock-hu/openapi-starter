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
-- Name: desired_feature; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE desired_feature (
    desired_feature_id character varying(20) NOT NULL,
    requirement_id character varying(20) NOT NULL,
    product_feature_id character varying(20),
    optional_ind character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.desired_feature OWNER TO ofbiz;

--
-- Name: desired_feature pk_desired_feature; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY desired_feature
    ADD CONSTRAINT pk_desired_feature PRIMARY KEY (desired_feature_id, requirement_id);


--
-- Name: des_feat_pfeat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX des_feat_pfeat ON desired_feature USING btree (product_feature_id);


--
-- Name: des_feat_req; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX des_feat_req ON desired_feature USING btree (requirement_id);


--
-- Name: dsrd_ftr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dsrd_ftr_txcrts ON desired_feature USING btree (created_tx_stamp);


--
-- Name: dsrd_ftr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dsrd_ftr_txstmp ON desired_feature USING btree (last_updated_tx_stamp);


--
-- Name: desired_feature des_feat_pfeat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY desired_feature
    ADD CONSTRAINT des_feat_pfeat FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- Name: desired_feature des_feat_req; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY desired_feature
    ADD CONSTRAINT des_feat_req FOREIGN KEY (requirement_id) REFERENCES requirement(requirement_id);


--
-- PostgreSQL database dump complete
--

