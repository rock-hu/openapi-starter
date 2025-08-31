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
-- Name: party_content_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_content_type (
    party_content_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_content_type OWNER TO ofbiz;

--
-- Name: party_content_type pk_party_content_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_content_type
    ADD CONSTRAINT pk_party_content_type PRIMARY KEY (party_content_type_id);


--
-- Name: partycnt_tp_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX partycnt_tp_par ON party_content_type USING btree (parent_type_id);


--
-- Name: prt_cntt_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cntt_tp_txcrts ON party_content_type USING btree (created_tx_stamp);


--
-- Name: prt_cntt_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_cntt_tp_txstmp ON party_content_type USING btree (last_updated_tx_stamp);


--
-- Name: party_content_type partycnt_tp_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_content_type
    ADD CONSTRAINT partycnt_tp_par FOREIGN KEY (parent_type_id) REFERENCES party_content_type(party_content_type_id);


--
-- PostgreSQL database dump complete
--

