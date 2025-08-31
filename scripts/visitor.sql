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
-- Name: visitor; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE visitor (
    visitor_id character varying(20) NOT NULL,
    user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone,
    party_id character varying(20)
);


-- ALTER TABLE public.visitor OWNER TO ofbiz;

--
-- Name: visitor pk_visitor; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY visitor
    ADD CONSTRAINT pk_visitor PRIMARY KEY (visitor_id);


--
-- Name: visitor_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX visitor_txcrts ON visitor USING btree (created_tx_stamp);


--
-- Name: visitor_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX visitor_txstmp ON visitor USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

