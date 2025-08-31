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
-- Name: product_feature_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_feature_appl (
    product_id character varying(20) NOT NULL,
    product_feature_id character varying(20) NOT NULL,
    product_feature_appl_type_id character varying(20),
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    amount numeric(18,2),
    recurring_amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_feature_appl OWNER TO ofbiz;

--
-- Name: product_feature_appl pk_product_feature_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_appl
    ADD CONSTRAINT pk_product_feature_appl PRIMARY KEY (product_id, product_feature_id, from_date);


--
-- Name: prdt_ftr_apl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ftr_apl_txcrs ON product_feature_appl USING btree (created_tx_stamp);


--
-- Name: prdt_ftr_apl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_ftr_apl_txstp ON product_feature_appl USING btree (last_updated_tx_stamp);


--
-- Name: prod_fappl_feature; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fappl_feature ON product_feature_appl USING btree (product_feature_id);


--
-- Name: prod_fappl_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fappl_product ON product_feature_appl USING btree (product_id);


--
-- Name: prod_fappl_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fappl_type ON product_feature_appl USING btree (product_feature_appl_type_id);


--
-- Name: product_feature_appl prod_fappl_feature; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_appl
    ADD CONSTRAINT prod_fappl_feature FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- Name: product_feature_appl prod_fappl_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_appl
    ADD CONSTRAINT prod_fappl_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_feature_appl prod_fappl_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_feature_appl
    ADD CONSTRAINT prod_fappl_type FOREIGN KEY (product_feature_appl_type_id) REFERENCES product_feature_appl_type(product_feature_appl_type_id);


--
-- PostgreSQL database dump complete
--

