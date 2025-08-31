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
-- Name: reorder_guideline; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE reorder_guideline (
    reorder_guideline_id character varying(20) NOT NULL,
    product_id character varying(20),
    party_id character varying(20),
    role_type_id character varying(20),
    facility_id character varying(20),
    geo_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    reorder_quantity numeric(18,6),
    reorder_level numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.reorder_guideline OWNER TO ofbiz;

--
-- Name: reorder_guideline pk_reorder_guideline; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY reorder_guideline
    ADD CONSTRAINT pk_reorder_guideline PRIMARY KEY (reorder_guideline_id);


--
-- Name: reorder_gd_fac; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX reorder_gd_fac ON reorder_guideline USING btree (facility_id);


--
-- Name: reorder_gd_geo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX reorder_gd_geo ON reorder_guideline USING btree (geo_id);


--
-- Name: reorder_gd_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX reorder_gd_party ON reorder_guideline USING btree (party_id);


--
-- Name: reorder_gd_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX reorder_gd_prod ON reorder_guideline USING btree (product_id);


--
-- Name: rrdr_gdln_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rrdr_gdln_txcrts ON reorder_guideline USING btree (created_tx_stamp);


--
-- Name: rrdr_gdln_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rrdr_gdln_txstmp ON reorder_guideline USING btree (last_updated_tx_stamp);


--
-- Name: reorder_guideline reorder_gd_fac; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY reorder_guideline
    ADD CONSTRAINT reorder_gd_fac FOREIGN KEY (facility_id) REFERENCES facility(facility_id);


--
-- Name: reorder_guideline reorder_gd_geo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY reorder_guideline
    ADD CONSTRAINT reorder_gd_geo FOREIGN KEY (geo_id) REFERENCES geo(geo_id);


--
-- Name: reorder_guideline reorder_gd_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY reorder_guideline
    ADD CONSTRAINT reorder_gd_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: reorder_guideline reorder_gd_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY reorder_guideline
    ADD CONSTRAINT reorder_gd_prod FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- PostgreSQL database dump complete
--

