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
-- Name: training_request; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE training_request (
    training_request_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.training_request OWNER TO ofbiz;

--
-- Name: training_request pk_training_request; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY training_request
    ADD CONSTRAINT pk_training_request PRIMARY KEY (training_request_id);


--
-- Name: trnng_rqst_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trnng_rqst_txcrts ON training_request USING btree (created_tx_stamp);


--
-- Name: trnng_rqst_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX trnng_rqst_txstmp ON training_request USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

