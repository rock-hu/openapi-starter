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
-- Name: content_operation; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_operation (
    content_operation_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_operation OWNER TO ofbiz;

--
-- Name: content_operation pk_content_operation; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_operation
    ADD CONSTRAINT pk_content_operation PRIMARY KEY (content_operation_id);


--
-- Name: cntnt_oprtn_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_oprtn_txcrts ON content_operation USING btree (created_tx_stamp);


--
-- Name: cntnt_oprtn_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntnt_oprtn_txstmp ON content_operation USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

