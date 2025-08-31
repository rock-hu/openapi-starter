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
-- Name: quote_type_attr; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote_type_attr (
    quote_type_id character varying(20) NOT NULL,
    attr_name character varying(60) NOT NULL,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote_type_attr OWNER TO ofbiz;

--
-- Name: quote_type_attr pk_quote_type_attr; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_type_attr
    ADD CONSTRAINT pk_quote_type_attr PRIMARY KEY (quote_type_id, attr_name);


--
-- Name: qt_tp_attr_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_tp_attr_txcrts ON quote_type_attr USING btree (created_tx_stamp);


--
-- Name: qt_tp_attr_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_tp_attr_txstmp ON quote_type_attr USING btree (last_updated_tx_stamp);


--
-- Name: quote_tpat_qtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_tpat_qtyp ON quote_type_attr USING btree (quote_type_id);


--
-- Name: quote_type_attr quote_tpat_qtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_type_attr
    ADD CONSTRAINT quote_tpat_qtyp FOREIGN KEY (quote_type_id) REFERENCES quote_type(quote_type_id);


--
-- PostgreSQL database dump complete
--

