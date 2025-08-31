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
-- Name: deduction_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE deduction_type (
    deduction_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.deduction_type OWNER TO ofbiz;

--
-- Name: deduction_type pk_deduction_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY deduction_type
    ADD CONSTRAINT pk_deduction_type PRIMARY KEY (deduction_type_id);


--
-- Name: ddctn_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ddctn_tp_txcrts ON deduction_type USING btree (created_tx_stamp);


--
-- Name: ddctn_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ddctn_tp_txstmp ON deduction_type USING btree (last_updated_tx_stamp);


--
-- Name: deduct_typ_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX deduct_typ_par ON deduction_type USING btree (parent_type_id);


--
-- Name: deduction_type deduct_typ_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY deduction_type
    ADD CONSTRAINT deduct_typ_par FOREIGN KEY (parent_type_id) REFERENCES deduction_type(deduction_type_id);


--
-- PostgreSQL database dump complete
--

