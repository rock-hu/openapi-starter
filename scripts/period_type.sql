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
-- Name: period_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE period_type (
    period_type_id character varying(20) NOT NULL,
    description character varying(255),
    period_length numeric(20,0),
    uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.period_type OWNER TO ofbiz;

--
-- Name: period_type pk_period_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY period_type
    ADD CONSTRAINT pk_period_type PRIMARY KEY (period_type_id);


--
-- Name: per_type_uom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX per_type_uom ON period_type USING btree (uom_id);


--
-- Name: period_type_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX period_type_txcrts ON period_type USING btree (created_tx_stamp);


--
-- Name: period_type_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX period_type_txstmp ON period_type USING btree (last_updated_tx_stamp);


--
-- Name: period_type per_type_uom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY period_type
    ADD CONSTRAINT per_type_uom FOREIGN KEY (uom_id) REFERENCES uom(uom_id);


--
-- PostgreSQL database dump complete
--

