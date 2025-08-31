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
-- Name: party_group; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_group (
    party_id character varying(20) NOT NULL,
    group_name character varying(100),
    group_name_local character varying(100),
    office_site_name character varying(100),
    annual_revenue numeric(18,2),
    num_employees numeric(20,0),
    ticker_symbol character varying(10),
    comments character varying(255),
    logo_image_url character varying(2000),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_group OWNER TO ofbiz;

--
-- Name: party_group pk_party_group; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_group
    ADD CONSTRAINT pk_party_group PRIMARY KEY (party_id);


--
-- Name: group_name_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX group_name_idx ON party_group USING btree (group_name);


--
-- Name: party_group_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_group_txcrts ON party_group USING btree (created_tx_stamp);


--
-- Name: party_group_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_group_txstmp ON party_group USING btree (last_updated_tx_stamp);


--
-- Name: party_grp_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_grp_party ON party_group USING btree (party_id);


--
-- Name: party_group party_grp_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_group
    ADD CONSTRAINT party_grp_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

