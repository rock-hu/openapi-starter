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
-- Name: product_store_facility; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_store_facility (
    product_store_id character varying(20) NOT NULL,
    facility_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_store_facility OWNER TO ofbiz;

--
-- Name: product_store_facility pk_product_store_facility; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_facility
    ADD CONSTRAINT pk_product_store_facility PRIMARY KEY (product_store_id, facility_id, from_date);


--
-- Name: prdstrfac_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrfac_fac ON product_store_facility USING btree (facility_id);


--
-- Name: prdstrfac_prds; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdstrfac_prds ON product_store_facility USING btree (product_store_id);


--
-- Name: prdt_str_fct_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_str_fct_txcrs ON product_store_facility USING btree (created_tx_stamp);


--
-- Name: prdt_str_fct_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_str_fct_txstp ON product_store_facility USING btree (last_updated_tx_stamp);


--
-- Name: product_store_facility prdstrfac_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_facility
    ADD CONSTRAINT prdstrfac_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: product_store_facility prdstrfac_prds; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_store_facility
    ADD CONSTRAINT prdstrfac_prds FOREIGN KEY (product_store_id) REFERENCES product_store(product_store_id);


--
-- PostgreSQL database dump complete
--

