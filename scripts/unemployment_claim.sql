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
-- Name: unemployment_claim; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE unemployment_claim (
    unemployment_claim_id character varying(20) NOT NULL,
    unemployment_claim_date timestamp with time zone,
    description character varying(255),
    status_id character varying(20),
    party_id_from character varying(20),
    party_id_to character varying(20),
    role_type_id_from character varying(20),
    role_type_id_to character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.unemployment_claim OWNER TO ofbiz;

--
-- Name: unemployment_claim pk_unemployment_claim; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY unemployment_claim
    ADD CONSTRAINT pk_unemployment_claim PRIMARY KEY (unemployment_claim_id);


--
-- Name: unmplmt_clm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX unmplmt_clm_txcrts ON unemployment_claim USING btree (created_tx_stamp);


--
-- Name: unmplmt_clm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX unmplmt_clm_txstmp ON unemployment_claim USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

