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
-- Name: agreement_term; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE agreement_term (
    agreement_term_id character varying(20) NOT NULL,
    term_type_id character varying(20),
    agreement_id character varying(20),
    agreement_item_seq_id character varying(20),
    invoice_item_type_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    term_value numeric(18,3),
    term_days numeric(20,0),
    text_value character varying(255),
    min_quantity double precision,
    max_quantity double precision,
    description character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.agreement_term OWNER TO ofbiz;

--
-- Name: agreement_term pk_agreement_term; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_term
    ADD CONSTRAINT pk_agreement_term PRIMARY KEY (agreement_term_id);


--
-- Name: agrmnt_term_agr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_term_agr ON agreement_term USING btree (agreement_id);


--
-- Name: agrmnt_term_aitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_term_aitm ON agreement_term USING btree (agreement_id, agreement_item_seq_id);


--
-- Name: agrmnt_term_iit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_term_iit ON agreement_term USING btree (invoice_item_type_id);


--
-- Name: agrmnt_term_ttyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_term_ttyp ON agreement_term USING btree (term_type_id);


--
-- Name: agrmnt_trm_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_trm_txcrts ON agreement_term USING btree (created_tx_stamp);


--
-- Name: agrmnt_trm_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX agrmnt_trm_txstmp ON agreement_term USING btree (last_updated_tx_stamp);


--
-- Name: agreement_term agrmnt_term_agr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_term
    ADD CONSTRAINT agrmnt_term_agr FOREIGN KEY (agreement_id) REFERENCES agreement(agreement_id);


--
-- Name: agreement_term agrmnt_term_aitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_term
    ADD CONSTRAINT agrmnt_term_aitm FOREIGN KEY (agreement_id, agreement_item_seq_id) REFERENCES agreement_item(agreement_id, agreement_item_seq_id);


--
-- Name: agreement_term agrmnt_term_iit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_term
    ADD CONSTRAINT agrmnt_term_iit FOREIGN KEY (invoice_item_type_id) REFERENCES invoice_item_type(invoice_item_type_id);


--
-- Name: agreement_term agrmnt_term_ttyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY agreement_term
    ADD CONSTRAINT agrmnt_term_ttyp FOREIGN KEY (term_type_id) REFERENCES term_type(term_type_id);


--
-- PostgreSQL database dump complete
--

