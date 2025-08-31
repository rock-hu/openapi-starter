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
-- Name: quote_coefficient; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote_coefficient (
    quote_id character varying(20) NOT NULL,
    coeff_name character varying(60) NOT NULL,
    coeff_value numeric(18,6),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote_coefficient OWNER TO ofbiz;

--
-- Name: quote_coefficient pk_quote_coefficient; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_coefficient
    ADD CONSTRAINT pk_quote_coefficient PRIMARY KEY (quote_id, coeff_name);


--
-- Name: qt_cffcnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_cffcnt_txcrts ON quote_coefficient USING btree (created_tx_stamp);


--
-- Name: qt_cffcnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX qt_cffcnt_txstmp ON quote_coefficient USING btree (last_updated_tx_stamp);


--
-- Name: quote_coeff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_coeff ON quote_coefficient USING btree (quote_id);


--
-- Name: quote_coefficient quote_coeff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_coefficient
    ADD CONSTRAINT quote_coeff FOREIGN KEY (quote_id) REFERENCES quote(quote_id);


--
-- PostgreSQL database dump complete
--

