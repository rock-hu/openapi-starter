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
-- Name: party_classification_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_classification_type (
    party_classification_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_classification_type OWNER TO ofbiz;

--
-- Name: party_classification_type pk_party_classification_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_classification_type
    ADD CONSTRAINT pk_party_classification_type PRIMARY KEY (party_classification_type_id);


--
-- Name: party_class_typpar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_class_typpar ON party_classification_type USING btree (parent_type_id);


--
-- Name: prt_clssfn_tp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_clssfn_tp_txcs ON party_classification_type USING btree (created_tx_stamp);


--
-- Name: prt_clssfn_tp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_clssfn_tp_txsp ON party_classification_type USING btree (last_updated_tx_stamp);


--
-- Name: party_classification_type party_class_typpar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_classification_type
    ADD CONSTRAINT party_class_typpar FOREIGN KEY (parent_type_id) REFERENCES party_classification_type(party_classification_type_id);


--
-- PostgreSQL database dump complete
--

