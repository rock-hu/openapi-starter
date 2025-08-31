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
-- Name: product_payment_method_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_payment_method_type (
    product_id character varying(20) NOT NULL,
    payment_method_type_id character varying(20) NOT NULL,
    product_price_purpose_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_payment_method_type OWNER TO ofbiz;

--
-- Name: product_payment_method_type pk_product_payment_method_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_payment_method_type
    ADD CONSTRAINT pk_product_payment_method_type PRIMARY KEY (product_id, payment_method_type_id, product_price_purpose_id, from_date);


--
-- Name: prod_pmt_pmt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pmt_pmt ON product_payment_method_type USING btree (payment_method_type_id);


--
-- Name: prod_pmt_pprp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pmt_pprp ON product_payment_method_type USING btree (product_price_purpose_id);


--
-- Name: prod_pmt_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_pmt_prod ON product_payment_method_type USING btree (product_id);


--
-- Name: prt_pmt_mtd_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_pmt_mtd_tp_txp ON product_payment_method_type USING btree (last_updated_tx_stamp);


--
-- Name: prt_pmt_mtd_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_pmt_mtd_tp_txs ON product_payment_method_type USING btree (created_tx_stamp);


--
-- Name: product_payment_method_type prod_pmt_pmt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_payment_method_type
    ADD CONSTRAINT prod_pmt_pmt FOREIGN KEY (payment_method_type_id) REFERENCES payment_method_type(payment_method_type_id);


--
-- Name: product_payment_method_type prod_pmt_pprp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_payment_method_type
    ADD CONSTRAINT prod_pmt_pprp FOREIGN KEY (product_price_purpose_id) REFERENCES product_price_purpose(product_price_purpose_id);


--
-- Name: product_payment_method_type prod_pmt_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_payment_method_type
    ADD CONSTRAINT prod_pmt_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

