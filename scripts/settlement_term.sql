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
-- Name: settlement_term; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE settlement_term (
    settlement_term_id character varying(20) NOT NULL,
    term_name character varying(100),
    term_value numeric(20,0),
    uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.settlement_term OWNER TO ofbiz;

--
-- Name: settlement_term pk_settlement_term; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY settlement_term
    ADD CONSTRAINT pk_settlement_term PRIMARY KEY (settlement_term_id);


--
-- Name: sttlmnt_trm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sttlmnt_trm_txcrts ON settlement_term USING btree (created_tx_stamp);


--
-- Name: sttlmnt_trm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sttlmnt_trm_txstmp ON settlement_term USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

