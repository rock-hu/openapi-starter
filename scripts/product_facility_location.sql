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
-- Name: product_facility_location; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_facility_location (
    product_id character varying(20) NOT NULL,
    facility_id character varying(20) NOT NULL,
    location_seq_id character varying(20) NOT NULL,
    minimum_stock numeric(18,6),
    move_quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_facility_location OWNER TO ofbiz;

--
-- Name: product_facility_location pk_product_facility_location; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility_location
    ADD CONSTRAINT pk_product_facility_location PRIMARY KEY (product_id, facility_id, location_seq_id);


--
-- Name: prdt_fct_lcn_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_fct_lcn_txcrs ON product_facility_location USING btree (created_tx_stamp);


--
-- Name: prdt_fct_lcn_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_fct_lcn_txstp ON product_facility_location USING btree (last_updated_tx_stamp);


--
-- Name: prod_fcl_fcl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fcl_fcl ON product_facility_location USING btree (facility_id, location_seq_id);


--
-- Name: prod_fcl_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fcl_prod ON product_facility_location USING btree (product_id);


--
-- Name: product_facility_location prod_fcl_fcl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility_location
    ADD CONSTRAINT prod_fcl_fcl FOREIGN KEY (facility_id, location_seq_id) REFERENCES facility_location(facility_id, location_seq_id);


--
-- Name: product_facility_location prod_fcl_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility_location
    ADD CONSTRAINT prod_fcl_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

