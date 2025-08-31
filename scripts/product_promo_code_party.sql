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
-- Name: product_promo_code_party; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_promo_code_party (
    product_promo_code_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_promo_code_party OWNER TO ofbiz;

--
-- Name: product_promo_code_party pk_product_promo_code_party; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_code_party
    ADD CONSTRAINT pk_product_promo_code_party PRIMARY KEY (product_promo_code_id, party_id);


--
-- Name: prod_prcdp_pcd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcdp_pcd ON product_promo_code_party USING btree (product_promo_code_id);


--
-- Name: prod_prcdp_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcdp_prty ON product_promo_code_party USING btree (party_id);


--
-- Name: prt_prm_cd_prt_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_prm_cd_prt_txp ON product_promo_code_party USING btree (last_updated_tx_stamp);


--
-- Name: prt_prm_cd_prt_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_prm_cd_prt_txs ON product_promo_code_party USING btree (created_tx_stamp);


--
-- Name: product_promo_code_party prod_prcdp_pcd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_code_party
    ADD CONSTRAINT prod_prcdp_pcd FOREIGN KEY (product_promo_code_id) REFERENCES product_promo_code(product_promo_code_id);


--
-- Name: product_promo_code_party prod_prcdp_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_promo_code_party
    ADD CONSTRAINT prod_prcdp_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

