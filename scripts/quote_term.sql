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
-- Name: quote_term; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE quote_term (
    term_type_id character varying(20) NOT NULL,
    quote_id character varying(20) NOT NULL,
    quote_item_seq_id character varying(20) NOT NULL,
    term_value numeric(20,0),
    uom_id character varying(20),
    term_days numeric(20,0),
    text_value character varying(255),
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.quote_term OWNER TO ofbiz;

--
-- Name: quote_term pk_quote_term; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_term
    ADD CONSTRAINT pk_quote_term PRIMARY KEY (term_type_id, quote_id, quote_item_seq_id);


--
-- Name: quote_term_qte; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_term_qte ON quote_term USING btree (quote_id);


--
-- Name: quote_term_ttype; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_term_ttype ON quote_term USING btree (term_type_id);


--
-- Name: quote_term_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_term_txcrts ON quote_term USING btree (created_tx_stamp);


--
-- Name: quote_term_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX quote_term_txstmp ON quote_term USING btree (last_updated_tx_stamp);


--
-- Name: quote_term quote_term_qte; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_term
    ADD CONSTRAINT quote_term_qte FOREIGN KEY (quote_id) REFERENCES quote(quote_id);


--
-- Name: quote_term quote_term_ttype; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY quote_term
    ADD CONSTRAINT quote_term_ttype FOREIGN KEY (term_type_id) REFERENCES term_type(term_type_id);


--
-- PostgreSQL database dump complete
--

