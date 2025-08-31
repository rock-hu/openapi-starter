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
-- Name: tax_authority; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tax_authority (
    tax_auth_geo_id character varying(20) NOT NULL,
    tax_auth_party_id character varying(20) NOT NULL,
    require_tax_id_for_exemption character(1),
    tax_id_format_pattern character varying(255),
    include_tax_in_price character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tax_authority OWNER TO ofbiz;

--
-- Name: tax_authority pk_tax_authority; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority
    ADD CONSTRAINT pk_tax_authority PRIMARY KEY (tax_auth_geo_id, tax_auth_party_id);


--
-- Name: taxauth_tageo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauth_tageo ON tax_authority USING btree (tax_auth_geo_id);


--
-- Name: taxauth_taparty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauth_taparty ON tax_authority USING btree (tax_auth_party_id);


--
-- Name: tx_athrt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_athrt_txcrts ON tax_authority USING btree (created_tx_stamp);


--
-- Name: tx_athrt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_athrt_txstmp ON tax_authority USING btree (last_updated_tx_stamp);


--
-- Name: tax_authority taxauth_tageo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority
    ADD CONSTRAINT taxauth_tageo FOREIGN KEY (tax_auth_geo_id) REFERENCES geo(geo_id);


--
-- Name: tax_authority taxauth_taparty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority
    ADD CONSTRAINT taxauth_taparty FOREIGN KEY (tax_auth_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

