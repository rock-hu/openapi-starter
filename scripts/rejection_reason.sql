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
-- Name: rejection_reason; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE rejection_reason (
    rejection_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.rejection_reason OWNER TO ofbiz;

--
-- Name: rejection_reason pk_rejection_reason; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY rejection_reason
    ADD CONSTRAINT pk_rejection_reason PRIMARY KEY (rejection_id);


--
-- Name: rjctn_rsn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rjctn_rsn_txcrts ON rejection_reason USING btree (created_tx_stamp);


--
-- Name: rjctn_rsn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rjctn_rsn_txstmp ON rejection_reason USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

