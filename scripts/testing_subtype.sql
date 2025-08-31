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
-- Name: testing_subtype; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE testing_subtype (
    testing_type_id character varying(20) NOT NULL,
    subtype_description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.testing_subtype OWNER TO ofbiz;

--
-- Name: testing_subtype pk_testing_subtype; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY testing_subtype
    ADD CONSTRAINT pk_testing_subtype PRIMARY KEY (testing_type_id);


--
-- Name: tstng_sbtp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstng_sbtp_txcrts ON testing_subtype USING btree (created_tx_stamp);


--
-- Name: tstng_sbtp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tstng_sbtp_txstmp ON testing_subtype USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

