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
-- Name: fixed_asset_registration; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE fixed_asset_registration (
    fixed_asset_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    registration_date timestamp with time zone,
    gov_agency_party_id character varying(20),
    registration_number character varying(255),
    license_number character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.fixed_asset_registration OWNER TO ofbiz;

--
-- Name: fixed_asset_registration pk_fixed_asset_registration; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_registration
    ADD CONSTRAINT pk_fixed_asset_registration PRIMARY KEY (fixed_asset_id, from_date);


--
-- Name: fixdastreg_fxast; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdastreg_fxast ON fixed_asset_registration USING btree (fixed_asset_id);


--
-- Name: fixdastreg_gvapty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fixdastreg_gvapty ON fixed_asset_registration USING btree (gov_agency_party_id);


--
-- Name: fxd_ast_rgstn_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_rgstn_txcs ON fixed_asset_registration USING btree (created_tx_stamp);


--
-- Name: fxd_ast_rgstn_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX fxd_ast_rgstn_txsp ON fixed_asset_registration USING btree (last_updated_tx_stamp);


--
-- Name: fixed_asset_registration fixdastreg_fxast; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_registration
    ADD CONSTRAINT fixdastreg_fxast FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: fixed_asset_registration fixdastreg_gvapty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY fixed_asset_registration
    ADD CONSTRAINT fixdastreg_gvapty FOREIGN KEY (gov_agency_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

