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
-- Name: comm_content_assoc_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE comm_content_assoc_type (
    comm_content_assoc_type_id character varying(20) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.comm_content_assoc_type OWNER TO ofbiz;

--
-- Name: comm_content_assoc_type pk_comm_content_assoc_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY comm_content_assoc_type
    ADD CONSTRAINT pk_comm_content_assoc_type PRIMARY KEY (comm_content_assoc_type_id);


--
-- Name: cmm_cnt_asc_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmm_cnt_asc_tp_txp ON comm_content_assoc_type USING btree (last_updated_tx_stamp);


--
-- Name: cmm_cnt_asc_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cmm_cnt_asc_tp_txs ON comm_content_assoc_type USING btree (created_tx_stamp);


--
-- PostgreSQL database dump complete
--

