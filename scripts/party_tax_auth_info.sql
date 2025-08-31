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
-- Name: party_tax_auth_info; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_tax_auth_info (
    party_id character varying(20) NOT NULL,
    tax_auth_geo_id character varying(20) NOT NULL,
    tax_auth_party_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    party_tax_id character varying(60),
    is_exempt character(1),
    is_nexus character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_tax_auth_info OWNER TO ofbiz;

--
-- Name: party_tax_auth_info pk_party_tax_auth_info; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_tax_auth_info
    ADD CONSTRAINT pk_party_tax_auth_info PRIMARY KEY (party_id, tax_auth_geo_id, tax_auth_party_id, from_date);


--
-- Name: party_txai_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_txai_pty ON party_tax_auth_info USING btree (party_id);


--
-- Name: party_txai_txa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_txai_txa ON party_tax_auth_info USING btree (tax_auth_geo_id, tax_auth_party_id);


--
-- Name: prt_tx_ath_inf_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_tx_ath_inf_txp ON party_tax_auth_info USING btree (last_updated_tx_stamp);


--
-- Name: prt_tx_ath_inf_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_tx_ath_inf_txs ON party_tax_auth_info USING btree (created_tx_stamp);


--
-- Name: party_tax_auth_info party_txai_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_tax_auth_info
    ADD CONSTRAINT party_txai_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_tax_auth_info party_txai_txa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_tax_auth_info
    ADD CONSTRAINT party_txai_txa FOREIGN KEY (tax_auth_geo_id, tax_auth_party_id) REFERENCES tax_authority(tax_auth_geo_id, tax_auth_party_id);


--
-- PostgreSQL database dump complete
--

