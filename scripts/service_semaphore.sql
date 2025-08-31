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
-- Name: service_semaphore; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE service_semaphore (
    service_name character varying(100) NOT NULL,
    locked_by_instance_id character varying(20),
    lock_thread character varying(100),
    lock_time timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.service_semaphore OWNER TO ofbiz;

--
-- Name: service_semaphore pk_service_semaphore; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY service_semaphore
    ADD CONSTRAINT pk_service_semaphore PRIMARY KEY (service_name);


--
-- Name: srvc_smphr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvc_smphr_txcrts ON service_semaphore USING btree (created_tx_stamp);


--
-- Name: srvc_smphr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX srvc_smphr_txstmp ON service_semaphore USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

