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
-- Name: agreement_product_appl; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_product_appl (
    agreement_id character varying(20) NOT NULL,
    agreement_item_seq_id character varying(20) NOT NULL,
    product_id character varying(20) NOT NULL,
    price numeric(18,3),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_product_appl OWNER TO ofbiz;

--
-- Name: agreement_product_appl pk_agreement_product_appl; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_product_appl
    ADD CONSTRAINT pk_agreement_product_appl PRIMARY KEY (agreement_id, agreement_item_seq_id, product_id);


--
-- Name: agrmnt_prda_aitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_prda_aitm ON agreement_product_appl USING btree (agreement_id, agreement_item_seq_id);


--
-- Name: agrmnt_prda_prd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_prda_prd ON agreement_product_appl USING btree (product_id);


--
-- Name: agrt_prt_apl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_prt_apl_txcrs ON agreement_product_appl USING btree (created_tx_stamp);


--
-- Name: agrt_prt_apl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrt_prt_apl_txstp ON agreement_product_appl USING btree (last_updated_tx_stamp);


--
-- Name: agreement_product_appl agrmnt_prda_aitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_product_appl
    ADD CONSTRAINT agrmnt_prda_aitm FOREIGN KEY (agreement_id, agreement_item_seq_id) REFERENCES agreement_item(agreement_id, agreement_item_seq_id);


--
-- Name: agreement_product_appl agrmnt_prda_prd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_product_appl
    ADD CONSTRAINT agrmnt_prda_prd FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

