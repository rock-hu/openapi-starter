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
-- Name: order_requirement_commitment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_requirement_commitment (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    requirement_id character varying(20) NOT NULL,
    quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_requirement_commitment OWNER TO ofbiz;

--
-- Name: order_requirement_commitment pk_order_requirement_commitmen; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_requirement_commitment
    ADD CONSTRAINT pk_order_requirement_commitmen PRIMARY KEY (order_id, order_item_seq_id, requirement_id);


--
-- Name: ordreq_cmt_oitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordreq_cmt_oitm ON order_requirement_commitment USING btree (order_id, order_item_seq_id);


--
-- Name: ordreq_cmt_ord; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordreq_cmt_ord ON order_requirement_commitment USING btree (order_id);


--
-- Name: ordreq_cmt_req; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordreq_cmt_req ON order_requirement_commitment USING btree (requirement_id);


--
-- Name: orr_rqrt_cmmt_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_rqrt_cmmt_txcs ON order_requirement_commitment USING btree (created_tx_stamp);


--
-- Name: orr_rqrt_cmmt_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX orr_rqrt_cmmt_txsp ON order_requirement_commitment USING btree (last_updated_tx_stamp);


--
-- Name: order_requirement_commitment ordreq_cmt_oitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_requirement_commitment
    ADD CONSTRAINT ordreq_cmt_oitm FOREIGN KEY (order_id, order_item_seq_id) REFERENCES order_item(order_id, order_item_seq_id);


--
-- Name: order_requirement_commitment ordreq_cmt_ord; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_requirement_commitment
    ADD CONSTRAINT ordreq_cmt_ord FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_requirement_commitment ordreq_cmt_req; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_requirement_commitment
    ADD CONSTRAINT ordreq_cmt_req FOREIGN KEY (requirement_id) REFERENCES requirement(requirement_id);


--
-- PostgreSQL database dump complete
--

