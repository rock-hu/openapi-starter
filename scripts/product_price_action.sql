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
-- Name: product_price_action; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_price_action (
    product_price_rule_id character varying(20) NOT NULL,
    product_price_action_seq_id character varying(20) NOT NULL,
    product_price_action_type_id character varying(20),
    amount numeric(18,6),
    rate_code character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_price_action OWNER TO ofbiz;

--
-- Name: product_price_action pk_product_price_action; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_action
    ADD CONSTRAINT pk_product_price_action PRIMARY KEY (product_price_rule_id, product_price_action_seq_id);


--
-- Name: prdt_prc_acn_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prc_acn_txcrs ON product_price_action USING btree (created_tx_stamp);


--
-- Name: prdt_prc_acn_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prc_acn_txstp ON product_price_action USING btree (last_updated_tx_stamp);


--
-- Name: prod_pcact_rl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pcact_rl ON product_price_action USING btree (product_price_rule_id);


--
-- Name: prod_pcact_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pcact_type ON product_price_action USING btree (product_price_action_type_id);


--
-- Name: product_price_action prod_pcact_rl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_action
    ADD CONSTRAINT prod_pcact_rl FOREIGN KEY (product_price_rule_id) REFERENCES product_price_rule(product_price_rule_id);


--
-- Name: product_price_action prod_pcact_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_price_action
    ADD CONSTRAINT prod_pcact_type FOREIGN KEY (product_price_action_type_id) REFERENCES product_price_action_type(product_price_action_type_id);


--
-- PostgreSQL database dump complete
--

