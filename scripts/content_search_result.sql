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
-- Name: content_search_result; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE content_search_result (
    content_search_result_id character varying(20) NOT NULL,
    visit_id character varying(20),
    order_by_name character varying(255),
    is_ascending character(1),
    num_results numeric(20,0),
    seconds_total double precision,
    search_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.content_search_result OWNER TO ofbiz;

--
-- Name: content_search_result pk_content_search_result; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY content_search_result
    ADD CONSTRAINT pk_content_search_result PRIMARY KEY (content_search_result_id);


--
-- Name: cntt_srh_rst_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_srh_rst_txcrs ON content_search_result USING btree (created_tx_stamp);


--
-- Name: cntt_srh_rst_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_srh_rst_txstp ON content_search_result USING btree (last_updated_tx_stamp);


--
-- PostgreSQL database dump complete
--

