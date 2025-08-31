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
-- Name: product_promo_action; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_action (
    product_promo_id character varying(20) NOT NULL,
    product_promo_rule_id character varying(20) NOT NULL,
    product_promo_action_seq_id character varying(20) NOT NULL,
    product_promo_action_enum_id character varying(20),
    custom_method_id character varying(20),
    order_adjustment_type_id character varying(20),
    service_name character varying(255),
    quantity numeric(18,6),
    amount numeric(18,6),
    product_id character varying(20),
    party_id character varying(20),
    use_cart_quantity character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_action OWNER TO ofbiz;

--
-- Name: product_promo_action pk_product_promo_action; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_action
    ADD CONSTRAINT pk_product_promo_action PRIMARY KEY (product_promo_id, product_promo_rule_id, product_promo_action_seq_id);


--
-- Name: prdt_prm_acn_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_acn_txcrs ON product_promo_action USING btree (created_tx_stamp);


--
-- Name: prdt_prm_acn_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_acn_txstp ON product_promo_action USING btree (last_updated_tx_stamp);


--
-- Name: prod_pract_cmet; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pract_cmet ON product_promo_action USING btree (custom_method_id);


--
-- Name: prod_pract_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pract_enum ON product_promo_action USING btree (product_promo_action_enum_id);


--
-- Name: prod_pract_oatype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pract_oatype ON product_promo_action USING btree (order_adjustment_type_id);


--
-- Name: prod_pract_pr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pract_pr ON product_promo_action USING btree (product_promo_id);


--
-- Name: prod_pract_rl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pract_rl ON product_promo_action USING btree (product_promo_id, product_promo_rule_id);


--
-- Name: product_promo_action prod_pract_cmet; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_action
    ADD CONSTRAINT prod_pract_cmet FOREIGN KEY (custom_method_id) REFERENCES custom_method(custom_method_id);


--
-- Name: product_promo_action prod_pract_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_action
    ADD CONSTRAINT prod_pract_enum FOREIGN KEY (product_promo_action_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_promo_action prod_pract_oatype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_action
    ADD CONSTRAINT prod_pract_oatype FOREIGN KEY (order_adjustment_type_id) REFERENCES order_adjustment_type(order_adjustment_type_id);


--
-- Name: product_promo_action prod_pract_pr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_action
    ADD CONSTRAINT prod_pract_pr FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- Name: product_promo_action prod_pract_rl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_action
    ADD CONSTRAINT prod_pract_rl FOREIGN KEY (product_promo_id, product_promo_rule_id) REFERENCES product_promo_rule(product_promo_id, product_promo_rule_id);


--
-- PostgreSQL database dump complete
--

