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
-- Name: perf_review_item_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE perf_review_item_type (
    perf_review_item_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.perf_review_item_type OWNER TO ofbiz;

--
-- Name: perf_review_item_type pk_perf_review_item_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review_item_type
    ADD CONSTRAINT pk_perf_review_item_type PRIMARY KEY (perf_review_item_type_id);


--
-- Name: perf_rev_itm_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX perf_rev_itm_typ ON perf_review_item_type USING btree (parent_type_id);


--
-- Name: prf_rvw_itm_tp_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prf_rvw_itm_tp_txp ON perf_review_item_type USING btree (last_updated_tx_stamp);


--
-- Name: prf_rvw_itm_tp_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prf_rvw_itm_tp_txs ON perf_review_item_type USING btree (created_tx_stamp);


--
-- Name: perf_review_item_type perf_rev_itm_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY perf_review_item_type
    ADD CONSTRAINT perf_rev_itm_typ FOREIGN KEY (parent_type_id) REFERENCES perf_review_item_type(perf_review_item_type_id);


--
-- PostgreSQL database dump complete
--

