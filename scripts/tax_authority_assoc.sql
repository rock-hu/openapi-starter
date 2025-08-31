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
-- Name: tax_authority_assoc; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tax_authority_assoc (
    tax_auth_geo_id character varying(20) NOT NULL,
    tax_auth_party_id character varying(20) NOT NULL,
    to_tax_auth_geo_id character varying(20) NOT NULL,
    to_tax_auth_party_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    tax_authority_assoc_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tax_authority_assoc OWNER TO ofbiz;

--
-- Name: tax_authority_assoc pk_tax_authority_assoc; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_assoc
    ADD CONSTRAINT pk_tax_authority_assoc PRIMARY KEY (tax_auth_geo_id, tax_auth_party_id, to_tax_auth_geo_id, to_tax_auth_party_id, from_date);


--
-- Name: taxauthasc_astp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthasc_astp ON tax_authority_assoc USING btree (tax_authority_assoc_type_id);


--
-- Name: taxauthasc_totxa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthasc_totxa ON tax_authority_assoc USING btree (to_tax_auth_geo_id, to_tax_auth_party_id);


--
-- Name: taxauthasc_txa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthasc_txa ON tax_authority_assoc USING btree (tax_auth_geo_id, tax_auth_party_id);


--
-- Name: tx_atht_asc_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_atht_asc_txcrts ON tax_authority_assoc USING btree (created_tx_stamp);


--
-- Name: tx_atht_asc_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_atht_asc_txstmp ON tax_authority_assoc USING btree (last_updated_tx_stamp);


--
-- Name: tax_authority_assoc taxauthasc_astp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_assoc
    ADD CONSTRAINT taxauthasc_astp FOREIGN KEY (tax_authority_assoc_type_id) REFERENCES tax_authority_assoc_type(tax_authority_assoc_type_id);


--
-- Name: tax_authority_assoc taxauthasc_totxa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_assoc
    ADD CONSTRAINT taxauthasc_totxa FOREIGN KEY (to_tax_auth_geo_id, to_tax_auth_party_id) REFERENCES tax_authority(tax_auth_geo_id, tax_auth_party_id);


--
-- Name: tax_authority_assoc taxauthasc_txa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_assoc
    ADD CONSTRAINT taxauthasc_txa FOREIGN KEY (tax_auth_geo_id, tax_auth_party_id) REFERENCES tax_authority(tax_auth_geo_id, tax_auth_party_id);


--
-- PostgreSQL database dump complete
--

