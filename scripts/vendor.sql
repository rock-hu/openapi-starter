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
-- Name: vendor; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE vendor (
    party_id character varying(20) NOT NULL,
    manifest_company_name character varying(100),
    manifest_company_title character varying(100),
    manifest_logo_url character varying(2000),
    manifest_policies text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.vendor OWNER TO ofbiz;

--
-- Name: vendor pk_vendor; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY vendor
    ADD CONSTRAINT pk_vendor PRIMARY KEY (party_id);


--
-- Name: vendor_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vendor_party ON vendor USING btree (party_id);


--
-- Name: vendor_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vendor_txcrts ON vendor USING btree (created_tx_stamp);


--
-- Name: vendor_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX vendor_txstmp ON vendor USING btree (last_updated_tx_stamp);


--
-- Name: vendor vendor_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY vendor
    ADD CONSTRAINT vendor_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

