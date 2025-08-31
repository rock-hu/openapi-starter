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
-- Name: product_promo_cond; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_cond (
    product_promo_id character varying(20) NOT NULL,
    product_promo_rule_id character varying(20) NOT NULL,
    product_promo_cond_seq_id character varying(20) NOT NULL,
    custom_method_id character varying(20),
    input_param_enum_id character varying(20),
    operator_enum_id character varying(20),
    cond_value character varying(255),
    other_value character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_cond OWNER TO ofbiz;

--
-- Name: product_promo_cond pk_product_promo_cond; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_cond
    ADD CONSTRAINT pk_product_promo_cond PRIMARY KEY (product_promo_id, product_promo_rule_id, product_promo_cond_seq_id);


--
-- Name: prdt_prm_cnd_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_cnd_txcrs ON product_promo_cond USING btree (created_tx_stamp);


--
-- Name: prdt_prm_cnd_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_cnd_txstp ON product_promo_cond USING btree (last_updated_tx_stamp);


--
-- Name: prod_prcond_cmeth; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcond_cmeth ON product_promo_cond USING btree (custom_method_id);


--
-- Name: prod_prcond_inenum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcond_inenum ON product_promo_cond USING btree (input_param_enum_id);


--
-- Name: prod_prcond_openum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcond_openum ON product_promo_cond USING btree (operator_enum_id);


--
-- Name: prod_prcond_promo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcond_promo ON product_promo_cond USING btree (product_promo_id);


--
-- Name: prod_prcond_rule; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcond_rule ON product_promo_cond USING btree (product_promo_id, product_promo_rule_id);


--
-- Name: product_promo_cond prod_prcond_cmeth; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_cond
    ADD CONSTRAINT prod_prcond_cmeth FOREIGN KEY (custom_method_id) REFERENCES custom_method(custom_method_id);


--
-- Name: product_promo_cond prod_prcond_inenum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_cond
    ADD CONSTRAINT prod_prcond_inenum FOREIGN KEY (input_param_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_promo_cond prod_prcond_openum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_cond
    ADD CONSTRAINT prod_prcond_openum FOREIGN KEY (operator_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_promo_cond prod_prcond_promo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_cond
    ADD CONSTRAINT prod_prcond_promo FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- Name: product_promo_cond prod_prcond_rule; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_cond
    ADD CONSTRAINT prod_prcond_rule FOREIGN KEY (product_promo_id, product_promo_rule_id) REFERENCES product_promo_rule(product_promo_id, product_promo_rule_id);


--
-- PostgreSQL database dump complete
--

