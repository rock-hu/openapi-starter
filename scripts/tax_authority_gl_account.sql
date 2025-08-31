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
-- Name: tax_authority_gl_account; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tax_authority_gl_account (
    tax_auth_geo_id character varying(20) NOT NULL,
    tax_auth_party_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    gl_account_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tax_authority_gl_account OWNER TO ofbiz;

--
-- Name: tax_authority_gl_account pk_tax_authority_gl_account; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_gl_account
    ADD CONSTRAINT pk_tax_authority_gl_account PRIMARY KEY (tax_auth_geo_id, tax_auth_party_id, organization_party_id);


--
-- Name: taxauthgla_gla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthgla_gla ON tax_authority_gl_account USING btree (gl_account_id);


--
-- Name: taxauthgla_opty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthgla_opty ON tax_authority_gl_account USING btree (organization_party_id);


--
-- Name: taxauthgla_txa; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX taxauthgla_txa ON tax_authority_gl_account USING btree (tax_auth_geo_id, tax_auth_party_id);


--
-- Name: tx_att_gl_act_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_att_gl_act_txcs ON tax_authority_gl_account USING btree (created_tx_stamp);


--
-- Name: tx_att_gl_act_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tx_att_gl_act_txsp ON tax_authority_gl_account USING btree (last_updated_tx_stamp);


--
-- Name: tax_authority_gl_account taxauthgla_gla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_gl_account
    ADD CONSTRAINT taxauthgla_gla FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: tax_authority_gl_account taxauthgla_opty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_gl_account
    ADD CONSTRAINT taxauthgla_opty FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- Name: tax_authority_gl_account taxauthgla_txa; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tax_authority_gl_account
    ADD CONSTRAINT taxauthgla_txa FOREIGN KEY (tax_auth_geo_id, tax_auth_party_id) REFERENCES tax_authority(tax_auth_geo_id, tax_auth_party_id);


--
-- PostgreSQL database dump complete
--

