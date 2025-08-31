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
-- Name: quantity_break; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quantity_break (
    quantity_break_id character varying(20) NOT NULL,
    quantity_break_type_id character varying(20),
    from_quantity numeric(18,6),
    thru_quantity numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quantity_break OWNER TO ofbiz;

--
-- Name: quantity_break pk_quantity_break; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quantity_break
    ADD CONSTRAINT pk_quantity_break PRIMARY KEY (quantity_break_id);


--
-- Name: qntt_brk_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qntt_brk_txcrts ON quantity_break USING btree (created_tx_stamp);


--
-- Name: qntt_brk_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qntt_brk_txstmp ON quantity_break USING btree (last_updated_tx_stamp);


--
-- Name: quant_brk_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quant_brk_type ON quantity_break USING btree (quantity_break_type_id);


--
-- Name: quantity_break quant_brk_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quantity_break
    ADD CONSTRAINT quant_brk_type FOREIGN KEY (quantity_break_type_id) REFERENCES quantity_break_type(quantity_break_type_id);


--
-- PostgreSQL database dump complete
--

