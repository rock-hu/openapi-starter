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
-- Name: product_calculated_info; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_calculated_info (
    product_id character varying(20) NOT NULL,
    total_quantity_ordered numeric(18,6),
    total_times_viewed numeric(20,0),
    average_customer_rating numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_calculated_info OWNER TO ofbiz;

--
-- Name: product_calculated_info pk_product_calculated_info; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_calculated_info
    ADD CONSTRAINT pk_product_calculated_info PRIMARY KEY (product_id);


--
-- Name: prodci_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prodci_prod ON product_calculated_info USING btree (product_id);


--
-- Name: prt_clcd_inf_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_clcd_inf_txcrs ON product_calculated_info USING btree (created_tx_stamp);


--
-- Name: prt_clcd_inf_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_clcd_inf_txstp ON product_calculated_info USING btree (last_updated_tx_stamp);


--
-- Name: product_calculated_info prodci_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_calculated_info
    ADD CONSTRAINT prodci_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

