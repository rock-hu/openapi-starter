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
-- Name: party_resume; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_resume (
    resume_id character varying(20) NOT NULL,
    party_id character varying(20),
    content_id character varying(20),
    resume_date timestamp with time zone,
    resume_text character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_resume OWNER TO ofbiz;

--
-- Name: party_resume pk_party_resume; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_resume
    ADD CONSTRAINT pk_party_resume PRIMARY KEY (resume_id);


--
-- Name: party_rsme_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_rsme_prty ON party_resume USING btree (party_id);


--
-- Name: prt_rsm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_rsm_txcrts ON party_resume USING btree (created_tx_stamp);


--
-- Name: prt_rsm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prt_rsm_txstmp ON party_resume USING btree (last_updated_tx_stamp);


--
-- Name: party_resume party_rsme_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_resume
    ADD CONSTRAINT party_rsme_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

