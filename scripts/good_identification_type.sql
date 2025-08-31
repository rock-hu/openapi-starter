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
-- Name: good_identification_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE good_identification_type (
    good_identification_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.good_identification_type OWNER TO ofbiz;

--
-- Name: good_identification_type pk_good_identification_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY good_identification_type
    ADD CONSTRAINT pk_good_identification_type PRIMARY KEY (good_identification_type_id);


--
-- Name: gd_idntfn_tp_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gd_idntfn_tp_txcrs ON good_identification_type USING btree (created_tx_stamp);


--
-- Name: gd_idntfn_tp_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gd_idntfn_tp_txstp ON good_identification_type USING btree (last_updated_tx_stamp);


--
-- Name: good_id_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX good_id_type_par ON good_identification_type USING btree (parent_type_id);


--
-- Name: good_identification_type good_id_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY good_identification_type
    ADD CONSTRAINT good_id_type_par FOREIGN KEY (parent_type_id) REFERENCES good_identification_type(good_identification_type_id);


--
-- PostgreSQL database dump complete
--

