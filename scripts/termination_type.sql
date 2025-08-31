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
-- Name: termination_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE termination_type (
    termination_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.termination_type OWNER TO ofbiz;

--
-- Name: termination_type pk_termination_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY termination_type
    ADD CONSTRAINT pk_termination_type PRIMARY KEY (termination_type_id);


--
-- Name: term_typ_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX term_typ_par ON termination_type USING btree (parent_type_id);


--
-- Name: trmntn_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trmntn_tp_txcrts ON termination_type USING btree (created_tx_stamp);


--
-- Name: trmntn_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trmntn_tp_txstmp ON termination_type USING btree (last_updated_tx_stamp);


--
-- Name: termination_type term_typ_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY termination_type
    ADD CONSTRAINT term_typ_par FOREIGN KEY (parent_type_id) REFERENCES termination_type(termination_type_id);


--
-- PostgreSQL database dump complete
--

