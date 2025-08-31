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
-- Name: order_header_note; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_header_note (
    order_id character varying(20) NOT NULL,
    note_id character varying(20) NOT NULL,
    internal_note character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_header_note OWNER TO ofbiz;

--
-- Name: order_header_note pk_order_header_note; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header_note
    ADD CONSTRAINT pk_order_header_note PRIMARY KEY (order_id, note_id);


--
-- Name: order_hdrnt_hdr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdrnt_hdr ON order_header_note USING btree (order_id);


--
-- Name: order_hdrnt_note; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX order_hdrnt_note ON order_header_note USING btree (note_id);


--
-- Name: ordr_hdr_nt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_hdr_nt_txcrts ON order_header_note USING btree (created_tx_stamp);


--
-- Name: ordr_hdr_nt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_hdr_nt_txstmp ON order_header_note USING btree (last_updated_tx_stamp);


--
-- Name: order_header_note order_hdrnt_hdr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header_note
    ADD CONSTRAINT order_hdrnt_hdr FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_header_note order_hdrnt_note; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_header_note
    ADD CONSTRAINT order_hdrnt_note FOREIGN KEY (note_id) REFERENCES note_data(note_id);


--
-- PostgreSQL database dump complete
--

