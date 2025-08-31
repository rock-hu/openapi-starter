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
-- Name: gl_account_organization; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_account_organization (
    gl_account_id character varying(20) NOT NULL,
    organization_party_id character varying(20) NOT NULL,
    role_type_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_account_organization OWNER TO ofbiz;

--
-- Name: gl_account_organization pk_gl_account_organization; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_organization
    ADD CONSTRAINT pk_gl_account_organization PRIMARY KEY (gl_account_id, organization_party_id);


--
-- Name: gl_act_orgnn_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_orgnn_txcrs ON gl_account_organization USING btree (created_tx_stamp);


--
-- Name: gl_act_orgnn_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_act_orgnn_txstp ON gl_account_organization USING btree (last_updated_tx_stamp);


--
-- Name: glacct_org_gla; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_org_gla ON gl_account_organization USING btree (gl_account_id);


--
-- Name: glacct_org_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX glacct_org_party ON gl_account_organization USING btree (organization_party_id);


--
-- Name: gl_account_organization glacct_org_gla; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_organization
    ADD CONSTRAINT glacct_org_gla FOREIGN KEY (gl_account_id) REFERENCES gl_account(gl_account_id);


--
-- Name: gl_account_organization glacct_org_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_account_organization
    ADD CONSTRAINT glacct_org_party FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

