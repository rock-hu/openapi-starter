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
-- Name: pay_grade; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE pay_grade (
    pay_grade_id character varying(20) NOT NULL,
    pay_grade_name character varying(100),
    comments character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.pay_grade OWNER TO ofbiz;

--
-- Name: pay_grade pk_pay_grade; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY pay_grade
    ADD CONSTRAINT pk_pay_grade PRIMARY KEY (pay_grade_id);


--
-- Name: pay_grade_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pay_grade_txcrts ON pay_grade USING btree (created_tx_stamp);


--
-- Name: pay_grade_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pay_grade_txstmp ON pay_grade USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

