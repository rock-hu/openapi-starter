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
-- Name: return_header_type; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE return_header_type (
    return_header_type_id character varying(20) NOT NULL,
    parent_type_id character varying(20),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.return_header_type OWNER TO ofbiz;

--
-- Name: return_header_type pk_return_header_type; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header_type
    ADD CONSTRAINT pk_return_header_type PRIMARY KEY (return_header_type_id);


--
-- Name: rthead_type_parent; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rthead_type_parent ON return_header_type USING btree (parent_type_id);


--
-- Name: rtrn_hdr_tp_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtrn_hdr_tp_txcrts ON return_header_type USING btree (created_tx_stamp);


--
-- Name: rtrn_hdr_tp_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX rtrn_hdr_tp_txstmp ON return_header_type USING btree (last_updated_tx_stamp);


--
-- Name: return_header_type rthead_type_parent; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY return_header_type
    ADD CONSTRAINT rthead_type_parent FOREIGN KEY (parent_type_id) REFERENCES return_header_type(return_header_type_id);


--
-- PostgreSQL database dump complete
--

