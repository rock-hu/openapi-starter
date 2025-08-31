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
-- Name: benefit_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE benefit_type (
    benefit_type_id character varying(20) NOT NULL,
    benefit_name character varying(100),
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    employer_paid_percentage double precision,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.benefit_type OWNER TO ofbiz;

--
-- Name: benefit_type pk_benefit_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY benefit_type
    ADD CONSTRAINT pk_benefit_type PRIMARY KEY (benefit_type_id);


--
-- Name: ben_type_par; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ben_type_par ON benefit_type USING btree (parent_type_id);


--
-- Name: bnft_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bnft_tp_txcrts ON benefit_type USING btree (created_tx_stamp);


--
-- Name: bnft_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX bnft_tp_txstmp ON benefit_type USING btree (last_updated_tx_stamp);


--
-- Name: benefit_type ben_type_par; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY benefit_type
    ADD CONSTRAINT ben_type_par FOREIGN KEY (parent_type_id) REFERENCES benefit_type(benefit_type_id);


--
-- PostgreSQL database dump complete
--

