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
-- Name: marketing_campaign; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE marketing_campaign (
    marketing_campaign_id character varying(20) NOT NULL,
    parent_campaign_id character varying(20),
    status_id character varying(20),
    campaign_name character varying(100),
    campaign_summary text,
    budgeted_cost numeric(18,2),
    actual_cost numeric(18,2),
    estimated_cost numeric(18,2),
    currency_uom_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    is_active character(1),
    converted_leads character varying(20),
    expected_response_percent double precision,
    expected_revenue numeric(18,2),
    num_sent numeric(20,0),
    start_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.marketing_campaign OWNER TO ofbiz;

--
-- Name: marketing_campaign pk_marketing_campaign; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign
    ADD CONSTRAINT pk_marketing_campaign PRIMARY KEY (marketing_campaign_id);


--
-- Name: mktgcpn_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mktgcpn_cuom ON marketing_campaign USING btree (currency_uom_id);


--
-- Name: mktgcpn_prnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mktgcpn_prnt ON marketing_campaign USING btree (parent_campaign_id);


--
-- Name: mktgcpn_sts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mktgcpn_sts ON marketing_campaign USING btree (status_id);


--
-- Name: mrktng_cmpn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrktng_cmpn_txcrts ON marketing_campaign USING btree (created_tx_stamp);


--
-- Name: mrktng_cmpn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrktng_cmpn_txstmp ON marketing_campaign USING btree (last_updated_tx_stamp);


--
-- Name: marketing_campaign mktgcpn_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign
    ADD CONSTRAINT mktgcpn_cuom FOREIGN KEY (currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: marketing_campaign mktgcpn_prnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign
    ADD CONSTRAINT mktgcpn_prnt FOREIGN KEY (parent_campaign_id) REFERENCES marketing_campaign(marketing_campaign_id);


--
-- Name: marketing_campaign mktgcpn_sts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign
    ADD CONSTRAINT mktgcpn_sts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

