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
-- Name: tracking_code_visit; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE tracking_code_visit (
    tracking_code_id character varying(20) NOT NULL,
    visit_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    source_enum_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.tracking_code_visit OWNER TO ofbiz;

--
-- Name: tracking_code_visit pk_tracking_code_visit; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_visit
    ADD CONSTRAINT pk_tracking_code_visit PRIMARY KEY (tracking_code_id, visit_id, from_date);


--
-- Name: tkng_codvst_srcem; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_codvst_srcem ON tracking_code_visit USING btree (source_enum_id);


--
-- Name: tkng_codvst_tkcd; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tkng_codvst_tkcd ON tracking_code_visit USING btree (tracking_code_id);


--
-- Name: trckg_cd_vst_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trckg_cd_vst_txcrs ON tracking_code_visit USING btree (created_tx_stamp);


--
-- Name: trckg_cd_vst_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trckg_cd_vst_txstp ON tracking_code_visit USING btree (last_updated_tx_stamp);


--
-- Name: tracking_code_visit tkng_codvst_srcem; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_visit
    ADD CONSTRAINT tkng_codvst_srcem FOREIGN KEY (source_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: tracking_code_visit tkng_codvst_tkcd; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY tracking_code_visit
    ADD CONSTRAINT tkng_codvst_tkcd FOREIGN KEY (tracking_code_id) REFERENCES tracking_code(tracking_code_id);


--
-- PostgreSQL database dump complete
--

