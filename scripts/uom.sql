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
-- Name: uom; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE uom (
    uom_id character varying(20) NOT NULL,
    uom_type_id character varying(20),
    abbreviation character varying(60),
    numeric_code numeric(20,0),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.uom OWNER TO ofbiz;

--
-- Name: uom pk_uom; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY uom
    ADD CONSTRAINT pk_uom PRIMARY KEY (uom_id);


--
-- Name: uom_to_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uom_to_type ON uom USING btree (uom_type_id);


--
-- Name: uom_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uom_txcrts ON uom USING btree (created_tx_stamp);


--
-- Name: uom_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX uom_txstmp ON uom USING btree (last_updated_tx_stamp);


--
-- Name: uom uom_to_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY uom
    ADD CONSTRAINT uom_to_type FOREIGN KEY (uom_type_id) REFERENCES uom_type(uom_type_id);


--
-- PostgreSQL database dump complete
--

