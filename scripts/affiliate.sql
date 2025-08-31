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
-- Name: affiliate; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE affiliate (
    party_id character varying(20) NOT NULL,
    affiliate_name character varying(100),
    affiliate_description character varying(255),
    year_established character varying(10),
    site_type character varying(255),
    site_page_views character varying(255),
    site_visitors character varying(255),
    date_time_created timestamp with time zone,
    date_time_approved timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.affiliate OWNER TO ofbiz;

--
-- Name: affiliate pk_affiliate; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY affiliate
    ADD CONSTRAINT pk_affiliate PRIMARY KEY (party_id);


--
-- Name: affiliate_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX affiliate_party ON affiliate USING btree (party_id);


--
-- Name: affiliate_pgrp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX affiliate_pgrp ON affiliate USING btree (party_id);


--
-- Name: affiliate_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX affiliate_txcrts ON affiliate USING btree (created_tx_stamp);


--
-- Name: affiliate_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX affiliate_txstmp ON affiliate USING btree (last_updated_tx_stamp);


--
-- Name: affiliate affiliate_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY affiliate
    ADD CONSTRAINT affiliate_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: affiliate affiliate_pgrp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY affiliate
    ADD CONSTRAINT affiliate_pgrp FOREIGN KEY (party_id) REFERENCES party_group(party_id);


--
-- PostgreSQL database dump complete
--

