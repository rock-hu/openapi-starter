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
-- Name: test_field_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE test_field_type (
    test_field_type_id character varying(20) NOT NULL,
    blob_field bytea,
    byte_array_field bytea,
    object_field bytea,
    date_field date,
    time_field time without time zone,
    date_time_field timestamp with time zone,
    fixed_point_field numeric(18,6),
    floating_point_field double precision,
    numeric_field numeric(20,0),
    clob_field text,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.test_field_type OWNER TO ofbiz;

--
-- Name: test_field_type pk_test_field_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY test_field_type
    ADD CONSTRAINT pk_test_field_type PRIMARY KEY (test_field_type_id);


--
-- Name: tst_fld_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tst_fld_tp_txcrts ON test_field_type USING btree (created_tx_stamp);


--
-- Name: tst_fld_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX tst_fld_tp_txstmp ON test_field_type USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

