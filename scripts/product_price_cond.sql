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
-- Name: product_price_cond; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_price_cond (
    product_price_rule_id character varying(20) NOT NULL,
    product_price_cond_seq_id character varying(20) NOT NULL,
    input_param_enum_id character varying(20),
    operator_enum_id character varying(20),
    cond_value character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_price_cond OWNER TO ofbiz;

--
-- Name: product_price_cond pk_product_price_cond; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_cond
    ADD CONSTRAINT pk_product_price_cond PRIMARY KEY (product_price_rule_id, product_price_cond_seq_id);


--
-- Name: prdt_prc_cnd_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prc_cnd_txcrs ON product_price_cond USING btree (created_tx_stamp);


--
-- Name: prdt_prc_cnd_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prc_cnd_txstp ON product_price_cond USING btree (last_updated_tx_stamp);


--
-- Name: prod_pccond_inenum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pccond_inenum ON product_price_cond USING btree (input_param_enum_id);


--
-- Name: prod_pccond_openum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pccond_openum ON product_price_cond USING btree (operator_enum_id);


--
-- Name: prod_pccond_rule; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pccond_rule ON product_price_cond USING btree (product_price_rule_id);


--
-- Name: product_price_cond prod_pccond_inenum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_cond
    ADD CONSTRAINT prod_pccond_inenum FOREIGN KEY (input_param_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_price_cond prod_pccond_openum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_cond
    ADD CONSTRAINT prod_pccond_openum FOREIGN KEY (operator_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_price_cond prod_pccond_rule; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_cond
    ADD CONSTRAINT prod_pccond_rule FOREIGN KEY (product_price_rule_id) REFERENCES product_price_rule(product_price_rule_id);


--
-- PostgreSQL database dump complete
--

