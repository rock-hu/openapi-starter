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
-- Name: cust_request_item_note; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cust_request_item_note (
    cust_request_id character varying(20) NOT NULL,
    cust_request_item_seq_id character varying(20) NOT NULL,
    note_id character varying(20) NOT NULL,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cust_request_item_note OWNER TO ofbiz;

--
-- Name: cust_request_item_note pk_cust_request_item_note; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_item_note
    ADD CONSTRAINT pk_cust_request_item_note PRIMARY KEY (cust_request_id, cust_request_item_seq_id, note_id);


--
-- Name: cst_rqt_itm_nt_txp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_itm_nt_txp ON cust_request_item_note USING btree (last_updated_tx_stamp);


--
-- Name: cst_rqt_itm_nt_txs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_rqt_itm_nt_txs ON cust_request_item_note USING btree (created_tx_stamp);


--
-- Name: cust_req_itnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_itnt ON cust_request_item_note USING btree (cust_request_id, cust_request_item_seq_id);


--
-- Name: cust_req_note; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cust_req_note ON cust_request_item_note USING btree (note_id);


--
-- Name: cust_request_item_note cust_req_itnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_item_note
    ADD CONSTRAINT cust_req_itnt FOREIGN KEY (cust_request_id, cust_request_item_seq_id) REFERENCES cust_request_item(cust_request_id, cust_request_item_seq_id);


--
-- Name: cust_request_item_note cust_req_note; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cust_request_item_note
    ADD CONSTRAINT cust_req_note FOREIGN KEY (note_id) REFERENCES note_data(note_id);


--
-- PostgreSQL database dump complete
--

