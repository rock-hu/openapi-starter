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
-- Name: product_facility; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE product_facility (
    product_id character varying(20) NOT NULL,
    facility_id character varying(20) NOT NULL,
    minimum_stock numeric(18,6),
    reorder_quantity numeric(18,6),
    days_to_ship numeric(20,0),
    replenish_method_enum_id character varying(20),
    last_inventory_count numeric(18,6),
    requirement_method_enum_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.product_facility OWNER TO ofbiz;

--
-- Name: product_facility pk_product_facility; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility
    ADD CONSTRAINT pk_product_facility PRIMARY KEY (product_id, facility_id);


--
-- Name: prdct_fclt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_fclt_txcrts ON product_facility USING btree (created_tx_stamp);


--
-- Name: prdct_fclt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prdct_fclt_txstmp ON product_facility USING btree (last_updated_tx_stamp);


--
-- Name: prod_fac_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fac_fac ON product_facility USING btree (facility_id);


--
-- Name: prod_fac_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fac_prod ON product_facility USING btree (product_id);


--
-- Name: prod_fac_rep; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fac_rep ON product_facility USING btree (replenish_method_enum_id);


--
-- Name: prod_fac_req; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_fac_req ON product_facility USING btree (requirement_method_enum_id);


--
-- Name: product_facility prod_fac_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility
    ADD CONSTRAINT prod_fac_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: product_facility prod_fac_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility
    ADD CONSTRAINT prod_fac_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: product_facility prod_fac_rep; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility
    ADD CONSTRAINT prod_fac_rep FOREIGN KEY (replenish_method_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: product_facility prod_fac_req; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY product_facility
    ADD CONSTRAINT prod_fac_req FOREIGN KEY (requirement_method_enum_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

