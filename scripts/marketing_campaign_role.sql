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
-- Name: marketing_campaign_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE marketing_campaign_role (
    marketing_campaign_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.marketing_campaign_role OWNER TO ofbiz;

--
-- Name: marketing_campaign_role pk_marketing_campaign_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign_role
    ADD CONSTRAINT pk_marketing_campaign_role PRIMARY KEY (marketing_campaign_id, party_id, role_type_id, from_date);


--
-- Name: mktgcpn_role_mc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mktgcpn_role_mc ON marketing_campaign_role USING btree (marketing_campaign_id);


--
-- Name: mktgcpn_role_pr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mktgcpn_role_pr ON marketing_campaign_role USING btree (party_id, role_type_id);


--
-- Name: mrktg_cmn_rl_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrktg_cmn_rl_txcrs ON marketing_campaign_role USING btree (created_tx_stamp);


--
-- Name: mrktg_cmn_rl_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrktg_cmn_rl_txstp ON marketing_campaign_role USING btree (last_updated_tx_stamp);


--
-- Name: marketing_campaign_role mktgcpn_role_mc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign_role
    ADD CONSTRAINT mktgcpn_role_mc FOREIGN KEY (marketing_campaign_id) REFERENCES marketing_campaign(marketing_campaign_id);


--
-- Name: marketing_campaign_role mktgcpn_role_pr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign_role
    ADD CONSTRAINT mktgcpn_role_pr FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- PostgreSQL database dump complete
--

