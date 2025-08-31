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
-- Name: deduction; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE deduction (
    deduction_id character varying(20) NOT NULL,
    deduction_type_id character varying(20),
    payment_id character varying(20),
    amount numeric(18,2),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.deduction OWNER TO ofbiz;

--
-- Name: deduction pk_deduction; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY deduction
    ADD CONSTRAINT pk_deduction PRIMARY KEY (deduction_id);


--
-- Name: dedctn_dedtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dedctn_dedtyp ON deduction USING btree (deduction_type_id);


--
-- Name: dedctn_pmnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX dedctn_pmnt ON deduction USING btree (payment_id);


--
-- Name: deduction_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX deduction_txcrts ON deduction USING btree (created_tx_stamp);


--
-- Name: deduction_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX deduction_txstmp ON deduction USING btree (last_updated_tx_stamp);


--
-- Name: deduction dedctn_dedtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY deduction
    ADD CONSTRAINT dedctn_dedtyp FOREIGN KEY (deduction_type_id) REFERENCES deduction_type(deduction_type_id);


--
-- Name: deduction dedctn_pmnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY deduction
    ADD CONSTRAINT dedctn_pmnt FOREIGN KEY (payment_id) REFERENCES payment(payment_id);


--
-- PostgreSQL database dump complete
--

