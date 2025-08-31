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
-- Name: product_gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_gl_account (
    product_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    gl_account_type_id character varying(20) NOT NULL,
    gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_gl_account OWNER TO ofbiz;

--
-- Name: product_gl_account pk_product_gl_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_gl_account
    ADD CONSTRAINT pk_product_gl_account PRIMARY KEY (product_id, organization_party_id, gl_account_type_id);


--
-- Name: prdt_gl_acct_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_gl_acct_txcrs ON product_gl_account USING btree (created_tx_stamp);


--
-- Name: prdt_gl_acct_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_gl_acct_txstp ON product_gl_account USING btree (last_updated_tx_stamp);


--
-- Name: prod_glact_glact; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_glact_glact ON product_gl_account USING btree (gl_account_id);


--
-- Name: prod_glact_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_glact_party ON product_gl_account USING btree (organization_party_id);


--
-- Name: prod_glact_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_glact_prod ON product_gl_account USING btree (product_id);


--
-- Name: prod_glact_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_glact_type ON product_gl_account USING btree (gl_account_type_id);


--
-- Name: product_gl_account prod_glact_glact; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_gl_account
    ADD CONSTRAINT prod_glact_glact FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: product_gl_account prod_glact_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_gl_account
    ADD CONSTRAINT prod_glact_party FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: product_gl_account prod_glact_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_gl_account
    ADD CONSTRAINT prod_glact_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_gl_account prod_glact_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_gl_account
    ADD CONSTRAINT prod_glact_type FOREIGN KEY (gl_account_type_id) REFERENCES gl_account_type(gl_account_type_id);


--
-- PostgreSQL database dump complete
--

