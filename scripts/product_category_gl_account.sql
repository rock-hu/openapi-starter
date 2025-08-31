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
-- Name: product_category_gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_category_gl_account (
    product_category_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    gl_account_type_id character varying(20) NOT NULL,
    gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_category_gl_account OWNER TO ofbiz;

--
-- Name: product_category_gl_account pk_product_category_gl_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_gl_account
    ADD CONSTRAINT pk_product_category_gl_account PRIMARY KEY (product_category_id, organization_party_id, gl_account_type_id);


--
-- Name: prd_ct_glact_glact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ct_glact_glact ON product_category_gl_account USING btree (gl_account_id);


--
-- Name: prd_ct_glact_pcat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ct_glact_pcat ON product_category_gl_account USING btree (product_category_id);


--
-- Name: prd_ct_glact_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ct_glact_prty ON product_category_gl_account USING btree (organization_party_id);


--
-- Name: prd_ct_glact_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ct_glact_type ON product_category_gl_account USING btree (gl_account_type_id);


--
-- Name: prt_ctr_gl_act_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ctr_gl_act_txp ON product_category_gl_account USING btree (last_updated_tx_stamp);


--
-- Name: prt_ctr_gl_act_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_ctr_gl_act_txs ON product_category_gl_account USING btree (created_tx_stamp);


--
-- Name: product_category_gl_account prd_ct_glact_glact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_gl_account
    ADD CONSTRAINT prd_ct_glact_glact FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: product_category_gl_account prd_ct_glact_pcat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_gl_account
    ADD CONSTRAINT prd_ct_glact_pcat FOREIGN KEY (product_category_id) REFERENCES product_category(product_category_id);


--
-- Name: product_category_gl_account prd_ct_glact_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_gl_account
    ADD CONSTRAINT prd_ct_glact_prty FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: product_category_gl_account prd_ct_glact_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_category_gl_account
    ADD CONSTRAINT prd_ct_glact_type FOREIGN KEY (gl_account_type_id) REFERENCES gl_account_type(gl_account_type_id);


--
-- PostgreSQL database dump complete
--

