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
-- Name: deliverable_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE deliverable_type (
    deliverable_type_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.deliverable_type OWNER TO ofbiz;

--
-- Name: deliverable_type pk_deliverable_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY deliverable_type
    ADD CONSTRAINT pk_deliverable_type PRIMARY KEY (deliverable_type_id);


--
-- Name: dlvrbl_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dlvrbl_tp_txcrts ON deliverable_type USING btree (created_tx_stamp);


--
-- Name: dlvrbl_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dlvrbl_tp_txstmp ON deliverable_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

