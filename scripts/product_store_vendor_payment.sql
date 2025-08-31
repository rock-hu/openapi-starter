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
-- Name: product_store_vendor_payment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_vendor_payment (
    product_store_id character varying(20) NOT NULL,
    vendor_party_id character varying(20) NOT NULL,
    payment_method_type_id character varying(20) NOT NULL,
    credit_card_enum_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_vendor_payment OWNER TO ofbiz;

--
-- Name: product_store_vendor_payment pk_product_store_vendor_paymen; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_payment
    ADD CONSTRAINT pk_product_store_vendor_paymen PRIMARY KEY (product_store_id, vendor_party_id, payment_method_type_id, credit_card_enum_id);


--
-- Name: prdstrvpm_ccen; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrvpm_ccen ON product_store_vendor_payment USING btree (credit_card_enum_id);


--
-- Name: prdstrvpm_pmmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrvpm_pmmt ON product_store_vendor_payment USING btree (payment_method_type_id);


--
-- Name: prdstrvpm_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrvpm_prds ON product_store_vendor_payment USING btree (product_store_id);


--
-- Name: prdstrvpm_vpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrvpm_vpty ON product_store_vendor_payment USING btree (vendor_party_id);


--
-- Name: prt_str_vnr_pmt_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_vnr_pmt_tp ON product_store_vendor_payment USING btree (last_updated_tx_stamp);


--
-- Name: prt_str_vnr_pmt_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_str_vnr_pmt_ts ON product_store_vendor_payment USING btree (created_tx_stamp);


--
-- Name: product_store_vendor_payment prdstrvpm_ccen; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_payment
    ADD CONSTRAINT prdstrvpm_ccen FOREIGN KEY (credit_card_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_store_vendor_payment prdstrvpm_pmmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_payment
    ADD CONSTRAINT prdstrvpm_pmmt FOREIGN KEY (payment_method_type_id) REFERENCES payment_method_type(payment_method_type_id);


--
-- Name: product_store_vendor_payment prdstrvpm_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_payment
    ADD CONSTRAINT prdstrvpm_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- Name: product_store_vendor_payment prdstrvpm_vpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_vendor_payment
    ADD CONSTRAINT prdstrvpm_vpty FOREIGN KEY (vendor_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

