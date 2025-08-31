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
-- Name: prod_catalog_inv_facility; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE prod_catalog_inv_facility (
    prod_catalog_id character varying(20) NOT NULL,
    facility_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.prod_catalog_inv_facility OWNER TO ofbiz;

--
-- Name: prod_catalog_inv_facility pk_prod_catalog_inv_facility; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_inv_facility
    ADD CONSTRAINT pk_prod_catalog_inv_facility PRIMARY KEY (prod_catalog_id, facility_id, from_date);


--
-- Name: prd_ctg_inv_fct_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctg_inv_fct_tp ON prod_catalog_inv_facility USING btree (last_updated_tx_stamp);


--
-- Name: prd_ctg_inv_fct_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_ctg_inv_fct_ts ON prod_catalog_inv_facility USING btree (created_tx_stamp);


--
-- Name: prod_cif_catalog; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cif_catalog ON prod_catalog_inv_facility USING btree (prod_catalog_id);


--
-- Name: prod_cif_facility; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prod_cif_facility ON prod_catalog_inv_facility USING btree (facility_id);


--
-- Name: prod_catalog_inv_facility prod_cif_catalog; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_inv_facility
    ADD CONSTRAINT prod_cif_catalog FOREIGN KEY (prod_catalog_id) REFERENCES prod_catalog(prod_catalog_id);


--
-- Name: prod_catalog_inv_facility prod_cif_facility; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_catalog_inv_facility
    ADD CONSTRAINT prod_cif_facility FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- PostgreSQL database dump complete
--

