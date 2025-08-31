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
-- Name: return_adjustment_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE return_adjustment_type (
    return_adjustment_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    has_table character(1),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.return_adjustment_type OWNER TO ofbiz;

--
-- Name: return_adjustment_type pk_return_adjustment_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_adjustment_type
    ADD CONSTRAINT pk_return_adjustment_type PRIMARY KEY (return_adjustment_type_id);


--
-- Name: return_adj_typpar; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX return_adj_typpar ON return_adjustment_type USING btree (parent_type_id);


--
-- Name: rtn_adjstt_tp_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_adjstt_tp_txcs ON return_adjustment_type USING btree (created_tx_stamp);


--
-- Name: rtn_adjstt_tp_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtn_adjstt_tp_txsp ON return_adjustment_type USING btree (last_updated_tx_stamp);


--
-- Name: return_adjustment_type return_adj_typpar; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_adjustment_type
    ADD CONSTRAINT return_adj_typpar FOREIGN KEY (parent_type_id) REFERENCES return_adjustment_type(return_adjustment_type_id);


--
-- PostgreSQL database dump complete
--

