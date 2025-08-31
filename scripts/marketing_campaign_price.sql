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
-- Name: marketing_campaign_price; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE marketing_campaign_price (
    marketing_campaign_id character varying(20) NOT NULL,
    product_price_rule_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.marketing_campaign_price OWNER TO ofbiz;

--
-- Name: marketing_campaign_price pk_marketing_campaign_price; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign_price
    ADD CONSTRAINT pk_marketing_campaign_price PRIMARY KEY (marketing_campaign_id, product_price_rule_id, from_date);


--
-- Name: mktgcpn_price_mc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mktgcpn_price_mc ON marketing_campaign_price USING btree (marketing_campaign_id);


--
-- Name: mktgcpn_price_pp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mktgcpn_price_pp ON marketing_campaign_price USING btree (product_price_rule_id);


--
-- Name: mrkg_cmn_prc_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrkg_cmn_prc_txcrs ON marketing_campaign_price USING btree (created_tx_stamp);


--
-- Name: mrkg_cmn_prc_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX mrkg_cmn_prc_txstp ON marketing_campaign_price USING btree (last_updated_tx_stamp);


--
-- Name: marketing_campaign_price mktgcpn_price_mc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign_price
    ADD CONSTRAINT mktgcpn_price_mc FOREIGN KEY (marketing_campaign_id) REFERENCES marketing_campaign(marketing_campaign_id);


--
-- Name: marketing_campaign_price mktgcpn_price_pp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY marketing_campaign_price
    ADD CONSTRAINT mktgcpn_price_pp FOREIGN KEY (product_price_rule_id) REFERENCES product_price_rule(product_price_rule_id);


--
-- PostgreSQL database dump complete
--

