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
-- Name: invoice_term; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_term (
    invoice_term_id character varying(20) NOT NULL,
    term_type_id character varying(20),
    invoice_id character varying(20),
    invoice_item_seq_id character varying(20),
    term_value numeric(18,2),
    term_days numeric(20,0),
    text_value character varying(255),
    description character varying(255),
    uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_term OWNER TO ofbiz;

--
-- Name: invoice_term pk_invoice_term; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_term
    ADD CONSTRAINT pk_invoice_term PRIMARY KEY (invoice_term_id);


--
-- Name: invc_trm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_trm_txcrts ON invoice_term USING btree (created_tx_stamp);


--
-- Name: invc_trm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_trm_txstmp ON invoice_term USING btree (last_updated_tx_stamp);


--
-- Name: invce_trm_invce; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_trm_invce ON invoice_term USING btree (invoice_id);


--
-- Name: invce_trm_trm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_trm_trm ON invoice_term USING btree (term_type_id);


--
-- Name: invoice_term invce_trm_invce; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_term
    ADD CONSTRAINT invce_trm_invce FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);


--
-- Name: invoice_term invce_trm_trm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_term
    ADD CONSTRAINT invce_trm_trm FOREIGN KEY (term_type_id) REFERENCES term_type(term_type_id);


--
-- PostgreSQL database dump complete
--

