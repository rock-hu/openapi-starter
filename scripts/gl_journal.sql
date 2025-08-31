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
-- Name: gl_journal; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE gl_journal (
    gl_journal_id character varying(20) NOT NULL,
    gl_journal_name character varying(100),
    organization_party_id character varying(20),
    is_posted character(1),
    posted_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.gl_journal OWNER TO ofbiz;

--
-- Name: gl_journal pk_gl_journal; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_journal
    ADD CONSTRAINT pk_gl_journal PRIMARY KEY (gl_journal_id);


--
-- Name: gl_journal_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_journal_txcrts ON gl_journal USING btree (created_tx_stamp);


--
-- Name: gl_journal_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gl_journal_txstmp ON gl_journal USING btree (last_updated_tx_stamp);


--
-- Name: gljourn_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX gljourn_party ON gl_journal USING btree (organization_party_id);


--
-- Name: gl_journal gljourn_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY gl_journal
    ADD CONSTRAINT gljourn_party FOREIGN KEY (organization_party_id) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

