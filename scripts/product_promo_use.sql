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
-- Name: product_promo_use; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_use (
    order_id character varying(20) NOT NULL,
    promo_sequence_id character varying(20) NOT NULL,
    product_promo_id character varying(20),
    product_promo_code_id character varying(20),
    party_id character varying(20),
    total_discount_amount numeric(18,2),
    quantity_left_in_actions numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_use OWNER TO ofbiz;

--
-- Name: product_promo_use pk_product_promo_use; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_use
    ADD CONSTRAINT pk_product_promo_use PRIMARY KEY (order_id, promo_sequence_id);


--
-- Name: prdt_prm_us_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_us_txcrts ON product_promo_use USING btree (created_tx_stamp);


--
-- Name: prdt_prm_us_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_prm_us_txstmp ON product_promo_use USING btree (last_updated_tx_stamp);


--
-- Name: prod_pruse_code; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pruse_code ON product_promo_use USING btree (product_promo_code_id);


--
-- Name: prod_pruse_ordr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pruse_ordr ON product_promo_use USING btree (order_id);


--
-- Name: prod_pruse_promo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pruse_promo ON product_promo_use USING btree (product_promo_id);


--
-- Name: prod_pruse_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pruse_pty ON product_promo_use USING btree (party_id);


--
-- Name: prodpruse_pcdpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodpruse_pcdpty ON product_promo_use USING btree (product_promo_code_id, party_id);


--
-- Name: prodpruse_prmpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodpruse_prmpty ON product_promo_use USING btree (product_promo_id, party_id);


--
-- Name: product_promo_use prod_pruse_code; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_use
    ADD CONSTRAINT prod_pruse_code FOREIGN KEY (product_promo_code_id) REFERENCES product_promo_code(product_promo_code_id);


--
-- Name: product_promo_use prod_pruse_ordr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_use
    ADD CONSTRAINT prod_pruse_ordr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: product_promo_use prod_pruse_promo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_use
    ADD CONSTRAINT prod_pruse_promo FOREIGN KEY (product_promo_id) REFERENCES product_promo(product_promo_id);


--
-- Name: product_promo_use prod_pruse_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_use
    ADD CONSTRAINT prod_pruse_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

