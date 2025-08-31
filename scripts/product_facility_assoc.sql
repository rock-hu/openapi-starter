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
-- Name: product_facility_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_facility_assoc (
    product_id character varying(20) NOT NULL,
    facility_id character varying(20) NOT NULL,
    facility_id_to character varying(20) NOT NULL,
    facility_assoc_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    transit_time numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_facility_assoc OWNER TO ofbiz;

--
-- Name: product_facility_assoc pk_product_facility_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility_assoc
    ADD CONSTRAINT pk_product_facility_assoc PRIMARY KEY (product_id, facility_id, facility_id_to, facility_assoc_type_id, from_date);


--
-- Name: prdt_fct_asc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_fct_asc_txcrs ON product_facility_assoc USING btree (created_tx_stamp);


--
-- Name: prdt_fct_asc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdt_fct_asc_txstp ON product_facility_assoc USING btree (last_updated_tx_stamp);


--
-- Name: prfacassoc_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prfacassoc_fac ON product_facility_assoc USING btree (facility_id);


--
-- Name: prfacassoc_facto; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prfacassoc_facto ON product_facility_assoc USING btree (facility_id_to);


--
-- Name: prfacassoc_pro; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prfacassoc_pro ON product_facility_assoc USING btree (product_id);


--
-- Name: prfacassoc_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prfacassoc_type ON product_facility_assoc USING btree (facility_assoc_type_id);


--
-- Name: product_facility_assoc prfacassoc_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility_assoc
    ADD CONSTRAINT prfacassoc_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: product_facility_assoc prfacassoc_facto; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility_assoc
    ADD CONSTRAINT prfacassoc_facto FOREIGN KEY (facility_id_to) REFERENCES facility(facility_id);


--
-- Name: product_facility_assoc prfacassoc_pro; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility_assoc
    ADD CONSTRAINT prfacassoc_pro FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_facility_assoc prfacassoc_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility_assoc
    ADD CONSTRAINT prfacassoc_type FOREIGN KEY (facility_assoc_type_id) REFERENCES facility_assoc_type(facility_assoc_type_id);


--
-- PostgreSQL database dump complete
--

