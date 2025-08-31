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
-- Name: sequence_value_item; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE sequence_value_item (
    seq_name character varying(60) NOT NULL,
    seq_id numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.sequence_value_item OWNER TO ofbiz;

--
-- Name: sequence_value_item pk_sequence_value_item; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY sequence_value_item
    ADD CONSTRAINT pk_sequence_value_item PRIMARY KEY (seq_name);


--
-- Name: sqnc_vl_itm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sqnc_vl_itm_txcrts ON sequence_value_item USING btree (created_tx_stamp);


--
-- Name: sqnc_vl_itm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX sqnc_vl_itm_txstmp ON sequence_value_item USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

