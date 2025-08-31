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
-- Name: enumeration; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE enumeration (
    enum_id character varying(20) NOT NULL,
    enum_type_id character varying(20),
    enum_code character varying(60),
    sequence_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.enumeration OWNER TO ofbiz;

--
-- Name: enumeration pk_enumeration; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY enumeration
    ADD CONSTRAINT pk_enumeration PRIMARY KEY (enum_id);


--
-- Name: enum_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX enum_to_type ON enumeration USING btree (enum_type_id);


--
-- Name: enumeration_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX enumeration_txcrts ON enumeration USING btree (created_tx_stamp);


--
-- Name: enumeration_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX enumeration_txstmp ON enumeration USING btree (last_updated_tx_stamp);


--
-- Name: enumeration enum_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY enumeration
    ADD CONSTRAINT enum_to_type FOREIGN KEY (enum_type_id) REFERENCES enumeration_type(enum_type_id);


--
-- PostgreSQL database dump complete
--

