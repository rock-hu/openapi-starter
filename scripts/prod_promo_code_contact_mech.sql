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
-- Name: prod_promo_code_contact_mech; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE prod_promo_code_contact_mech (
    product_promo_code_id character varying(20) NOT NULL,
    contact_mech_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.prod_promo_code_contact_mech OWNER TO ofbiz;

--
-- Name: prod_promo_code_contact_mech pk_prod_promo_code_contact_mec; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_promo_code_contact_mech
    ADD CONSTRAINT pk_prod_promo_code_contact_mec PRIMARY KEY (product_promo_code_id, contact_mech_id);


--
-- Name: prd_cd_cnt_mch_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_cd_cnt_mch_tp ON prod_promo_code_contact_mech USING btree (last_updated_tx_stamp);


--
-- Name: prd_cd_cnt_mch_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_cd_cnt_mch_ts ON prod_promo_code_contact_mech USING btree (created_tx_stamp);


--
-- Name: prod_prcde_cm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcde_cm ON prod_promo_code_contact_mech USING btree (contact_mech_id);


--
-- Name: prod_prcde_pcd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_prcde_pcd ON prod_promo_code_contact_mech USING btree (product_promo_code_id);


--
-- Name: prod_promo_code_contact_mech prod_prcde_cm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_promo_code_contact_mech
    ADD CONSTRAINT prod_prcde_cm FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: prod_promo_code_contact_mech prod_prcde_pcd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_promo_code_contact_mech
    ADD CONSTRAINT prod_prcde_pcd FOREIGN KEY (product_promo_code_id) REFERENCES product_promo_code(product_promo_code_id);


--
-- PostgreSQL database dump complete
--

