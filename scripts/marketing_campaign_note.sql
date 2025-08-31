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
-- Name: marketing_campaign_note; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE marketing_campaign_note (
    marketing_campaign_id character varying(20) NOT NULL,
    note_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.marketing_campaign_note OWNER TO ofbiz;

--
-- Name: marketing_campaign_note pk_marketing_campaign_note; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign_note
    ADD CONSTRAINT pk_marketing_campaign_note PRIMARY KEY (marketing_campaign_id, note_id);


--
-- Name: mktgcpn_note_cmpn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mktgcpn_note_cmpn ON marketing_campaign_note USING btree (marketing_campaign_id);


--
-- Name: mktgcpn_note_note; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mktgcpn_note_note ON marketing_campaign_note USING btree (note_id);


--
-- Name: mrktg_cmn_nt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrktg_cmn_nt_txcrs ON marketing_campaign_note USING btree (created_tx_stamp);


--
-- Name: mrktg_cmn_nt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrktg_cmn_nt_txstp ON marketing_campaign_note USING btree (last_updated_tx_stamp);


--
-- Name: marketing_campaign_note mktgcpn_note_cmpn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign_note
    ADD CONSTRAINT mktgcpn_note_cmpn FOREIGN KEY (marketing_campaign_id) REFERENCES marketing_campaign(marketing_campaign_id);


--
-- Name: marketing_campaign_note mktgcpn_note_note; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign_note
    ADD CONSTRAINT mktgcpn_note_note FOREIGN KEY (note_id) REFERENCES note_data(note_id);


--
-- PostgreSQL database dump complete
--

